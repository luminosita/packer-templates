- content: |-
    #!/sbin/openrc-run

    name=$RC_SVCNAME
    cfgfile="/etc/vault.d/vault.hcl"
    command="/usr/local/bin/vault"
    command_args="server -config=/etc/vault.d/vault.hcl"
    command_user="vault"
    command_group="vault"
    command_background=true
    pidfile="/var/run/vault.pid"

    depend() {
      need net
    }

    start_pre() {
      checkpath --directory --owner $command_user:$command_group --mode 0775 /run/$RC_SVCNAME
    }
  path: "/etc/init.d/vault"
  owner: "root:root"
  permissions: "0755"
- content: |-
    ${indent(4, file("${script_root}/${custom_scripts.vault_setup}"))}    
  path: /usr/local/bin/hc_vault_node_setup.sh
  owner: "root:root"
  permissions: "0755"
