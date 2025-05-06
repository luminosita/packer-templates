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
- [ ] apk / apt repository for vault-ssh-helper binary
- [ ] IMPROTANT: Copy vault-ssh-helper for Alpine tempate image 

- [ ] Cloud images/Templates
    - [x] Debian + Cloud init
    - [ ] Vault (service, config script)
    - [ ] Vault HA
    - [x] GNS3
    - [ ] OPNSense + Config patch + Config apply
    - [ ] Talos
    - [ ] Mikrotik
- [ ] Certificates
    - [ ] CA certificates
    - [ ] Server CA (intermediate) for Vault
        - [ ] Client certificates for Vault instances
    - [ ] CA SSH key
    - [ ] Server CA (intermediate) for SSH CA Trust
        - [ ] Client certificates for SSH login
    - [ ] Store both CA to HCP Cloud
- [ ] Cleanup unused variables


vault write ssh/creds/otp-key-role ip=172.16.1.164

# Vault SSH Helper (Alpine)

### Install packages

```bash
$ apk add make gcc libc-dev git
```

### Install Go

```bash
$ wget https://go.dev/dl/go1.24.2.linux-amd64.tar.gz
$ tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz
$ export PATH=$PATH:/usr/local/bin/go:~/go/bin
```

### Build Vault SSH Helper

```bash
$ git clone https://github.com/hashicorp/vault-ssh-helper.git
$ cd vault-ssh-helper
$ go install github.com/mitchellh/gox
$ make
```

Library is located in `bin` folder


# Trusted CA SSH Certificates

### Generate CA Key

```bash
$ ssh-keygen -f ~/.ssh/ca_user_key
```

### Setup SSHD Server

Copy the public key into an appropriate location.

```bash
$ scp ~/.ssh/ca_user_key.pub <user>@<ssh server>:/etc/ssh/
```

Update the sshd_config to add the TrustedUserCAKeys option and restart the service.

```bash
$ vim /etc/ssh/sshd_config
...
TrustedUserCAKeys /etc/ssh/ca_user_key.pub
...

$ systemctl restart sshd
```

### Sign Client Public SSH Key

Create client SSH key-pair or use the existing

```bash
$ ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_test_rsa
```

The following command with sign existing SSH public key and create certificate `~/.ssh/id_test_rsa-cert.pub`
Certificate will be valid for one hour (-V +1h), with the serial number `1`, server user account `ubuntu` and 
certificate identity `test` Certificate identity will show up in server SSH log file for the purpose of audit 

```bash
$ ssh-keygen -s ~/.ssh/ca_user_key -I test -n ubuntu -V +1h -z 1 ~/.ssh/id_test_rsa.pub
```

### Login

```bash
$ ssh -i ~/.ssh/id_test_rsa ubuntu@<server ip>
```

### Multiple Account Access

Certificate can enable access to multiple accounts on one SSH server
There is a `dba` user account and we will use a principal named `zone-databases` to allow access to the `dba` user account. Any certificate which is created with the `zone-databases` principal will allow the relevant user access to the `dba` user.
Firstly add the AuthorizedPrincipalsFile to the sshd_config file and restart the service.

```bash
$ vim /etc/ssh/sshd_config
...
AuthorizedPrincipalsFile /etc/ssh/auth_principals/%u

$ systemctl restart sshd
```

The `auth_principals` directory also needs to be created. Within here the `dba` user file will be created with the zone-databases principal present.

```bash
$ mkdir /etc/ssh/auth_principals/
$ echo "zone-databases" > /etc/ssh/auth_principals/dba
```

The certificate will now be created with the zone-databases principal added.

```bash
$ ssh-keygen -s ~/.ssh/ca_user_key -I test -n ubuntu,zone-databases -V +1h -z 1 ~/.ssh/id_test_rsa.pub
```

Test login

```bash
$ ssh -i ~/.ssh/id_test_rsa dba@<server ip>
```