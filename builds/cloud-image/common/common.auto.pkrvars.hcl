// Guest Operating System Metadata
vm_os_language   = "en_US"
vm_os_keyboard   = "us"
vm_os_timezone   = "UTC"
vm_os_family     = "linux"

// Virtual Machine Guest Operating System Setting
vm_os_type       = "l26"
vm_cloudinit     = false

// Virtual Machine Hardware Settings
vm_bios                 = "ovmf"
vm_cpu_count            = 1
vm_cpu_sockets          = 1
vm_cpu_type             = "kvm64"
vm_mem_size             = 8192
vm_disk_type            = "scsi"
vm_disk_format          = "raw"
vm_disk_controller_type = "virtio-scsi-pci"
vm_network_card_model   = "virtio"

// Removable Media Settings
iso_path     = "iso"
iso_file      = "systemrescue-12.00-amd64.iso"
iso_checksum  = "sha256:11a1f31412046cc28f2b7a465a2f1634ca5095594a9e5937e1ff9fd25f9ae8e6"

// Boot Settings
vm_boot      = "order=scsi0;ide2;net0"
vm_boot_wait = "10s"

// EFI Settings
vm_firmware_path         = "./OVMF.fd"
