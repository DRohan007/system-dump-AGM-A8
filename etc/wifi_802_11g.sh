#!bin/sh
LOG_TAG="wifitest_802_11g"
LOG_NAME="${0}:"

loge ()
{
	/system/bin/log -t $LOG_TAG -p e "$LOG_NAME $@"
}

logi ()
{
	/system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

#set flag of wifi status
setprop persist.sys.wifi.status running

#wifi channel id range: 1 ~ 13
for channelid in 1 2 3 4 5 6 7 8 9 10 11 12 13;
do
	logi "statr test wifi protocol 802.11b, channelid = $channelid"
	echo "wifi device current channel($channelid)";
	rmmod wlan
	insmod /system/lib/modules/wlan.ko con_mode=5
	iwpriv wlan0 ftm 1
	iwpriv wlan0 ena_chain 1
	iwpriv wlan0 pwr_cntl_mode 2
	iwpriv wlan0 set_channel $channelid
	iwpriv wlan0 set_txrate 11A_54_MBPS
	iwpriv wlan0 set_txpower 12
	iwpriv wlan0 tx 1
	sleep 10
	iwpriv wlan0 tx 0
	iwpriv wlan0 set_channel $channelid
	iwpriv wlan0 rx 1
	sleep 5
	iwpriv wlan0 get_rxpktcnt
	iwpriv wlan0 rx 0
done;

setprop persist.sys.wifi.status stopped

logi "wifi protocol 802.11g test end"

exit 0