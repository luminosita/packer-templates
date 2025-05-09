#!/bin/bash

set -e

create_tls_peers() {
	for peer in ${peer_addrs[@]};
	do
        if [ $peer != $ip ]; then
            peers+=$(cat <<EOF
    retry_join {
        leader_api_addr             = "https://$peer:$port"
        leader_ca_cert_file         = "$vault_config_certs/ca-chain.cert.pem"
        leader_client_cert_file     = "$vault_config_certs/vault.lan.cert.pem"
        leader_client_key_file      = "$vault_config_certs/vault.lan.key.pem"
    }
EOF
            )

            peers+=$'\n'
        fi
	done
}

create_non_tls_peers() {
	for peer in ${peer_addrs[@]};
	do
        if [ $peer != $ip ]; then
            peers+=$(cat <<EOF
    retry_join {
        leader_api_addr             = "http://$peer:$port"
    }
EOF
            )

            peers+=$'\n'
        fi
	done
}

create_tls_config() {
    log "Creating main config ($vault_config_file)"

    create_tls_peers "$@"

    tee $vault_config_file > /dev/null <<EOF
ui                      = true
log_level               = "trace"
api_addr                = "https://$ip:$port"
cluster_addr            = "https://$ip:$cport"
disable_mlock           = true
disable_cache           = true
cluster_name            = "$cluster_name"

listener "tcp" {
   address              = "0.0.0.0:$port"
   tls_disable          = false
   tls_cert_file        = "$vault_config_certs/vault.lan.cert.pem"
   tls_key_file         = "$vault_config_certs/vault.lan.key.pem"
   tls_client_ca_file   = "$vault_config_certs/ca-chain.cert.pem"
#   tls_cipher_suites    = "TLS_TEST_128_GCM_SHA256,TLS_TEST_128_GCM_SHA256,TLS_TEST20_POLY1305,TLS_TEST_256_GCM_SHA384,TLS_TEST20_POLY1305,TLS_TEST_256_GCM_SHA384"
}

storage "raft" {
    path        = "$vault_data_folder"
    node_id     = "$node_id"

$peers
}
EOF
}

create_non_tls_config() {
    log "Creating main config ($vault_config_file)"

    create_non_tls_peers "$@"

    tee $vault_config_file > /dev/null <<EOF
ui                      = true
log_level               = "info"
api_addr                = "http://$ip:$port"
cluster_addr            = "http://$ip:$cport"
disable_mlock           = true
disable_cache           = true
cluster_name            = "$cluster_name"

listener "tcp" {
   address              = "0.0.0.0:8200"
   tls_disable          = true
}

storage "raft" {
    path        = "$vault_data_folder"
    node_id     = "$node_id"

$peers
}
EOF
}

usage() {
	# Display Help
	echo "Create Vault configuration files"
	echo
	echo "Syntax: $script_name -n|p|c"
	echo "  -n     Node name."
	echo "  -p     Peer URLs. Allowed multiple flag usage for each IP."
	echo "  -c     Cluster Name."
	echo " "
}

get_ip() {
    _int="ens18"

    _os_name=$(cat /etc/os-release | grep -e "^ID=" | sed -e "s/ID=//")
    if [ $_os_name == "ubuntu" ] || [ $_os_name == "debian" ]; then
        _int="ens18"
    elif [ $_os_name == "alpine" ]; then
        _int="eth0"
    else
        log "Unsupported OS !!!"

        exit 1
    fi    

    echo $(ip a show dev $_int | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*')
}

# Function to log messages
log() {
    local timestamp=$(date +'[%Y-%m-%d %H:%M:%S]')
    sudo su -c "echo \"$timestamp $1\" | tee -a \"$LOG_FILE\" > /dev/null"

    printf "\n%s" \
        "$1" \
        ""
    sleep 2 # Added for human readability
}

DIR="$(pwd "$0")"
logs_dir="/var/log"
tmp_dir="/tmp"

LOG_FILE="$logs_dir/vault_$(date +'%Y%m%d_%H%M%S').log"

while getopts ":n:p:c:" o; do
    case "${o}" in
        n)
            echo "Node ID: ${OPTARG}"
            node_id=${OPTARG}
            ;;
        p)
            echo "Peer URLs: ${OPTARG}"
	        peer_addrs+=(${OPTARG})
            ;;
        c)
            echo "Cluster Name: ${OPTARG}"
	        cluster_name=(${OPTARG})
            ;;
        *)
            usage

            exit 1
            ;;
    esac
done

shift $((OPTIND-1))

if [ -z "$node_id" ] || [ -z "$cluster_name" ] || [ -z "$peer_addrs" ]; then
    usage
    exit 1
fi

ip=$(get_ip)

port=8200
cport=8201

user=vault
group=vault

product=vault

vault_config="/etc/vault.d"
vault_config_certs="$vault_config/certs"
vault_config_file="$vault_config/vault.hcl"
vault_data_folder="/var/lib/vault"

peers=""
declare -A peers_addrs

create_tls_config "@0"

sudo chown -R vault:vault $vault_config

