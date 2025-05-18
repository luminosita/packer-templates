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
bootcmd:
${boot_commands}
apt:
  sources:
%{ for apt_repo in apt_repos }
    ${apt_repo.name}:
      source: ${apt_repo.repo}
%{ endfor ~}
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
- xterm 
- util-linux 
- dbus 
- ttf-freefont 
- xauth 
- firefox
${packages}
runcmd:
${run_commands}
write_files:
- content: |
    ${indent(4, file("${service_root}/${vm_os_name}.first-boot.service"))} 
  path: ${vm_os_name == "alpine" ? "/etc/init.d/first-boot" : "/etc/systemd/system/first-boot.service"}
  owner: "root:root"
  permissions: ${vm_os_name == "alpine" ? "0755" : "0644"}
- content: |
    ${indent(4, file("${script_root}/first_boot.sh"))} 
  path: /usr/local/bin/first_boot.sh
  permissions: "0755"
- content: |
    PermitRootLogin no
    PasswordAuthentication yes
    ChallengeResponseAuthentication yes
    UsePAM yes

    TrustedUserCAKeys /etc/ssh/ca_key.pub
    PermitTTY yes
    X11Forwarding yes
    X11UseLocalhost no
  path: /etc/ssh/sshd_config.d/01-harden-ssh.conf
- content: |
    ${username} ALL=(ALL) NOPASSWD:ALL
    ${build_username} ALL=(ALL) NOPASSWD:ALL     #Required for Packer
  path: /etc/sudoers.d/cloudinit
- content: |
    PS1="\u@\h:\w\$ "
  owner: "${username}:${username}"
  path: /home/${username}/.bash_profile
${write_files}