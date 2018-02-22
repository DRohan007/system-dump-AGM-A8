#!bin/sh
LOG_TAG="iwpriv_cntl"
LOG_NAME="${0}:"

logi ()
{
    /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

cmd=`getprop persist.sys.iwpriv_cntl`
logi "cmd=$cmd"
`$cmd`
setprop persist.sys.iwpriv_cntl null
exit 0
