#!/system/bin/sh
MODDIR="${0%/*}"
SRC="$MODDIR/files/bootanimation.zip"

[ -f "$SRC" ] || exit 0

chmod 644 "$SRC"
chcon u:object_r:system_file:s0 "$SRC" 2>/dev/null

for TARGET in \
    /product/media/bootanimation.zip \
    /product/media/bootanimation-dark.zip \
    /product/media/bootanimation_dark.zip
do
    [ -f "$TARGET" ] && mount -o bind "$SRC" "$TARGET"
done

setprop ctl.restart bootanim