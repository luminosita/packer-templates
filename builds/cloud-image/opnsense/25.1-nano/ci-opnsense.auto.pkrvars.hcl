vm_os_name       = "opnsense"
vm_os_version    = "25.1"
vm_bios          = "seabios"

vm_disk_size            = [ "10G" ]
vm_bridge_interface     = [ "vmbr0", "vmbr3", "vmbr2" ]
vm_vlan_tag          = ""

cloud_image_url  = "https://mirror.ams1.nl.leaseweb.net/opnsense/releases/25.1/OPNsense-25.1-nano-amd64.img.bz2"
cloud_image_copy_script = "copy_cloud_img_bz2.sh.tpl"