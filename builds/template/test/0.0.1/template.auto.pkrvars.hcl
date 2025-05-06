// Virtual Machine Guest Operating System Setting
vm_name                 = "test-0.0.1"
vm_default_username     = "test"
vm_cloudinit            = false

// Virtual Machine Hardware Settings
vm_cpu_count            = 1
vm_cpu_sockets          = 1
vm_cpu_type             = "kvm64"
vm_mem_size             = 1024
vm_disk_type            = "scsi"
vm_disk_controller_type = "virtio-scsi-pci"
vm_network_card_model   = "virtio"

// Boot Settings
vm_boot      = "order=scsi0;net0"
vm_boot_wait = "5s"
