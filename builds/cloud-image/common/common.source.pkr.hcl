//  BLOCK: locals
//  Defines the local variables.

locals {
  bios_boot_command = [
    "c<wait5>",
    "linux /sysresccd/boot/x86_64/vmlinuz archisobasedir=sysresccd archisolabel=RESCUE1200 iomem=relaxed ${local.kernel_command}",
    "<enter><wait10>",
    "initrd /sysresccd/boot/intel_ucode.img /sysresccd/boot/amd_ucode.img /sysresccd/boot/x86_64/sysreccd.img",
    "<enter><wait10>",
    "boot",
    "<enter>"
  ]
  uefi_boot_command = [
    // This waits for 3 seconds, sends the "c" key, and then waits for another 3 seconds. In the GRUB boot loader, this is used to enter command line mode.
    "<wait3s>c<wait3s>",
    // This types a command to load the Linux kernel from the specified path with the 'autoinstall' option and the value of the 'data_source_command' local variable.
    // The 'autoinstall' option is used to automate the installation process.
    // The 'data_source_command' local variable is used to specify the kickstart data source configured in the common variables.
    "linux /sysresccd/boot/x86_64/vmlinuz archisobasedir=sysresccd archisolabel=RESCUE1200 iomem=relaxed ${local.kernel_command}",
    // This sends the "enter" key and then waits. This is typically used to execute the command and give the system time to process it.
    "<enter><wait>",
    // This types a command to load the initial RAM disk from the specified path.
    "initrd /sysresccd/boot/intel_ucode.img /sysresccd/boot/amd_ucode.img /sysresccd/boot/x86_64/sysresccd.img",
    // This sends the "enter" key and then waits. This is typically used to execute the command and give the system time to process it.
    "<enter><wait>",
    // This types the "boot" command. This starts the boot process using the loaded kernel and initial RAM disk.
    "boot",
    // This sends the "enter" key. This is typically used to execute the command.
    "<enter>"
  ]
  build_by          = "Built by: HashiCorp Packer ${packer.version}"
  build_date        = formatdate("DD-MM-YYYY hh:mm ZZZ", "${timestamp()}" )
  build_version     = data.git-repository.cwd.head
  build_description = "Version: ${local.build_version}\nBuilt on: ${local.build_date}\n${local.build_by}\nCloud-Init: ${var.vm_cloudinit}"
  vm_disk_type      = var.vm_disk_type == "virtio" ? "vda" : "sda"
  manifest_date     = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  manifest_path     = "${path.cwd}/manifests/"
  manifest_output   = "${local.manifest_path}${local.manifest_date}.json"
  
  kernel_command = "nofirewall rootpass=${var.build_password}"
  vm_name = "${var.vm_os_family}-${var.vm_os_name}-${var.vm_os_version}"
  boot_command = var.vm_bios == "ovmf" ? local.uefi_boot_command : local.bios_boot_command
  vm_bios = var.vm_bios == "ovmf" ? var.vm_firmware_path : null
}

//  BLOCK: data
//  Defines the data sources.

data "git-repository" "cwd" {}

//  BLOCK: source
//  Defines the builder configuration blocks.

source "proxmox-iso" "cloud-image" {
 
  // Proxmox Connection Settings and Credentials
  proxmox_url              = "https://${var.proxmox_hostname}:8006/api2/json"
  username                 = "${var.proxmox_api_token_id}"
  token                    = "${var.proxmox_api_token_secret}"
  insecure_skip_tls_verify = "${var.proxmox_insecure_connection}"

  // Proxmox Settings
  node                     = "${var.proxmox_node}"

  // Virtual Machine Settings
  vm_name         = "${local.vm_name}"
  bios            = "${var.vm_bios}"
  sockets         = "${var.vm_cpu_sockets}"
  cores           = "${var.vm_cpu_count}"
  cpu_type        = "${var.vm_cpu_type}"
  memory          = "${var.vm_mem_size}"
  os              = "${var.vm_os_type}"
  scsi_controller = "${var.vm_disk_controller_type}"

  dynamic "disks" {
    for_each = var.vm_disk_size
    content {
      disk_size     = disks.value
      type          = "${var.vm_disk_type}"
      storage_pool  = "${var.vm_storage_pool}"
      format        = "${var.vm_disk_format}"
    }
  }
  dynamic "efi_config" {
    for_each = var.vm_bios == "ovmf" ? [1] : []
    content {
      efi_storage_pool  = var.vm_bios == "ovmf" ? var.vm_efi_storage_pool : null
      efi_type          = var.vm_bios == "ovmf" ? var.vm_efi_type : null
      pre_enrolled_keys = var.vm_bios == "ovmf" ? var.vm_efi_pre_enrolled_keys : null
    }
  }

  boot_iso {
    iso_file            = "${var.common_iso_storage}:${var.iso_path}/${var.iso_file}"
    iso_checksum        = "${var.iso_checksum}"
    unmount             = true
    keep_cdrom_device   = false
  }

//  ssh_username    = "${var.build_username}"
  ssh_username    = "root"  #System Rescue CD has only root username option
  ssh_password    = "${var.build_password}"
  ssh_timeout     = "${var.timeout}"
  ssh_port        = "22"

  boot              = var.vm_boot
  boot_wait         = var.vm_boot_wait
  boot_command      = local.boot_command
  
  serials = [ "socket" ]

  qemu_agent = true

  dynamic "network_adapters" {
    for_each = var.vm_bridge_interface
    content {
      bridge     = network_adapters.value
      model      = "${var.vm_network_card_model}"
      vlan_tag   = "${var.vm_vlan_tag}"
    }
  }
  
  template_name        = "${local.vm_name}"
  template_description = "${local.build_description}"
}
