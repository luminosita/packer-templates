#!/bin/bash

source "hc_install_product.sh"

install "vault" "1.19.2"

user=vault
group=vault

vault_config_folder=/etc/vault.d
vault_data_folder=/var/lib/vault
sudo mkdir -p $vault_config_folder
sudo mkdir -p $vault_data_folder
sudo chown $user:$group $vault_config_folder
sudo chown $user:$group $vault_data_folder
sudo setcap cap_ipc_lock=+ep $(readlink -f $(which vault))

