//  BLOCK: packer
//  The Packer configuration.

packer {
  required_version = ">= 1.9.1"
  required_plugins {
    git = {
      version = ">= 0.4.2"
      source  = "github.com/ethanmdavidson/git"
    }
    password = {
      version = ">= 0.1.0"
      source  = "github.com/alexp-computematrix/password"
    }
    proxmox = {
      version = ">= 1.2.2"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

locals {
  manifest_date     = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  manifest_path     = "${path.cwd}/manifests/"
  manifest_output   = "${local.manifest_path}${local.manifest_date}.json"

  script_root       = "${abspath(path.root)}/../../scripts"
  certs_root       = "${abspath(path.root)}/../../../../certs"
  gpg_root       = "${abspath(path.root)}/../../../../gpg"
}

build {
  name = "test"
  sources = ["sources.file.test"]
}

# Build Definition to create the VM Template
build {
  name = "template"
  sources = ["source.proxmox-clone.template"]

  // Cloud-init logs
  provisioner "shell" {
    inline = [
      "sudo cp /var/log/cloud-init.log ~/",
      "sudo cp /var/log/cloud-init-output.log ~/",
      "sudo chown ${var.build_username}:${var.build_username} ~/*"
    ]
  }

  // Cloud-init logs
  provisioner "file" {
    direction="download"
    sources=[ "./cloud-init.log", "./cloud-init-output.log" ]
    destination="./output/"
  }

  // Upload certificates
  provisioner "file" {
    sources = formatlist("${local.certs_root}/%s", var.vm_certs)

    destination="./"
  }

  // Upload scripts
  provisioner "file" {
    sources = formatlist("${local.script_root}/%s", var.vm_scripts)

    destination="./"
  }

  // Run uploaded scripts
  provisioner "shell" {
    inline = var.vm_runscripts
  }

  post-processor "manifest" {
    output     = local.manifest_output
    strip_path = true
    strip_time = true
    custom_data = {
      vm_clone_name            = "${var.vm_clone_name}"
      build_username           = "${var.build_username}"
      build_date               = "${local.build_date}"
      build_version            = "${local.build_version}"
      common_data_source       = "${var.common_data_source}"
      vm_cpu_sockets           = "${var.vm_cpu_sockets}"
      vm_cpu_count             = "${var.vm_cpu_count}"
      vm_mem_size              = "${var.vm_mem_size}"
      vm_network_card_model    = "${var.vm_network_card_model}"
      vm_cloudinit             = "${var.vm_cloudinit}"
    }
  }
}
