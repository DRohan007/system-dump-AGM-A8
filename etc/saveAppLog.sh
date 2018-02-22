#!/system/bin/sh

savelog()
{
    LOGPATH=$STORAGEPATH/FactoryLog
    LOGFILE=$LOGPATH/App_Log
    touch $LOGFILE
    chown media_rw:media_rw $LOGFILE
    echo -e "\n\n\n\nSystem log begin!!!\n" | cat >> $LOGFILE
    echo -e "\n\n\n\nRadio log begin!!!\n" | cat >> $LOGFILE
    echo -e "\n\n\n\nMain log begin!!!\n" | cat >> $LOGFILE
    logcat -bsystem -bradio -bmain -v threadtime >> $LOGFILE
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

