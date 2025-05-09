#!/bin/bash

set -e

source "hc_install_product.sh"

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

log 'HC Vault SSH Helper Script'

install "vault-ssh-helper" "0.2.1"

sudo setcap cap_ipc_lock=+ep $(readlink -f $(which vault-ssh-helper))

log 'Installing Vault TLS certificate'
sudo mv ./vault.crt /etc/vault-ssh-helper.d/vault.crt
sudo chown root:root /etc/vault-ssh-helper.d/vault.crt

os_name=$(cat /etc/os-release | grep -e "^ID=" | sed -e "s/ID=//")

if [ $os_name == "ubuntu" ] || [ $os_name == "debian" ]; then
   sudo sed -i "s/\@include common-auth/#\@include common-auth/" /etc/pam.d/sshd
   sudo tee -a /etc/pam.d/sshd <<EOF
@include vault-ssh-helper
EOF
elif [ $os_name == "alpine" ]; then
   sudo sed -i "s/auth *include *base-auth/#auth include base-auth/" /etc/pam.d/sshd
   sudo tee -a /etc/pam.d/sshd <<EOF
auth include vault-ssh-helper
EOF
else
    log "Unsupported OS !!!"

    exit 1
fi