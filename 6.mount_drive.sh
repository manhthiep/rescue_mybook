#!/bin/bash

echo "" | sudo cryptsetup -c rev16-ecb -d - create wd1 /dev/sdb

cat dek.hex | xxd -p -r | sudo cryptsetup -d - --hash=plain \
	--key-size=256 -c aes-ecb create wd2 /dev/mapper/wd1

echo "" | sudo cryptsetup -c rev16-ecb -d - create wd /dev/mapper/wd2

sudo file -s /dev/mapper/wd

sudo mkdir /mnt/wd

# get partition offset
# sudo parted /dev/dm-2

# mount (readonly, with offset from above command)
sudo mount -o ro,offset=1048576 /dev/dm-2 /mnt/wd
