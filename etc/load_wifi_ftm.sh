#!/system/bin/sh
rmmod wlan.ko
insmod /system/lib/modules/wlan.ko con_mode=5
ptt_socket_app -f
