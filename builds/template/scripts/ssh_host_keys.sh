#!/bin/bash

LOG_FILE="/var/log/ssh-host-keys.log"

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