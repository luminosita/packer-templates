wget -O /tmp/images.zip ${cloud_image_url}
cd /tmp
unzip images.zip
rm images.zip
qemu-img convert -f qcow2 -O raw "GNS3 VM-disk001.qcow2" /tmp/image1.raw
qemu-img convert -f qcow2 -O raw "GNS3 VM-disk002.qcow2" /tmp/image2.raw
pv /tmp/image1.raw | dd of=/dev/sda bs=4M status=progress
sync
pv /tmp/image2.raw | dd of=/dev/sdb bs=4M status=progress
sync