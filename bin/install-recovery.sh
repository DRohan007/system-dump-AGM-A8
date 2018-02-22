#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:11287852:6f0f72041f6bfdb2d3cd32a19d4a2f3ac754065c; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:8965416:a0846e6357a5c04684875a6d77559e2b62a56a4f EMMC:/dev/block/bootdevice/by-name/recovery 6f0f72041f6bfdb2d3cd32a19d4a2f3ac754065c 11287852 a0846e6357a5c04684875a6d77559e2b62a56a4f:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
