wget -O /tmp/image.qcow2 ${var.cloud_image_url}
qemu-img convert -f qcow2 -O raw /tmp/image.qcow2 /tmp/image.raw
pv /tmp/image.raw | dd of=/dev/sda bs=4M status=progress
sync