- [ ] Fix "disk is full" GNS3 issue
- [ ] Reduce memory for SystemRescuedCD VM
- [ ] Download cloud image to ISO storage (reduce RAM requirement for SystemRescue image)
- [ ] Stream file from storage directly to dd
    ```bash
    nbdcopy -- [ qemu-nbd -f qcow2 myVM.qcow2 ] - | ssh user@otherhost cat '>' raw-image-elsewhere
    The opposite would be:

    ssh user@otherhost cat raw-image-elsewhere | nbdcopy -- - [ qemu-nbd -f qcow2 local.qcow2 ]
    ```
