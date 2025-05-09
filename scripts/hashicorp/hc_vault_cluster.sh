usage() {
	# Display Help
	echo "Create Vault configuration files"
	echo
	echo "Syntax: $script_name setup|destroy -f|c|u"
	echo "  -f     Configuration file."
    echo "  -c     Certificate file."
    echo "  -u     Upload local node setup script"
	echo " "
}

vault_srv() {
    ( export VAULT_ADDR="https://$vault_addr:8200" && export VAULT_CACERT="$cert" && vault "$@" )
}

unseal() {
    if [ ! -f unseal_key-vault_1 ]; then
        INIT_RESPONSE=$(vault_srv operator init -format=json)

        UNSEAL_KEY_1=$(echo "$INIT_RESPONSE" | jq -r .unseal_keys_b64[0])
        UNSEAL_KEY_2=$(echo "$INIT_RESPONSE" | jq -r .unseal_keys_b64[1])
        UNSEAL_KEY_3=$(echo "$INIT_RESPONSE" | jq -r .unseal_keys_b64[2])
        VAULT_TOKEN=$(echo "$INIT_RESPONSE" | jq -r .root_token)

        vault_srv operator unseal "$UNSEAL_KEY_1"
        vault_srv operator unseal "$UNSEAL_KEY_2"
        vault_srv operator unseal "$UNSEAL_KEY_3"

        echo "$UNSEAL_KEY_1" > unseal_key-vault_1
        echo "$UNSEAL_KEY_2" > unseal_key-vault_2
        echo "$UNSEAL_KEY_3" > unseal_key-vault_3
        echo "$VAULT_TOKEN" > root_token-vault
    else
        UNSEAL_KEY_1=$(cat unseal_key-vault_1)
        UNSEAL_KEY_2=$(cat unseal_key-vault_2)
        UNSEAL_KEY_3=$(cat unseal_key-vault_3)
        export VAULT_TOKEN=$(cat root_token-vault)

        vault_srv operator unseal "$UNSEAL_KEY_1"
        vault_srv operator unseal "$UNSEAL_KEY_2"
        vault_srv operator unseal "$UNSEAL_KEY_3"
    fi
}

command=$1

shift 1

upload=false

while getopts ":f:c:u:" o; do
    case "${o}" in
        f)
            echo "Configuration: ${OPTARG}"
            config=${OPTARG}
            ;;
        c)
            echo "Certificate: ${OPTARG}"
            cert=${OPTARG}
            ;;
        u)
            echo "Upload new node setup script: true"
            upload=true
            ;;
        *)
            usage

            exit 1
            ;;
    esac
done

shift $((OPTIND-1))

if [ -z "$config" ] || [ -z "$cert" ]; then
    usage
    exit 1
fi

cluster=$(cat $config | yq '.cluster')
addrs=$(cat $config | yq '.nodes[].address')
names=$(cat $config | yq '.nodes[].name')
oss=$(cat $config | yq '.nodes[].os')

ip_flag=""
vault_addr=""

declare -a arr_addrs
declare -a arr_names
declare -a arr_oss

for addr in $addrs; do
    ip_flag+=" -p $addr"
    arr_addrs+=("$addr")
done

for name in $names; do
    arr_names+=("$name")
done

for os in $oss; do
    arr_oss+=("$os")
done

if [ $command == "destroy" ]; then
    rm root_token-vault
    rm unseal_key-vault_*
fi

for i in "${!arr_addrs[@]}"; do 
    vault_addr=${arr_addrs[$i]}
    vault_node_name=${arr_names[$i]}
    os=${arr_oss[$i]}

    #Upload changed copy of vault config script
    if  $upload; then
        scp -i ~/.ssh/id_test_rsa hc_vault_node_setup.sh vault@$vault_addr:./
        ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo mv ./hc_vault_node_setup.sh /usr/local/bin/"
        ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo chown 755 /usr/local/bin/hc_vault_node_setup.sh"
    fi

    if [ $command == "destroy" ]; then
        if [ $os != "alpine" ]; then 
            ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo systemctl stop vault"
        else
            ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo rc-service vault stop"
        fi

        ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo rm -f /var/lib/vault/vault.db && sudo rm -rf /var/lib/vault/raft"
    elif [ $command == "setup" ]; then
        ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "hc_vault_node_setup.sh -c $cluster -n $vault_node_name$ip_flag"
        
        if [ $os != "alpine" ]; then 
            ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo systemctl daemon-reload"
            ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo systemctl enable vault"
            ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo systemctl restart vault"
        else
            ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo rc-update add vault"
            ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo rc-service vault restart"
        fi

        echo "Waiting on Vault to start ..."
        sleep 5

        if [ $os != "alpine" ]; then 
            ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "systemctl status vault"
        else
            ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "rc-status"
        fi

        unseal
    else
        usage
    fi
done
