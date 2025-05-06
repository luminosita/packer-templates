echo 'Deleting authorized SSH keys and locking packer user ...'
rm .ssh/authorized_keys
sudo usermod -L packer
sudo passwd -d packer

sudo sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config.d/01-harden-ssh.conf

sudo cp ./ca_user_key.pub /etc/ssh

echo 'Deleting SSH host keys ...'
sudo rm -f /etc/ssh/ssh_host_*

echo 'Setting crontab for root user to recreate SSH host keys ...'
sudo tee -a /var/spool/cron/crontabs/root <<EOF
@reboot /root/ssh_host_keys.sh
EOF

sudo chmod 600 /var/spool/cron/crontabs/root

