#!bin/shLOG_TAG="bt_test_transmit"
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

logi "start bluetooth transmit test"

btconfig /dev/smd3 reset
btconfig /dev/smd3 rawcmd 0x3F 0x0004 0x05 0x00 0x09 0x05 0x20 0x00 0x00 0x00 0x00

setprop persist.bt.test.status stopped

logi "bluetooth transmit test end"

exit 0