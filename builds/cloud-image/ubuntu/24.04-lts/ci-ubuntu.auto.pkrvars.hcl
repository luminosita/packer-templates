vm_os_name       = "ubuntu"
vm_os_version    = "24.04-lts"

vm_disk_size         = [ "8G" ]
vm_bridge_interface  = [ "vmbr1" ]
vm_vlan_tag          = ""

cloud_image_url  = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
cloud_image_copy_script = "copy_cloud_img.sh.tpl"