#cloud-config
package_update: true
package_upgrade: true
chpasswd:
  expire: false
password: ${random_pass}
ssh_pwauth: false
shell: /bin/bash
users:
- default
- lock_passwd: false
  name: ${username}
  password: ${random_pass}
  shell: /bin/bash
- lock_passwd: false
  name: ${build_username}      #Required for Packer
  password: ${build_password_encrypted}
  ssh_authorized_keys:  
  - ${build_ssh_key}
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
    ${username} ALL=(ALL) NOPASSWD:ALL
    ${build_username} ALL=(ALL) NOPASSWD:ALL     #Required for Packer
  path: /etc/sudoers.d/cloudinit
- content: |-
    auth requisite pam_exec.so quiet expose_authtok log=/var/log/vault-ssh.log /usr/local/bin/vault-ssh-helper -config=/etc/vault-ssh-helper.d/config.hcl
    auth optional pam_unix.so not_set_pass use_first_pass nodelay
  path: /etc/pam.d/vault-ssh-helper
  owner: "root:root"
  permissions: "0644"
- content: |-
    vault_addr = "${vault_api_url}"
    ssh_mount_point = "ssh"
    ca_cert = "/etc/vault-ssh-helper.d/vault.crt"
    tls_skip_verify = false
    allowed_roles = "*"
  path: "/etc/vault-ssh-helper.d/config.hcl"
  owner: "root:root"
  permissions: "0644"
