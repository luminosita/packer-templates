//  BLOCK: variable
//  Defines the input variables.

// Proxmox Credentials

variable "proxmox_hostname" {
  type        = string
  description = "The FQDN or IP address of a Proxmox node. Only one node should be specified in a cluster."
}

variable "proxmox_api_token_id" {
  type        = string
  description = "The token to login to the Proxmox node/cluster. The format is USER@REALM!TOKENID. (e.g. packer@pam!packer_pve_token)"
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "The secret for the API token used to login to the Proxmox API."
#  sensitive   = true
}

variable "proxmox_insecure_connection" {
  description = "true/false to skip Proxmox TLS certificate checks."
  type        = bool
  default     = true
}

// Proxmox Settings

variable "proxmox_node" {
  type    = string
  description = "The name of the Proxmox node that Packer will build templates on."
}

// Vault Settings

variable "vault_api_url" {
  type    = string
  description = "The Vault API url."
}

variable "vault_api_cert_file" {
  type    = string
  description = "The Vault API file path to TLS certificate."
}

// Virtual Machine Settings

variable "vm_clone_name" {
  type        = string
  description = "The guest VM to be cloned."
}

variable "vm_name" {
  type        = string
  description = "The guest VM name."
}

variable "vm_os_name" {
  type        = string
  description = "The guest operating system name. Used for naming. (e.g. 'ubuntu')"
}

variable "vm_os_release" {
  type        = string
  description = "The guest operating system release name. Used for apt repositories. (e.g. 'noble')"
}

variable "vm_cpu_count" {
  type        = number
  description = "The number of virtual CPUs. (e.g. '2')"
}

variable "vm_cpu_sockets" {
  type        = number
  description = "The number of virtual CPU sockets. (e.g. '1')"
}

variable "vm_mem_size" {
  type        = number
  description = "The size for the virtual memory in MB. (e.g. '2048')"
}

variable "vm_disk_controller_type" {
  type        = string
  description = "The SCSI controller model to emulate. (e.g. 'virtio-scsi-pci')"
}

variable "vm_disk_type" {
  type        = string
  description = "The type of disk to emulate. (e.g. 'virtio')"
}

variable "vm_network_card_model" {
  type        = string
  description = "The model of the virtual network adapter to emulate. (e.g. 'virtio')"
}

variable "vm_bridge_interface" {
  type        = string
  description = "The name of the Proxmox bridge to attach the adapter to."
}

variable "vm_vlan_tag" {
  type        = string
  description = "If the adapter should tag packets, give the VLAN ID. (e.g. '102')"
}

// Cloud-Init Settings

variable "vm_cloudinit" {
  type        = bool
  description = "Enable or disable cloud-init drive in Proxmox. (e.g. false)"
  default     = false
}

variable "vm_default_username" {
  type        = string
  description = "The default VM username."
}

variable "vm_ca_user_public_key_file" {
  type        = string
  description = "The SSH public key file."
}

variable "vm_certs" {
  type        = list(string)
  description = "The certificates to be uploaded."
}

variable "vm_scripts" {
  type        = list(string)
  description = "The scripts to be uploaded."
}

variable "vm_runscripts" {
  type        = list(string)
  description = "The scripts to be executed."
}

variable "vm_ci_packages" {
  type        = map(list(string))
  description = "Cloud-init additional packages."
}

variable "vm_ci_bootcmds" {
  type        = map(list(string))
  description = "Cloud-init additional boot commands."
}

variable "vm_ci_runcmds" {
  type        = map(list(string))
  description = "Cloud-init additional run commands."
}

variable "vm_ci_aptrepos" {
  type        = map(list(map(string)))
  description = "Cloud-init additional run commands."
}

variable "vm_ci_scripts" {
  type        = map(string)
  description = "Cloud-init custom scripts."
  default     = {}
}

// Boot Settings

variable "common_data_source" {
  type        = string
  description = "The provisioning data source. (e.g. 'http' or 'disk')"
}

variable "common_http_bind_address" {
  type        = string
  description = "Define an IP address on the host to use for the HTTP server."
  default     = null
}

variable "common_http_port_min" {
  type        = number
  description = "The start of the HTTP port range."
}

variable "common_http_port_max" {
  type        = number
  description = "The end of the HTTP port range."
}

variable "vm_boot" {
  type        = string
  description = "The boot order for virtual machine devices. (e.g. 'order=virtio0;ide2;net0')"
}

variable "vm_boot_wait" {
  type        = string
  description = "The time to wait after booting the initial VM before typing the boot_command (e.g '10s')"
}

variable "common_ip_wait_timeout" {
  type        = string
  description = "Time to wait for guest operating system IP address response."
}

variable "common_shutdown_timeout" {
  type        = string
  description = "Time to wait for guest operating system shutdown."
}

// Communicator Settings and Credentials

variable "build_username" {
  type        = string
  description = "The username to login to the guest operating system. (e.g. 'ubuntu')"
#  sensitive   = true  
}

variable "build_password" {
  type        = string
  description = "The password to login to the guest operating system."
#  sensitive   = true
}

variable "build_password_encrypted" {
  type        = string
  description = "The encrypted password to login to the guest operating system."
#  sensitive   = true
}

variable "timeout" {
  description = "not sure why I need so high a timeout but here we are"
  default = "90m"
}

// HCP Packer Settings

variable "common_hcp_packer_registry_enabled" {
  type        = bool
  description = "Enable the HCP Packer registry."
  default     = false
}
