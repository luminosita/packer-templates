vm_name                 = "vault-1.19.2"
vm_default_username     = "vault"

vm_certs      = [      
    "ca_user_key.pub",
    "ca-chain.cert.pem",
    "vault.lan.cert.pem",
    "vault.lan.key.pem"
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
    ubuntu = [ "libcap2-bin" ]
    debian = [ "cron", "libcap2-bin" ]
}
vm_ci_runcmds  = {
    alpine = [ "rc-update add qemu-guest-agent", "rc-service qemu-guest-agent start" ]
    ubuntu = [ 
        "systemctl daemon-reload", 
        "systemctl enable ssh-host-keys",
        "systemctl start qemu-guest-agent" 
        ]
    debian = [ 
        "systemctl daemon-reload", 
        "systemctl enable ssh-host-keys",
        "systemctl start qemu-guest-agent" 
        ]
}

vm_ci_scripts = [ "hashicorp/hc_create_vault_config.sh" ]