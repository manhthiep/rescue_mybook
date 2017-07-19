#!/bin/bash

sudo hexdump -C /dev/mapper/wd3

sudo dd if=/dev/mapper/wd3 bs=1 skip=268 count=16 of=dek0.bin
sudo dd if=/dev/mapper/wd3 bs=1 skip=288 count=16 of=temp
sudo chmod a+rw dek0.bin temp
cat temp >> dek0.bin
rm -f temp

xxd -p -c 32 dek0.bin > dek0.hex

cat dek0.hex | grep -o .. | tac | echo "$(tr -d '\n')" > dek.hex
