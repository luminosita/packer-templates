vm_name                 = "apt-repo-0.0.1"
vm_default_username     = "repo"

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
    alpine = [ "nginx" ]
    ubuntu = [ "nginx" ]
    debian = [ "cron", "nginx" ]
}
vm_ci_runcmds  = {
    alpine = [ "rc-update add qemu-guest-agent", "rc-service qemu-guest-agent start" ]
    ubuntu = [ "systemctl daemon-reload", "systemctl start qemu-guest-agent" ]
    debian = [ "systemctl daemon-reload", "systemctl start qemu-guest-agent" ]
}

vm_ci_scripts = [ "apt/apt_repo.sh" ]
