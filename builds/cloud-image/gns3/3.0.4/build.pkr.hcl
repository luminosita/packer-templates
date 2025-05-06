# Build Definition to create the VM Template
build {
  sources = ["source.proxmox-iso.cloud-image"]

  provisioner "shell" {
    inline = [
      "wget -O /tmp/image.qcow2 ${var.cloud_image_url}",
      "qemu-img convert -f qcow2 -O raw /tmp/image.qcow2 /tmp/image.raw",
      "pv /tmp/image.raw | dd of=/dev/sda bs=4M status=progress",
      "sync",
    ]
  }

  post-processor "manifest" {
    output     = local.manifest_output
    strip_path = true
    strip_time = true
    custom_data = {
      build_username           = "${var.build_username}"
      build_date               = "${local.build_date}"
      build_version            = "${local.build_version}"
      common_data_source       = "${var.common_data_source}"
      vm_cpu_sockets           = "${var.vm_cpu_sockets}"
      vm_cpu_count             = "${var.vm_cpu_count}"
      vm_disk_size             = join(", ", var.vm_disk_size)
      vm_bios                  = "${var.vm_bios}"
      vm_os_type               = "${var.vm_os_type}"
      vm_mem_size              = "${var.vm_mem_size}"
      vm_network_card_model    = "${var.vm_network_card_model}"
      vm_cloudinit             = "${var.vm_cloudinit}"
    }
  }
}
