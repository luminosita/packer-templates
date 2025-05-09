vm_name                 = "vault-1.19.2"
vm_default_username     = "vault"

vm_certs      = [      
    "ca_user_key.pub",
    "vault/ca-chain.cert.pem",
    "vault/vault.lan.cert.pem",
    "vault/vault.lan.key.pem"
]

vm_scripts      = [      
    "hashicorp/hc_install_product.sh", 
    "hashicorp/hc_vault.sh",
    "final.sh" 
]

vm_runscripts   = [       
    "bash ./hc_vault.sh", 
    "bash ./final.sh" 
]

vm_ci_packages = {
    alpine = [ "libcap-setcap" ]
    ubuntu = [ "libcap2-bin", "vault" ]
    debian = [ "cron", "libcap2-bin", "vault" ]
}

vm_ci_runcmds  = {
    alpine = [ 
        "rc-update add qemu-guest-agent", 
        "rc-service qemu-guest-agent start", 
        "rc-update add first-boot"
        ]
    ubuntu = [ 
        "systemctl daemon-reload", 
        "systemctl enable first-boot",
        "systemctl start qemu-guest-agent" 
        ]
    debian = [ 
        "systemctl daemon-reload", 
        "systemctl enable first-boot",
        "systemctl start qemu-guest-agent",
        ]
}

vm_ci_bootcmds  = {
    alpine = [ ]
    ubuntu = [ 
        "wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg"
    ]
    debian = [ 
        "apt update && apt -y install gpg",
        "wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg"
    ]
}

vm_ci_scripts = {
    vault_setup = "hashicorp/hc_vault_node_setup.sh" 
    }

vm_ci_aptrepos = {
    alpine = []

    ubuntu = [{
        name = "hashicorp" 
        repo = "deb [arch=amd64 signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $RELEASE main"
    }]

    debian = [{
        name = "hashicorp" 
        repo = "deb [arch=amd64 signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $RELEASE main"
    }]
}
