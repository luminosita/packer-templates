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
    - [ ] Alpine image
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

- [x] Externalize instance install scripts (Hashicorp script ..., )
- [x] Cloud init Ubuntu error in logs
- [ ] Delete SSHD keys
- [ ] Disable public keys from cloud-init
- [ ] Backup ssh public key for root / default user

- [ ] Cloud images
    - [ ] Debian + Cloud init
    - [ ] GNS3
    - [ ] OPNSense + Config patch + Config apply
    - [ ] Talos
    - [ ] Mikrotik

