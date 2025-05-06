vm_name                 = "base-0.0.1"
vm_default_username     = "base"

vm_certs      = [      
    "ca_user_key.pub"
]

vm_scripts      = [      
    "final.sh" 
]

vm_runscripts   = [       
    "bash ./final.sh" 
]

vm_ci_packages = {
    alpine = [ ]
    ubuntu = [ ]
    debian = [ ]
}
vm_ci_runcmds  = {
    alpine = [ "- rc-update add qemu-guest-agent" ]
    ubuntu = [ "- systemctl daemon-reload" ]
    debian = [ "- systemctl daemon-reload" ]
}