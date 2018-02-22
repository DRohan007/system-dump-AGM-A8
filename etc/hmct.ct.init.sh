#!/system/bin/sh
# current test initial
stop mpdecision
stop thermal-engine
echo 1 > /sys/devices/system/cpu/cpu0/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo 600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 1 > /sys/kernel/debug/nohlt
#stop