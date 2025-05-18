vm_name                 = "apt-repo-0.0.1"
vm_default_username     = "repo"

vm_certs      = [      
    "ca_key.pub"
]

vm_scripts      = [   
    "final.sh" 
]

vm_runscripts   = [       
    "bash ./final.sh" 
]

vm_ci_packages = {
    alpine = [ "nginx", "dpkg-dev" ]
    ubuntu = [ "nginx", "dpkg-dev" ]
    debian = [ "cron", "nginx", "dpkg-dev" ]
}
vm_ci_runcmds  = {
    alpine = [ "rc-update add qemu-guest-agent", "rc-service qemu-guest-agent start" ]
    ubuntu = [ "systemctl daemon-reload", "systemctl start qemu-guest-agent" ]
    debian = [ "systemctl daemon-reload", "systemctl start qemu-guest-agent" ]
}

vm_ci_scripts = {
    apt_repo = "apt/apt_repo.sh" 
    ca_repo = "ca/ca_repo.sh" 
}

