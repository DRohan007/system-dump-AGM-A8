#!/system/bin/sh

createdir()
{
     mkdir /data/media/0/FactoryLog
     chown media_rw:media_rw /data/media/0/FactoryLog
     chmod 775 /data/media/0/FactoryLog
}

while true
do
    if [ ! -d "/data/media/0" ]; then
        echo "not found /data/media/0"
    else
        if [ -d "/data/media/0/FactoryLog" ]; then
            echo "found /data/media/FactoryLog"
            break
        else
            createdir
            break
        fi
    fi
    sleep 1
done
