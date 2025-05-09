packer {
  required_version = ">= 1.9.1"
  required_plugins {
    git = {
      version = ">= 0.4.2"
      source  = "github.com/ethanmdavidson/git"
    }
    proxmox = {
      version = ">= 1.2.2"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}
