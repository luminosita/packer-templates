wget -O /tmp/image.raw.bz2 ${cloud_image_url}
bzip2 -d /tmp/image.raw.bz2
pv /tmp/image.raw | dd of=/dev/sda bs=4M status=progress
sync