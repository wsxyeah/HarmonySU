#!/bin/bash

SYSTEM_IMG_PATH=$1
SU_PATH=$2
MOUNT_POINT=/mnt/ohos_system

if [ $(uname -s) != "Linux" ]; then
    echo "Run this script on Linux only"
    exit 1
fi
if [ $(id -u) -ne 0 ]; then
    echo "Run this script as root"
    exit 1
fi
if [ -z $SYSTEM_IMG_PATH ] || [ -z $SU_PATH ]; then
    echo "Usage: $0 <system.img> <su>"
    exit 1
fi

echo "Backing up $SYSTEM_IMG_PATH to $SYSTEM_IMG_PATH.bak"
cp $SYSTEM_IMG_PATH $SYSTEM_IMG_PATH.bak

echo "Patching $SYSTEM_IMG_PATH"
mkdir -p $MOUNT_POINT
mount -o loop $SYSTEM_IMG_PATH $MOUNT_POINT
cp $SU_PATH $MOUNT_POINT/system/bin/su
chown root:root $MOUNT_POINT/system/bin/su
chmod 6755 $MOUNT_POINT/system/bin/su
umount $MOUNT_POINT

echo "Done"
