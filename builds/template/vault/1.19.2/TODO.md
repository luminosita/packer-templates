- [ ] CPU type for cloud-image and template?
- [x] HDD resize
- [x] Memory final?
- [x] Random VM id scope
- [x] Run Vault install script in cloud-init
- [ ] Cleanup 
    - [x] Remove Packer User
- [ ] Download cloud-init, cloud-init-output logs
- [ ] Vault SSH Helper
    - [ ] Ubuntu image: check /etc/pam.d/sshd file to see what should be commented
    - [ ] Problem with network when I set network-config
    - [ ] Arrange cloud-init files
- [ ] Cloud images
    - [ ] Download cloud image to ISO storage (reduce RAM requirement for SystemRescue image)
    - [ ] Stream file from storage directly to dd
        ```bash
        nbdcopy -- [ qemu-nbd -f qcow2 myVM.qcow2 ] - | ssh user@otherhost cat '>' raw-image-elsewhere
        The opposite would be:

        ssh user@otherhost cat raw-image-elsewhere | nbdcopy -- - [ qemu-nbd -f qcow2 local.qcow2 ]
        ```

- [ ] Externalize instance install scripts (Hashicorp script ..., )
    - [ ] Download scripts with data source
- [ ] Cloud init Ubuntu error in logs