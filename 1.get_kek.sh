#!/bin/bash

# KEK: Key Encryption Key

echo 03141592653589793238462643383279fcebea6d9aca7686cdc7b9d9bcc7cd86 > kek.hex

cat kek.hex | grep -o .. | tac | echo "$(tr -d '\n')" > kek1.hex
