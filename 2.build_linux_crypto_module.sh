cd linux_crypto
make && sudo cp rev16.ko /lib/modules/`uname -r`/kernel/crypto

sudo depmod -a
sudo modprobe rev16
