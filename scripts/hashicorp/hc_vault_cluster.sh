usage() {
	# Display Help
	echo "Create Vault configuration files"
	echo
	echo "Syntax: $script_name -f|c"
	echo "  -f     Configuration file."
    echo "  -c     Certificate file."
	echo " "
}

vault_srv() {
    ( export VAULT_ADDR="https://$vault_addr:8200" && export VAULT_CACERT="$cert" && vault "$@" )
}

unseal() {
    if [ ! -f unseal_key-vault ]; then
        INIT_RESPONSE=$(vault_srv operator init -format=json  -key-shares=1 -key-threshold=1)

        UNSEAL_KEY=$(echo "$INIT_RESPONSE" | jq -r .unseal_keys_b64[0])
        VAULT_TOKEN=$(echo "$INIT_RESPONSE" | jq -r .root_token)

        vault_srv operator unseal "$UNSEAL_KEY"

        echo "$UNSEAL_KEY" > unseal_key-vault
        echo "$VAULT_TOKEN" > root_token-vault
    else
        UNSEAL_KEY=$(cat unseal_key-vault)
        export VAULT_TOKEN=$(cat root_token-vault)
        vault_srv operator unseal "$UNSEAL_KEY"
    fi
}

while getopts ":f:c:" o; do
    case "${o}" in
        f)
            echo "Configuration: ${OPTARG}"
            config=${OPTARG}
            ;;
        c)
            echo "Certificate: ${OPTARG}"
            cert=${OPTARG}
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

ip_flag=""
vault_addr=""

declare -a arr_addrs
declare -a arr_names

for addr in $addrs; do
    ip_flag+=" -p $addr"
    arr_addrs+=("$addr")
done

for name in $names; do
    arr_names+=("$name")
done

for i in "${!arr_addrs[@]}"; do 
    vault_addr=${arr_addrs[$i]}
    vault_node_name=${arr_names[$i]}

    ssh -i ~/.ssh/id_test_rsa vault@$vault_addr"hc_create_vault_config.sh -c $cluster -n $vault_node_name$ip_flag"
    ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "sudo systemctl restart vault"

    echo "Waiting on Vault to start ..."
    sleep 5

    ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "systemctl status vault"

    unseal
done
