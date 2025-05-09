usage() {
	# Display Help
	echo "Create Vault configuration files"
	echo
	echo "Syntax: $script_name setup|destroy|vip [-u]"
    echo " Setup Options:"
    echo "  -u     Upload local node setup script"
    echo " Destroy Options:"
    echo " Vip Options:"
    echo " Environment:"
    echo "   Configuration: ./cluster.yaml "
	echo " "
}

keepalived_config() {
    if [ $1 == 0 ]; then
        state="MASTER"
    else
        state="BACKUP"
    fi

    echo "vrrp_instance VI_1 {
        state $state
        interface ${2}
        virtual_router_id 51
        priority $((255 - $1))
        advert_int 1
        authentication {
            auth_type PASS
            auth_pass 12345
        }
        virtual_ipaddress {
            ${3}
        }
    }"
}

vault_srv() {
    ( export VAULT_ADDR="https://$vault_addr:8200" && export VAULT_CACERT="$cert" && vault "$@" )
}

vault_cluster_status() {
    ( export VAULT_ADDR="https://${arr_addrs[0]}:8200" && export VAULT_CACERT="$cert" && vault operator raft list-peers )
}

vault_node_exec() {
    ( ssh -i ~/.ssh/id_test_rsa vault@$vault_addr "$@" )
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

# Function to log messages
log() {
    local timestamp=$(date +'[%Y-%m-%d %H:%M:%S]')
    echo "$timestamp $1" | tee -a "$LOG_FILE" > /dev/null

    printf "\n%s" \
        "$1" \
        ""
    sleep 2 # Added for human readability
}

DIR="$(pwd "$0")"
logs_dir="$DIR/logs"
tmp_dir="/tmp/vault"
LOG_FILE="$logs_dir/vault_cluster_$(date +'%Y%m%d_%H%M%S').log"

if [ -z "$1" ]; then usage; fi

command=$1

shift 1

upload=false

while getopts ":u:" o; do
    case "${o}" in
        u)
            echo "Upload new node setup script: ${OPTARG}"
            upload=true
            ;;
        *)
            usage

            exit 1
            ;;
    esac
done

shift $((OPTIND-1))

if [ ! -f "./cluster.yaml" ]; then
    usage
    exit 1
fi

mkdir -p $logs_dir
mkdir -p $tmp_dir

config=$(cat cluster.yaml)
cluster=$(echo "$config" | yq '.cluster')
vip=$(echo "$config" | yq '.vip')
cert=$(cat $(echo "$config" | yq '.certificate'))
addrs=$(echo "$config" | yq '.nodes[].address')
names=$(echo "$config" | yq '.nodes[].name')
oss=$(echo "$config" | yq '.nodes[].os')

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
        log "Uploading new Vault node script ..."
        
        scp -i ~/.ssh/id_test_rsa hc_vault_node_setup.sh vault@$vault_addr:./
        vault_node_exec "sudo mv ./hc_vault_node_setup.sh /usr/local/bin/"
        vault_node_exec "sudo chmod 755 /usr/local/bin/hc_vault_node_setup.sh"
    fi

    if [ $command == "destroy" ]; then
        log "Destroying Vault node ($vault_addr) ..."

        if [ $os != "alpine" ]; then 
            vault_node_exec "sudo systemctl stop vault"
        else
            vault_node_exec "sudo rc-service vault stop"
        fi

        vault_node_exec "sudo rm -f /var/lib/vault/vault.db && sudo rm -rf /var/lib/vault/raft"
    elif [ $command == "setup" ]; then
        if [ -z "$cert" ]; then
            usage
            exit 1
        fi

        log "Setting up Vault node ($vault_addr) ..."

        vault_node_exec "hc_vault_node_setup.sh -c $cluster -n $vault_node_name$ip_flag"
        
        if [ $os != "alpine" ]; then 
            vault_node_exec "sudo systemctl daemon-reload"
            vault_node_exec "sudo systemctl enable vault"
            vault_node_exec "sudo systemctl restart vault"
        else
            vault_node_exec "sudo rc-update add vault"
            vault_node_exec "sudo rc-service vault restart"
        fi

        log "Waiting on Vault to start ..."
        sleep 3

        if [ $os != "alpine" ]; then 
            vault_node_exec "systemctl status vault"
        else
            vault_node_exec "rc-status"
        fi

        log "Unsealing Vault node ($vault_addr) ..."

        unseal
    elif [ $command == "vip" ]; then
        if [ -z "$vip" ]; then
            usage
            exit 1
        fi

        log "Setting up Vault node VIP ($vault_addr) ..."

        if [ $os != "alpine" ]; then 
            echo "$(keepalived_config $i "ens18" $vip)" | tee ./vip_$i.info > /dev/null
        else
            echo "$(keepalived_config $i "eth0" $vip)" | tee ./vip_$i.info > /dev/null
        fi

        scp -i ~/.ssh/id_test_rsa $tmp_dir/vip_$i.info vault@$vault_addr:./
        vault_node_exec "sudo mv ./vip_$i.info /etc/keepalived/keepalived.conf"
        vault_node_exec "sudo chmod 644 /etc/keepalived/keepalived.conf"

        if [ $os != "alpine" ]; then 
            vault_node_exec "sudo systemctl enable keepalived"
            vault_node_exec "sudo systemctl restart keepalived"
        else
            vault_node_exec "sudo rc-update add keepalived"
            vault_node_exec "sudo rc-service keepalived restart"
        fi

        log "Waiting on Vault to start ..."
    else
        usage
    fi
done

if [ $command == "setup" ]; then
    echo ""
    echo "-------------------------"
    echo "Cluster Info:"
    echo "-------------------------"
    echo ""

    vault_cluster_status
fi