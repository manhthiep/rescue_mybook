#!/bin/bash

echo "" | sudo cryptsetup -c rev16-ecb -d - create wd1 kb.bin

cat kek1.hex | xxd -p -r | sudo cryptsetup -c aes-ecb \
	--key-size=256 -d - --hash=plain create wd2 /dev/mapper/wd1

echo "" | sudo cryptsetup -c rev16-ecb -d - create wd3 /dev/mapper/wd2
