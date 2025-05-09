- content: |-
    ${indent(4, file("${script_root}/${custom_scripts.vault_setup}"))}    
  path: /usr/local/bin/hc_vault_node_setup.sh
  owner: "root:root"
  permissions: "0755"
