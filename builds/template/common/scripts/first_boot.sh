#!/bin/bash

LOG_FILE="/var/log/first_boot.log"

log() {
    local timestamp=$(date +'[%Y-%m-%d %H:%M:%S]')
    echo "$timestamp $1" | tee -a "$LOG_FILE" > /dev/null
}

if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    log "Generating SSH host keys ..."

    ssh-keygen -q -N "" -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key
    ssh-keygen -q -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
    ssh-keygen -q -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
fi

#Delete Packer user on first boot
if id "packer" >/dev/null 2>&1; then
    log "Deleting Packer user ..."
    
    userdel -rf packer
fi