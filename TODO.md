- [ ] CPU type for cloud-image and template?
- [x] HDD resize
- [x] Memory final?
- [x] Random VM id scope
- [x] Run Vault install script in cloud-init
- [x] Cleanup 
    - [x] Remove Packer User
- [x] Download cloud-init, cloud-init-output logs
- [ ] Vault SSH Helper
    - [x] Ubuntu image: check /etc/pam.d/sshd file to see what should be commented
    - [x] Alpine image with pam.d and vault-ssh-helper (look at alpine-vault.yaml and alpine.yaml)
    - [ ] Proxmox
    - [ ] OPNSense Router
    - [ ] Mikrotik
    - [ ] Bug: vault ssh -mode=otp -role=otp-key-role IP=... (logout)
        ```
        URL: PUT https://172.16.20.11:8200/v1/sys/leases/revoke
        Code: 403. Errors:

        * 1 error occurred:
        * permission denied
        ```
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
    - [ ] Vault (service, config script) 
      - [x] Double-reboot (SSH not starting)
      - [ ] Install Vault with Apt
      - [ ] ACME Server
      - [ ] Keepalived
      - [ ] SSH Host Keys service for Alpine
      - [ ] Cloud-init apt repo and GPG keys (https://cloudinit.readthedocs.io/en/latest/reference/modules.html#apk-configure)
      - [ ] Import Root CA and Intermediate CA to Vault
      - [ ] Import CA SSH Key to Vault
      - [ ] Unseal Vault with multiple Unseal Keys
    - [x] GNS3
    - [ ] OPNSense + Config patch + Config apply
    - [ ] Talos
    - [ ] Mikrotik
- [ ] Certificates
    - [x] CA certificates
    - [x] Intermediate CA
        - [x] Server certificates for Vault instances
    - [x] CA SSH key (Bitwarden)
    - [x] Store SSH key to Bitwarden
    - [ ] Store CA/Intermediate private keys to Bitwarden or only Private Key password
    - [x] No password entry repetition
- [ ] Caddy instead of Nginx
- [ ] Cleanup unused variables
- [ ] PS1 prompt (https://phoenixnap.com/kb/change-bash-prompt-linux) PS1="\u@\h:\w\$ "
- [ ] Proxmox KSM
- [ ] Move MD articles 
- [ ] Update README with certificate login instructions
- [ ] Update README with vault ssh login instructions
- [ ] Instructions for each template after creation is done
- [x] Fix hostname on clones



