vm_os_name       = "mikrotik-chr"
vm_os_version    = "7.18.2"

vm_disk_size         = [ "5G" ]
vm_bridge_interface  = [ "vmbr1" ]
vm_vlan_tag          = ""

cloud_image_url  = "https://download.mikrotik.com/routeros/7.18.2/chr-7.18.2.img.zip"
cloud_image_copy_script = "copy_cloud_img_zip.sh.tpl"