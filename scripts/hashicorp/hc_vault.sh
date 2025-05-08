#!/bin/bash

source "hc_install_product.sh"

function copy_certs {
    sudo cp ./ca-chain.cert.pem $vault_config_certs/
    sudo cp ./vault.lan.key.pem $vault_config_certs/
    sudo cp ./vault.lan.cert.pem $vault_config_certs/
}

install "vault" "1.19.2"

user=vault
group=vault

vault_config_folder=/etc/vault.d
vault_config_certs=$vault_config_folder/certs
vault_data_folder=/var/lib/vault

sudo mkdir -p $vault_config_folder
sudo mkdir -p $vault_data_folder
sudo mkdir -p $vault_config_certs

sudo setcap cap_ipc_lock=+ep $(readlink -f $(which vault))

copy_certs

sudo chown -R $user:$group $vault_config_folder
