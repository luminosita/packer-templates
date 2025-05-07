#cloud-config
package_update: true
package_upgrade: true
users:
- default
- lock_passwd: false
  name: ${username}
  passwd: ${random_pass}
  shell: /bin/bash
- lock_passwd: false
  name: ${build_username}      #Required for Packer
  passwd: ${build_password_encrypted}
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
- unzip
${packages}
runcmd:
${run_commands}
write_files:
- content: |
    ${indent(4, file(ssh_host_keys_script))} 
  path: /root/ssh_host_keys.sh
  permissions: "0755"
- content: |
    PermitRootLogin no
    PasswordAuthentication yes
    ChallengeResponseAuthentication yes
    UsePAM yes

    TrustedUserCAKeys /etc/ssh/ca_user_key.pub
  path: /etc/ssh/sshd_config.d/01-harden-ssh.conf
- content: |
    ${username} ALL=(ALL) NOPASSWD:ALL
    ${build_username} ALL=(ALL) NOPASSWD:ALL     #Required for Packer
  path: /etc/sudoers.d/cloudinit
${write_files}
