#!/system/bin/sh

btconfig /dev/smd3 rawcmd 0x03 0x0003
sleep 1
btconfig /dev/smd3 rawcmd 0x03 0x0005 0x02 0x00 0x02
sleep 1
btconfig /dev/smd3 rawcmd 0x03 0x001A 0x03
sleep 1
btconfig /dev/smd3 rawcmd 0x03 0x0020 0x00
sleep 1
btconfig /dev/smd3 rawcmd 0x03 0x0022 0x00
sleep 1
btconfig /dev/smd3 rawcmd 0x06 0x0003

echo "================================================"
echo "Now the BT is in DUT mode, please do your test!"
echo "================================================"
exit 0