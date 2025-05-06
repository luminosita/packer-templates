- [ ] CPU type for cloud-image and template?
- [x] HDD resize
- [x] Memory final?
- [x] Random VM id scope
- [x] Run Vault install script in cloud-init
- [ ] Cleanup 
    - [x] Remove Packer User
- [x] Download cloud-init, cloud-init-output logs
- [ ] Vault SSH Helper
    - [x] Ubuntu image: check /etc/pam.d/sshd file to see what should be commented
    - [x] Alpine image with pam.d and vault-ssh-helper (look at alpine-vault.yaml and alpine.yaml)
    - [ ] Proxmox
    - [ ] OPNSense Router
    - [ ] Mikrotik
- [x] Problem with network when I set network-config
- [x] Arrange cloud-init files
- [ ] Cloud images
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
- [ ] Delete SSHD keys
- [ ] Disable public keys from cloud-init
- [x] Delete build_password_encrypted
- [ ] Trust CA Key SSH Authority (backup)
- [ ] apk / apt repository for vault-ssh-helper binary
- [ ] IMPROTANT: Copy vault-ssh-helper for Alpine tempate image 

- [ ] Cloud images/Templates
    - [ ] Debian + Cloud init
    - [ ] Vault
    - [ ] GNS3
    - [ ] OPNSense + Config patch + Config apply
    - [ ] Talos
    - [ ] Mikrotik



vault-ssh-helper (Alpine):

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