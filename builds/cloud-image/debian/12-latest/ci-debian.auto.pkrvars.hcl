vm_os_name       = "debian"
vm_os_version    = "12-latest"

vm_disk_size         = [ "8G" ]
vm_bridge_interface  = [ "vmbr1" ]
vm_vlan_tag          = ""

cloud_image_url  = "https://cdimage.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
cloud_image_copy_script = "copy_cloud_img.sh.tpl"