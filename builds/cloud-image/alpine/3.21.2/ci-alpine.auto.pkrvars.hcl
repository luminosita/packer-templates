vm_os_name       = "alpine"
vm_os_version    = "3.21.2"

vm_disk_size         = [ "5G" ]
vm_bridge_interface  = [ "vmbr1" ]
vm_vlan_tag          = ""

cloud_image_url  = "https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/cloud/nocloud_alpine-3.21.2-x86_64-uefi-cloudinit-r0.qcow2"
cloud_image_copy_script = "copy_cloud_img.sh.tpl"