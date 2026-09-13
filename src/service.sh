#!/system/bin/sh
MODDIR="${0%/*}"
SRC="$MODDIR/files/bootanimation.zip"

sleep 3

if [ -f "$SRC" ]; then
    chmod 644 "$SRC"
    chcon u:object_r:system_file:s0 "$SRC" 2>/dev/null

    for TARGET in \
        /product/media/bootanimation.zip \
        /product/media/bootanimation-dark.zip \
        /product/media/bootanimation_dark.zip \
        /system/product/media/bootanimation.zip \
        /system/product/media/bootanimation-dark.zip \
        /system/product/media/bootanimation_dark.zip
    do
        if [ -f "$TARGET" ]; then
            mount -o bind "$SRC" "$TARGET"
            chcon u:object_r:system_file:s0 "$TARGET" 2>/dev/null
        fi
    done
fi
