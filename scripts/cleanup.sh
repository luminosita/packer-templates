echo 'Performing cleanup ...'
rm .ssh/authorized_keys
sudo usermod -L packer
sudo passwd -d packer
