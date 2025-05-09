#!/bin/bash

set -e

source "hc_install_product.sh"

function copy_certs {
    log 'Copying Vault certificates ...'

    sudo mkdir -p $vault_config_certs
    sudo cp ./ca-chain.cert.pem $vault_config_certs/
    sudo cp ./vault.lan.key.pem $vault_config_certs/
    sudo cp ./vault.lan.cert.pem $vault_config_certs/
    sudo chown -R $user:$group $vault_config_certs
}

# Function to log messages
log() {
    local timestamp=$(date +'[%Y-%m-%d %H:%M:%S]')
    sudo su -c "echo \"$timestamp $1\" | tee -a \"$LOG_FILE\" > /dev/null"

    printf "\n%s" \
        "$1" \
        ""
}

DIR="$(pwd "$0")"
logs_dir="/var/log"

LOG_FILE="$logs_dir/vault_$(date +'%Y%m%d_%H%M%S').log"

log 'HC Vault Script'

vault_config_folder=/etc/vault.d
vault_data_folder=/var/lib/vault
vault_config_certs=$vault_config_folder/certs

user=vault
group=vault

#Check if Vault is already installed (e.g. apt install thru cloud-init)
if ! command -v vault >/dev/null
then
    log 'Installing Vault via Hashicorp script ...'
    
    install "vault" "1.19.2"

    sudo mkdir -p $vault_config_folder

    sudo setcap cap_ipc_lock=+ep $(readlink -f $(which vault))

    sudo chown $user:$group $vault_config_folder
fi

sudo mkdir -p $vault_data_folder
sudo chown -R vault:vault $vault_data_folder

copy_certs