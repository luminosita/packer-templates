- [ ] CPU type for cloud-image and template?
- [x] HDD resize
- [x] Memory final?
- [x] Random VM id scope
- [x] Run Vault install script in cloud-init
- [x] Cleanup 
    - [x] Remove Packer User
- [x] Download cloud-init, cloud-init-output logs
- [x] Problem with network when I set network-config
- [x] Arrange cloud-init files
- [ ] Cloud images
    - [ ] Fix "disk is full" GNS3 issue
    - [ ] Download cloud image to ISO storage (reduce RAM requirement for SystemRescue image)
    - [ ] Stream file from storage directly to dd
        ```bash
        nbdcopy -- [ qemu-nbd -f qcow2 myVM.qcow2 ] - | ssh user@otherhost cat '>' raw-image-elsewhere
        The opposite would be:

        ssh user@otherhost cat raw-image-elsewhere | nbdcopy -- - [ qemu-nbd -f qcow2 local.qcow2 ]
        ```

- [x] Allow password authentication. Final script should lock password authentication
- [x] Externalize instance install scripts (Hashicorp script ..., )
- [x] Cloud init Ubuntu error in logs
- [x] Delete SSHD keys
    ```
    Any scripts in the scripts/per-boot directory on the datasource will be run every time the system boots. Scripts will be run in alphabetical order. This module does not accept any config keys.
    ```
Internal name: cc_scripts_per_boot
- [x] Disable public keys from cloud-init
- [x] Delete build_password_encrypted
- [x] Trust CA Key SSH Authority (backup) instead of public SSH keys in .authorized_keys
- [x] apk / apt repository for vault-ssh-helper binary
- [x] IMPROTANT: Copy vault-ssh-helper for Alpine tempate image 

- [ ] Cloud images/Templates
    - [x] Debian + Cloud init
    - [x] Vault (service, config script) 
      - [x] Double-reboot (SSH not starting)
      - [x] Install Vault with Apt
      - [x] Keepalived
      - [x] SSH Host Keys service for Alpine
      - [x] Cloud-init apt repo and GPG keys (https://cloudinit.readthedocs.io/en/latest/reference/modules.html#apk-configure)
      - [x] Unseal Vault with multiple Unseal Keys
      - [x] Disable cloud-init for clones
      - [x] Delete packer user on first clone boot (ssh_host_keys service -> first_boot service)
    - [x] GNS3
    - [ ] OPNSense
      - [x] Cloud image
      - [x] Config patch
      - [x] Config apply    
      - [ ] SeaBIOS instead of UEFI
    - [x] Mikrotik                                  
- [x] Cleanup unused variables                      
- [x] PS1 prompt (https://phoenixnap.com/kb/change-bash-prompt-linux) PS1="\u@\h:\w\$ "                  
- [ ] Proxmox KSM
- [x] Move MD articles to Wiki
- [ ] Instructions for each template after creation is done
- [x] Fix hostname on clones
- [ ] Delete log files, shell history for VM template (cloud-init logs)

## Vault

- [ ] Finish README for AppRole (https://developer.hashicorp.com/vault/tutorials/auth-methods/approle)
- [x] Raft Cluster (https://developer.hashicorp.com/vault/tutorials/raft/raft-storage)

- [x] Recreate SSHD keys
- [x] Token and seal files in /tmp
- [x] Vault crossplane provider                             
- [x] ACME, Cert-manager, Vault integration             
- [ ] Dynamic Secrets 
- [ ] Kubernete Secrets Injector 
- [ ] AppRole Authentication

- [x] Setup cluster script to avoid writing tokens and keys in history
- [x] Certificates expiration and rotation
- [x] Vault in Kubernetes

- [x] Import Root CA and Intermediate CA to Vault
- [x] Import CA SSH Key to Vault
    - [x] https://developer.hashicorp.com/vault/docs/secrets/ssh/signed-ssh-certificates
- [x] Unseal Vault with multiple Unseal Keys

- [x] Certificates
    - [x] CA certificates
    - [x] Intermediate CA
        - [x] Server certificates for Vault instances
    - [x] CA SSH key (Bitwarden)
    - [x] Store SSH key to Bitwarden
    - [x] Store CA/Intermediate private keys to Bitwarden or only Private Key password
    - [x] No password entry repetition
- [ ] Update README with certificate login instructions
- [ ] Update README with vault ssh login instructions


- [ ] Vault SSH Helper
    - [ ] Bug: vault ssh -mode=otp -role=otp-key-role IP=... (logout)
        ```
        URL: PUT https://172.16.20.11:8200/v1/sys/leases/revoke
        Code: 403. Errors:

        * 1 error occurred:
        * permission denied
        ```
    - [x] Ubuntu image: check /etc/pam.d/sshd file to see what should be commented
    - [x] Alpine image with pam.d and vault-ssh-helper (look at alpine-vault.yaml and alpine.yaml)


- [x] Vault OIDC (https://developer.hashicorp.com/vault/tutorials/auth-methods/oidc-identity-provider)
- [x] Vault MFA (SHA-1 for Andorid Google Authenticator) (https://developer.hashicorp.com/vault/docs/auth/login-mfa#time-based-one-time-password-totp)                                                
- [ ] Dex with Vault connector for refresh tokens               

- [ ] PVC for Vault Talos Proxmox
- [ ] Vault Benchmark (https://developer.hashicorp.com/vault/tutorials/operations/benchmark-vault)
- [ ] Auto registration for OIDC authorized accounts (Github successful login for an account that does not exist in Vault)

## Caddy

- [x] Caddy instead of Nginx (ACME Client for Vault)
- [x] Caddy Security module                        
- [x] Caddy ACME cert-mgr, TLS                     
- [x] Caddy OIDC Vault                             
- [ ] KrakenD                                                   
- [ ] gRPC plugin for KrakenD 

## Crossplane
- [x] PKI server certificate
- [x] Replace to namespaced Claims
- [x] Pipeline with functions
- [x] SSH OTP 
- [x] SSH CA

## Monitoring
- [ ] Grafana Stack 
- [ ] Grafana Alerting

## Databases
- [ ] OpenLDAP Cluster
- [ ] Minio
- [ ] Backstage
- [ ] PSQL Atlas Operator

## UI
- [ ] React with OpenLDAP as backend or Backstage
- [ ] CRUD UI
- [ ] CRUD backend OpenLDAP

## Boundary
- [ ] Proxmox
- [ ] OPNSense
- [ ] Talos nodes (talosctl)
- [ ] Kubectl
- [ ] Mikrotik
