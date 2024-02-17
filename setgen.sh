#!/bin/bash
cd "$(dirname "$0")"

./gaster pwn
irecovery -f iBSS.img4
sleep 1
irecovery -f iBEC.img4
sleep 1
irecovery -q | grep NONC
sleep 0.5
irecovery -c "bgcolor 110 45 140"
sleep 0.5
irecovery -c "setenv com.apple.System.boot-nonce 0x48426434c6c88336"
sleep 0.5
irecovery -c "saveenv"
sleep 0.5
irecovery -c "setenv auto-boot false"
sleep 0.5
irecovery -c "saveenv"
sleep 0.5
irecovery -c "reset"
sleep 5
irecovery -q | grep NONC
