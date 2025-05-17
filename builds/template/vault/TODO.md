- [x] Raft Cluster (https://developer.hashicorp.com/vault/tutorials/raft/raft-storage)

- [x] Recreate SSHD keys
- [x] Token and seal files in /tmp
- [x] Vault crossplane provider                             
- [x] ACME, Cert-manager, Vault integration             

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
- [ ] Document Certificates folder

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
- [ ] Update README with certificate login instructions
- [ ] Update README with vault ssh login instructions
- [ ] Dynamic Secrets 
- [ ] Kubernete Secrets Injector 
- [ ] AppRole Authentication
- [ ] Add instructions README.md



