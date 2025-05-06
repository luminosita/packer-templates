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
power_state:
  delay: now
  mode: reboot
  message: Rebooting after cloud-init completion
  condition: true
write_files:
- content: |
      #!/bin/bash
      echo "SSH host key script"

      if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
        echo "Generating SSH host keys ..."

        ssh-keygen -q -N "" -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key
        ssh-keygen -q -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
        ssh-keygen -q -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
      fi   
  path: /var/lib/cloud/scripts/per-boot/ssh_host_keys.sh
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
- content: |-
    auth sufficient pam_exec.so quiet expose_authtok log=/var/log/vault-ssh.log /usr/local/bin/vault-ssh-helper -config=/etc/vault-ssh-helper.d/config.hcl
    auth optional pam_unix.so use_first_pass nodelay
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
${write_files}
