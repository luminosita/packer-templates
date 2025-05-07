#!/bin/bash
echo "SSH host key script"

if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    echo "Generating SSH host keys ..."

    ssh-keygen -q -N "" -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key
    ssh-keygen -q -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
    ssh-keygen -q -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
fi