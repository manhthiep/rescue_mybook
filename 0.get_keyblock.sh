#!/bin/bash

# JMicron JMS528S
# 500GB 976769056
# 750GB 1465143328
# 1TB   1953519648
# 2TB   3907024928
# 3TB   5860528160
# 4TB   7814031392

# 2TB, /dev/sdb
dd if=/dev/sdb bs=512 skip=3907024928 count=1 of=kb.bin

hexdump -C kb.bin
