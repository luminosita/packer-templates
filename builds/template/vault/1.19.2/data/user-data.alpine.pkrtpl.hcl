#cloud-config
chpasswd:
  expire: false
package_reboot_if_required: true
package_update: true
package_upgrade: true
packages:
- qemu-guest-agent
- sudo
- bash
- jq
- openssl
- curl
- gpg
- vim
- gnupg
- libcap-setcap
plain_text_passwd: VagTbNI5uxwST
runcmd:
- rc-update add qemu-guest-agent
- bash /root/install_vault.sh
ssh_authorized_keys:
- ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFbfs3Ga7TDc5UrcGR4Ujs/s6vbWGXzNeizYaYe3qkANHrY3HM3D2BFKwH+VGukXdYtPT5jkBxX38/739NYCYTtXoD9OsA8bD4DoHajtcJrbp6ZYMwnFvnpIrT3GvmM8KWFKbOWAVQY2rc1tIuObLZciS+pUfSloEf4KHbWth/rBA/sPZEwBJHjHacMGdevNb1RdKIwu6K1qHu9jvtsZswxNalINQb9unYnkJ7yoOrV/weASv/NEDEGJreJ7o1nS9VRAVPgJd0pcWOxRHbvAOwkW20oQ2mU0LMHw+RcSS+IY22g4fXrgxMXx+eEC6wSY7Y6v9Pw0e+qeFDNVJ2hMfo2f2iMgK+21Je8/gXAxTNdEpu64DWKQeplLEyb4ksEBLq/CrcH3bfZNoxOris/g+meXm/J+U11sFbBAFFwh4prf7o4PZZFqhjxck4p95pl+kpL5oy/qiG4qUteUTgizQKZkjK85YWhcLTYsDltjVxYArKrUYuEZQA7awgn6aXnauhzXeT+aCCL6yBzuYSsLK+KYGwdOtBu0hdn0i1d4aCkI+2KlAdEPMrtDsbv8n9JWWQmQkQVSwaTWvVQpMeSRfqOjZLRXtkQHcjCR3tUbE4XG4d7dyDD1iCsEA2i8BQXzxdGGyu4NsDo368k8m7h9NT1vJkEOuTtsXYDNkRXm/54Q== milosh@Gianni
ssh_pwauth: false
users:
- default
- lock_passwd: false
  name: vault
  plain_text_passwd: VagTbNI5uxwST
  ssh_authorized_keys:
  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFbfs3Ga7TDc5UrcGR4Ujs/s6vbWGXzNeizYaYe3qkANHrY3HM3D2BFKwH+VGukXdYtPT5jkBxX38/739NYCYTtXoD9OsA8bD4DoHajtcJrbp6ZYMwnFvnpIrT3GvmM8KWFKbOWAVQY2rc1tIuObLZciS+pUfSloEf4KHbWth/rBA/sPZEwBJHjHacMGdevNb1RdKIwu6K1qHu9jvtsZswxNalINQb9unYnkJ7yoOrV/weASv/NEDEGJreJ7o1nS9VRAVPgJd0pcWOxRHbvAOwkW20oQ2mU0LMHw+RcSS+IY22g4fXrgxMXx+eEC6wSY7Y6v9Pw0e+qeFDNVJ2hMfo2f2iMgK+21Je8/gXAxTNdEpu64DWKQeplLEyb4ksEBLq/CrcH3bfZNoxOris/g+meXm/J+U11sFbBAFFwh4prf7o4PZZFqhjxck4p95pl+kpL5oy/qiG4qUteUTgizQKZkjK85YWhcLTYsDltjVxYArKrUYuEZQA7awgn6aXnauhzXeT+aCCL6yBzuYSsLK+KYGwdOtBu0hdn0i1d4aCkI+2KlAdEPMrtDsbv8n9JWWQmQkQVSwaTWvVQpMeSRfqOjZLRXtkQHcjCR3tUbE4XG4d7dyDD1iCsEA2i8BQXzxdGGyu4NsDo368k8m7h9NT1vJkEOuTtsXYDNkRXm/54Q== milosh@Gianni
- lock_passwd: false
  name: packer      #Required for Packer
  plain_text_passwd: VagTbNI5uxwST
  ssh_authorized_keys:  
  - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDVZwrtkO/qrENgxZFmtoh1v4nypoNhyI6cruNNrYvnGE+l6+WgtDKDKQF3iFZegP0Uk7t+rRKFrFikVfJcm5wONjgrQ2N4xvuNdKSHzaFdWQtfNNmM3ePCFZNrJ3qhJmZ2UnIqbv1x5PoEbRk/b/tDrrAxJCXJgkrx+0EE3qUJREeyn8CiVgk6izxnramAaLEocpqPn0dGi1NtSHACMDf+YTq31gPMd41MkpjjqMgMG/4rON7mDoQl4VIaTH/fWVbDzZhmYg2jF3IKqaygJb9nRhGyKqfDpTxp+acPxo0juzpcNrcbM1awIy8izdwsLsrt4bxAxVTUT/B6+Lpys/jkTHaiBmAZHY20nAyxGdsaFg33N+x0nogJoDMwPpj9PknOe61AOaBYhpNLf6L9ZIHfoJ07P5jkT74pZaHbdSLeR8LBJif2bSufvmjAsN5SL37CdlxwJE6Ov3zf5tOvxjDOi/Foyj41+RS4HfVxdHVIiEh1fuqkJBCoIhX/dGoaTsFKmnQ3bmSrkRyAB0WSHOjqnkj/bpT3eWA1e4TCdTKdMAqcLhufSeftc7evcoh3nuX2LUd32p9XxHuIUKYB3iobl6QRIrep7QKYM2IZlFPV+nAC+Pvfzuv2u+aJvq3hnmC2eiCFXVYmowi1epwLeZ848yR+e2ikkIRbbMWLWGVLQ== milosh@gianni
power_state:
  delay: now
  mode: reboot
  message: Rebooting after cloud-init completion
  condition: true
write_files:
- content: |
    PermitRootLogin no
    PasswordAuthentication no
    ChallengeResponseAuthentication yes
    UsePAM yes
  path: /etc/ssh/sshd_config.d/01-harden-ssh.conf
- content: |
    vault ALL=(ALL) NOPASSWD:ALL
    packer ALL=(ALL) NOPASSWD:ALL     #Required for Packer
  path: /etc/sudoers.d/vault
- content: |-
    #!/bin/bash

    install() {
      wget https://releases.hashicorp.com/$1/$2/$1_$2_linux_amd64.zip && \
        wget https://releases.hashicorp.com/$1/$2/$1_$2_SHA256SUMS && \
        wget https://releases.hashicorp.com/$1/$2/$1_$2_SHA256SUMS.sig && \
        wget -qO- https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import && \
        gpg --verify $1_$2_SHA256SUMS.sig $1_$2_SHA256SUMS && \
        grep $1_$2_linux_amd64.zip $1_$2_SHA256SUMS | sha256sum -c && \
        unzip $1_$2_linux_amd64.zip -d /tmp && \
        mv /tmp/$1 /usr/local/bin/$1 && \
        rm -f $1_$2_linux_amd64.zip $1_$2_SHA256SUMS $1_$2_SHA256SUMS.sig && \
        rm -f /tmp/LICENSE.txt
    }

    install "vault" "1.19.2"
    install "vault-ssh-helper" "0.2.1"

    user=vault
    group=vault
    vault_config_folder=/etc/vault.d
    vault_config_file="$vault_config_folder/vault.hcl"
    vault_data_folder=/var/lib/vault
    mkdir -p $vault_config_folder
    mkdir -p $vault_data_folder
    chown $user:$group $vault_config_folder
    chown $user:$group $vault_data_folder
    setcap cap_ipc_lock=+ep $(readlink -f $(which vault))
    setcap cap_ipc_lock=+ep $(readlink -f $(which vault-ssh-helper))
  path: "/root/install_vault.sh"
  owner: "root:root"
  permissions: "0755"
- content: |-
    vault_addr = "${vault_api_url}"
    ssh_mount_point = "ssh"
    ca_cert = "/etc/vault-ssh-helper.d/vault.crt"
    tls_skip_verify = false
    allowed_roles = "*"
  path: "/etc/vault-ssh-helper.d/config.hcl"
  owner: "root:root"
  permissions: "0644"
- content: |-
    #!/sbin/openrc-run

    name=$RC_SVCNAME
    cfgfile="/etc/vault.d/vault.hcl"
    command="/usr/local/bin/vault"
    command_args="server -config=/etc/vault.d/vault.hcl"
    command_user="vault"
    command_group="vault"
    command_background=true
    pidfile="/run/vault/vault.pid"

    depend() {
      need net
    }

    start_pre() {
      checkpath --directory --owner $command_user:$command_group --mode 0775 /run/$RC_SVCNAME
    }
  path: "/etc/init.d/vault"
  owner: "root:root"
  permissions: "0755"
