#!/system/bin/sh

savelog()
{
    LOGPATH=$STORAGEPATH/FactoryLog
    LOGFILE=$LOGPATH/Kmsg_Log
    touch $LOGFILE
    chown media_rw:media_rw $LOGFILE
    cat /proc/kmsg >> $LOGFILE
}

STORAGEPATH=/data/media/0

while true
do
    if [ ! -d "/data/media/0/FactoryLog" ]; then
        echo "not found /data/media/FactoryLog"
    else
        savelog 
    fi
    sleep 1
done
