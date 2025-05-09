locals {
  build_by          = "Built by: HashiCorp Packer ${packer.version}"
  build_date        = formatdate("DD-MM-YYYY hh:mm ZZZ", "${timestamp()}" )
  build_version     = data.git-repository.cwd.head
  build_description = "Version: ${local.build_version}\nBase OS: ${var.vm_clone_name}\nBuilt on: ${local.build_date}\n${local.build_by}\nCloud-Init: ${var.vm_cloudinit}"
  vm_disk_type      = var.vm_disk_type == "virtio" ? "vda" : "sda"

  data_source_content = {
    "/meta-data"               = file("${abspath(path.root)}/data/meta-data")
    "/user-data"               = templatefile("${abspath(path.root)}/data/user-data.pkrtpl.hcl", {
      vault_api_url            = var.vault_api_url
      build_username           = var.build_username
      build_password_encrypted = var.build_password_encrypted
      username                 = var.vm_default_username
      vm_disk_type             = local.vm_disk_type
      random_pass              = data.password.random_pass.crypt
      packages                 = join("\n", formatlist("- %s", var.vm_ci_packages[var.vm_os_name]))
      run_commands             = join("\n", formatlist("- %s", var.vm_ci_runcmds[var.vm_os_name]))
      ssh_host_keys_script     = "${local.script_root}/ssh_host_keys.sh"
      write_files              = fileexists("${abspath(path.root)}/data/files.pkrtpl.hcl") ? templatefile("${abspath(path.root)}/data/files.pkrtpl.hcl", {
        username                 = var.vm_default_username
        custom_scripts           = formatlist("${local.script_root}/%s", var.vm_ci_scripts)
      }) : templatefile("${abspath(path.root)}/data/files.${var.vm_os_name}.pkrtpl.hcl", {
        username                 = var.vm_default_username
        custom_scripts           = formatlist("${local.script_root}/%s", var.vm_ci_scripts)
      })
    })
    "/network-config"          = templatefile("${abspath(path.root)}/data/network.pkrtpl.hcl", {
        device                 = var.vm_network_device[var.vm_os_name]
        ip                     = var.vm_ip_address
        netmask                = var.vm_ip_netmask
        gateway                = var.vm_ip_gateway
        dns                    = var.vm_dns_list
    })
  }

  vm_name = "${var.vm_name}-${var.vm_os_name}"
}

//  BLOCK: data
//  Defines the data sources.

data "git-repository" "cwd" {}
data "password" "random_pass" {}
//  BLOCK: source
//  Defines the builder configuration blocks.

source "file" "test" {
  content =  local.data_source_content["/user-data"]
  target =  "output/config.yaml"
}

source "proxmox-clone" "template" {
 
  // Proxmox Connection Settings and Credentials
  proxmox_url              = "https://${var.proxmox_hostname}:8006/api2/json"
  username                 = "${var.proxmox_api_token_id}"
  token                    = "${var.proxmox_api_token_secret}"
  insecure_skip_tls_verify = "${var.proxmox_insecure_connection}"

  communicator            = "ssh"
  ssh_username            = "${var.build_username}"
  ssh_password            = "${var.build_password}"
  ssh_timeout             = "${var.timeout}"
  ssh_port                = "22"

  // Proxmox Settings
  node                     = "${var.proxmox_node}"

  // Virtual Machine Settings
  clone_vm        = "${var.vm_clone_name}"
  vm_name         = "${local.vm_name}"
  sockets         = "${var.vm_cpu_sockets}"
  cores           = "${var.vm_cpu_count}"
  memory          = "${var.vm_mem_size}"
  scsi_controller = "${var.vm_disk_controller_type}"

  qemu_agent = true

  network_adapters {
    bridge     = "${var.vm_bridge_interface}"
    model      = "${var.vm_network_card_model}"
    vlan_tag   = "${var.vm_vlan_tag}"
  }

  // Removable Media Settings
  http_content = var.common_data_source == "http" ? local.data_source_content : null

  // Boot and Provisioning Settings
  http_bind_address = var.common_data_source == "http" ? var.common_http_bind_address : null
  http_port_min     = var.common_data_source == "http" ? var.common_http_port_min : null
  http_port_max     = var.common_data_source == "http" ? var.common_http_port_max : null

  boot              = var.vm_boot
  boot_wait         = var.vm_boot_wait

  dynamic "additional_iso_files" {
    for_each = var.common_data_source == "disk" ? [1] : []
    content {
      cd_content = var.common_data_source == "disk" ? local.data_source_content : null
      cd_label = var.common_data_source == "disk" ? "cidata" : null
      iso_storage_pool = var.common_data_source == "disk" ? "local" : null
      type = var.vm_disk_type
      unmount             = true
      keep_cdrom_device   = false
    }
  }

  template_name        = local.vm_name
  template_description = local.build_description

  # VM Cloud Init Settings
  cloud_init              = var.vm_cloudinit
  cloud_init_storage_pool = var.vm_cloudinit == true ? var.vm_storage_pool : null
  cloud_init_disk_type    = var.vm_cloudinit == true ? var.vm_disk_type : null
}

