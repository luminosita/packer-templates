vm_name                 = "vault-1.19.2"
vm_default_username     = "vault"

vm_scripts  = [ "hashicorp/create_vault_config.sh", "hashicorp/vault.sh" ]
vm_runs     = [ "bash ./vault.sh"]