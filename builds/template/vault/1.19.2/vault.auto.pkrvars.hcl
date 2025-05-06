vm_name                 = "vault-1.19.2"
vm_default_username     = "vault"

vm_certs      = [      
    "vault.crt",
    "ca_user_key.pub"
]

vm_scripts      = [      
    "hashicorp/create_vault_config.sh", 
    "hashicorp/vault.sh",
    "hashicorp/hc_install_product.sh", 
    "hashicorp/hc_vault_ssh_helper.sh", 
    "final.sh" 
]

vm_runscripts   = [       
    "bash ./hc_vault_ssh_helper.sh", 
    "bash ./vault.sh",
    "bash ./final.sh" 
]

vm_ci_packages = {
    alpine = [ "- libcap-setcap" ]
    ubuntu = [ "- libcap2-bin" ]
    debian = [ "- libcap2-bin" ]
}
vm_ci_runcmd  = {
    alpine = [ "- rc-update add qemu-guest-agent", "- rc-service qemu-guest-agent start" ]
    ubuntu = [ "- systemctl daemon-reload" ]
    debian = [ "- systemctl daemon-reload" ]
}