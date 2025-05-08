- content: |-
    [Unit]
    Description=Vault Service
    After=network.target
    StartLimitIntervalSec=0
    [Service]
    Type=simple
    Restart=always
    RestartSec=1
    User=vault
    Group=vault
    ExecStart=/usr/local/bin/vault server -config=/etc/vault.d/vault.hcl

    [Install]
    WantedBy=multi-user.target
  path: "/etc/systemd/system/vault.service"
  owner: "root:root"
  permissions: "0644"
- content: |-
    ${indent(4, file(custom_scripts[0]))}    
  path: /usr/local/bin/hc_create_vault_config.sh
  owner: "root:root"
  permissions: "0755"
