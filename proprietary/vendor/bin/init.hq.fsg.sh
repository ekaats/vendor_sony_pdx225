#!/vendor/bin/sh

pcbid=`cat /sys/bus/platform/drivers/HardwareInfo/HardwareInfo/modem_id`
echo "pcbid is : $pcbid"
if [ ! -f mnt/vendor/persist/flag/fsg_flag ];then
    fsg_flag_path="/mnt/vendor/persist/flag/fsg_flag"

case "$pcbid" in
        "A4")
        if [ -f /vendor/etc/fsg/A_fs_image.tar.gz.mbn.img ]; then
            dd if=/vendor/etc/fsg/A_fs_image.tar.gz.mbn.img of=/dev/block/bootdevice/by-name/fsg
        fi
        echo "write A4 fsg"
        ;;
        "K4/S4")
        if [ -f /vendor/etc/fsg/B_fs_image.tar.gz.mbn.img ]; then
            dd if=/vendor/etc/fsg/B_fs_image.tar.gz.mbn.img of=/dev/block/bootdevice/by-name/fsg
        fi
        echo "write K4/S4 fsg"
        ;;
        "J4")
        if [ -f /vendor/etc/fsg/C_fs_image.tar.gz.mbn.img ]; then
            dd if=/vendor/etc/fsg/C_fs_image.tar.gz.mbn.img of=/dev/block/bootdevice/by-name/fsg
        fi
        echo "write J4 fsg"
        ;;
        "C2")
        if [ -f /vendor/etc/fsg/D_fs_image.tar.gz.mbn.img ]; then
            dd if=/vendor/etc/fsg/D_fs_image.tar.gz.mbn.img of=/dev/block/bootdevice/by-name/fsg
        fi
        echo "write C2 fsg"
        ;;
        "N1")
        if [ -f /vendor/etc/fsg/E_fs_image.tar.gz.mbn.img ]; then
            dd if=/vendor/etc/fsg/E_fs_image.tar.gz.mbn.img of=/dev/block/bootdevice/by-name/fsg
        fi
        echo "write N1 fsg"
        ;;
esac

touch $fsg_flag_path
echo $pcbid > $fsg_flag_path

fi
