#!/bin/bash

COMMON_DIR=$(cd `dirname $0`; pwd)
if [ -h $0 ]
then
        CMD=$(realpath $0)
        COMMON_DIR=$(dirname $CMD)
fi
TOP_DIR=$(realpath $COMMON_DIR/../../..)
UPGRADETOOL=$TOP_DIR/tools/linux/Linux_Upgrade_Tool/Linux_Upgrade_Tool/upgrade_tool
ROCKDEV_DIR=$TOP_DIR/rockdev
LOADER=$ROCKDEV_DIR/MiniLoaderAll.bin
PARAMETER=$ROCKDEV_DIR/parameter.txt
UBOOT=$ROCKDEV_DIR/uboot.img
TRUST=$ROCKDEV_DIR/trust.img
BOOT=$ROCKDEV_DIR/boot.img
RECOVERY=$ROCKDEV_DIR/recovery.img
OEM=$ROCKDEV_DIR/oem.img
MISC=$ROCKDEV_DIR/misc.img
ROOTFS=$ROCKDEV_DIR/rootfs.img
USERDATA=$ROCKDEV_DIR/userdata.img

if [ ! -n "$1" ]
then
echo "flash all images as default"
FLASH_TYPE=all
else
FLASH_TYPE="$1"
fi

if [ $FLASH_TYPE = all ]
then
	$UPGRADETOOL ul $LOADER
	$UPGRADETOOL di -p $PARAMETER
	$UPGRADETOOL di -uboot $UBOOT
	$UPGRADETOOL di -trust $TRUST
	$UPGRADETOOL di -b $BOOT
	$UPGRADETOOL di -r $RECOVERY
	$UPGRADETOOL di -m $MISC
	$UPGRADETOOL di -oem $OEM
	$UPGRADETOOL di -userdata $USERDATA
	$UPGRADETOOL di -rootfs $ROOTFS
fi

if [ $FLASH_TYPE = loader ]
then
	$UPGRADETOOL ul $LOADER
	exit 0
fi

if [ $FLASH_TYPE = parameter ]
then
	$UPGRADETOOL di -p $PARAMETER
fi

if [ $FLASH_TYPE = uboot ]
then
	$UPGRADETOOL di -uboot $UBOOT
fi

if [ $FLASH_TYPE = trust ]
then
	$UPGRADETOOL di -trust $TRUST
fi

if [ $FLASH_TYPE = boot ]
then
	$UPGRADETOOL di -b $BOOT
fi

if [ $FLASH_TYPE = recovery ]
then
	$UPGRADETOOL di -r $RECOVERY
fi

if [ $FLASH_TYPE = misc ]
then
	$UPGRADETOOL di -misc $MISC
fi

if [ $FLASH_TYPE = oem ]
then
	$UPGRADETOOL di -oem $OEM
fi

if [ $FLASH_TYPE = userdata ]
then
	$UPGRADETOOL di -userdata $USERDATA
fi

if [ $FLASH_TYPE = rootfs ]
then
	$UPGRADETOOL di -rootfs $ROOTFS
fi

if [ $FLASH_TYPE = rd ]
then
	$UPGRADETOOL rd
fi

