# - content: |-
#     auth sufficient pam_exec.so quiet expose_authtok log=/var/log/vault-ssh.log /usr/local/bin/vault-ssh-helper -config=/etc/vault-ssh-helper.d/config.hcl
#     auth optional pam_unix.so use_first_pass nodelay
#   path: /etc/pam.d/vault-ssh-helper
#   owner: "root:root"
#   permissions: "0644"
# - content: |-
#     vault_addr = "${vault_api_url}"
#     ssh_mount_point = "ssh"
#     ca_cert = "/etc/vault-ssh-helper.d/vault.crt"
#     tls_skip_verify = false
#     allowed_roles = "*"
#   path: "/etc/vault-ssh-helper.d/config.hcl"
#   owner: "root:root"
#   permissions: "0644"