echo 'Deleting authorized SSH keys and locking packer user ...'
rm .ssh/authorized_keys
sudo usermod -L packer
sudo passwd -d packer

sudo sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config.d/01-harden-ssh.conf

sudo cp ./ca_user_key.pub /etc/ssh

# https://computingforgeeks.com/creating-ubuntu-and-debian-os-template-on-proxmox-ve/
sudo hostnamectl set-hostname localhost.localdomain

sudo su -c 'cat /dev/null > /etc/machine-id'
sudo su -c 'cat /dev/null > /var/lib/dbus/machine-id'

sudo cloud-init clean

echo 'Deleting SSH host keys ...'
sudo rm -f /etc/ssh/ssh_host_*
sudo rm -rf /root/.ssh/

# echo 'Setting crontab for root user to recreate SSH host keys ...'
# sudo tee /var/spool/cron/crontabs/root <<EOF
# @reboot /root/ssh_host_keys.sh
# EOF

# sudo chmod 600 /var/spool/cron/crontabs/root
