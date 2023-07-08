# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=alioth
device.name2=aliothin
device.name3=apollo
device.name4=apolloin
device.name5=lmi
device.name6=cmi
device.name7=umi
device.name8=munch
device.name9=munchin
supported.versions=11 - 13
supported.patchlevels=
'; } # end properties

# shell variables
block=boot;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;
no_block_display=1

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## Select the correct image to flash
userflavor="$(file_getprop /system/build.prop "ro.build.flavor")";
case "$userflavor" in
    aospa*) os="aospa"; os_string="Paranoid Android ROM";;
    qssi-user) os="miui"; os_string="MIUI ROM";;
    missi-user) os="miui"; os_string="MIUI ROM";;
    *) os="aosp"; os_string="AOSP ROM";;
esac;
ui_print "  -> $os_string is detected!";

## AnyKernel boot install
split_boot;

flash_boot;
flash_dtbo;
## end boot install

# Vendor boot
#block=vendor_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for vendor_boot patching
#reset_ak;

## AnyKernel vendor_boot install
#split_boot;

#flash_boot;
## end vendor_boot install
