#!/bin/bash

source "hc_install_product.sh"

install "vault-ssh-helper" "0.2.1"

sudo setcap cap_ipc_lock=+ep $(readlink -f $(which vault-ssh-helper))

echo 'Installing Vault TLS certificate'
sudo mv ./vault.crt /etc/vault-ssh-helper.d/vault.crt
sudo chown root:root /etc/vault-ssh-helper.d/vault.crt

sudo sed -i "s/\@include common-account/\@include vault-ssh-helper/" /etc/pam.d/sshd