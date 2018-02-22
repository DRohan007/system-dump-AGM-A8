#!bin/shLOG_TAG="bt_test_receive"
LOG_NAME="${0}:"

loge ()
{
	/system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
	/system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

#set flag of bt status
setprop persist.bt.test.status running

logi "start bluetooth receive test"

btconfig /dev/smd3 reset
btconfig /dev/smd3 rawcmd 0x06, 0x03
btconfig /dev/smd3 rawcmd 0x03, 0x05, 0x02, 0x00, 0x02
btconfig /dev/smd3 rawcmd 0x03, 0x1A, 0x03
btconfig /dev/smd3 rawcmd 0x03, 0x20, 0x00
btconfig /dev/smd3 rawcmd 0x03, 0x22, 0x00

setprop persist.bt.test.status stopped

logi "bluetooth receive test end"

exit 0