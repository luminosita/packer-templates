#!/bin/bash

set -e

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

LOG_FILE="$logs_dir/final_$(date +'%Y%m%d_%H%M%S').log"

log 'Final Script'

log 'Disabling SSH Password Authentication ...'
sudo sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config.d/01-harden-ssh.conf

log 'Copying SSH CA Public Key ...'
sudo cp ./ca_key.pub /etc/ssh
sudo chown 1000:1000 /etc/ssh/ca_key.pub
sudo chmod 644 /etc/ssh/ca-key.pub

# https://computingforgeeks.com/creating-ubuntu-and-debian-os-template-on-proxmox-ve/
log 'Template Cleanup ...'
sudo su -c 'echo "localhost.localdomain" > /etc/hostname'

sudo su -c 'cat /dev/null > /etc/machine-id'

sudo mkdir -p /var/lib/dbus
sudo su -c 'cat /dev/null > /var/lib/dbus/machine-id'

sudo cloud-init clean

log 'Disabling Cloud Init Services ...'

sudo touch /etc/cloud/cloud-init.disabled

# os_name=$(cat /etc/os-release | grep -e "^ID=" | sed -e "s/ID=//")
# if [ $os_name == "ubuntu" ] || [ $os_name == "debian" ]; then
#     sudo systemctl disable cloud-init cloud-config cloud-init-hotplugd
# elif [ $os_name == "alpine" ]; then
#     sudo rc-update del cloud-init 
#     sudo rc-update del cloud-config 
#     sudo rc-update del cloud-init-hotplugd
# else
#     log "Unsupported OS !!!"

#     exit 1
# fi

log 'Deleting SSH host keys ...'
sudo rm -f /etc/ssh/ssh_host_*
sudo rm -rf /root/.ssh/

log 'Deleting authorized SSH keys and locking packer user ...'
rm .ssh/authorized_keys
sudo usermod -L packer
sudo passwd -d packer
