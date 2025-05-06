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

  script_root       = "${abspath(path.root)}/../../../../scripts"
}

# Build Definition to create the VM Template
build {
  sources = ["source.proxmox-clone.template"]

  provisioner "shell" {
    inline = [
      "sudo cp /var/log/cloud-init.log ~/",
      "sudo cp /var/log/cloud-init-output.log ~/",
      "sudo chown ${var.build_username}:${var.build_username} ~/*"
    ]
  }

  provisioner "file" {
    direction="download"
    sources=[ "./cloud-init.log", "./cloud-init-output.log" ]
    destination="./output/"
  }

  provisioner "file" {
    source=var.vm_ca_user_public_key_file
    destination="./ca_user_key.pub"
  }

  provisioner "file" {
    source=var.vault_api_cert_file
    destination="./vault.crt"
  }

  provisioner "file" {
    sources = concat([ 
      "${local.script_root}/hashicorp/hc_install_product.sh", 
      "${local.script_root}/hashicorp/hc_vault_ssh_helper.sh", 
      "${local.script_root}/final.sh" 
    ], formatlist("${local.script_root}/%s", var.vm_scripts))

    destination="./"
  }

  provisioner "shell" {
    inline = concat(var.vm_runs, [
      "bash ./hc_vault_ssh_helper.sh", 
      "bash ./final.sh" 
    ])    
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
