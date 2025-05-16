wget -O /tmp/image.raw.zip ${cloud_image_url}
unzip /tmp/image.raw.zip
pv /tmp/image.raw | dd of=/dev/sda bs=4M status=progress
sync