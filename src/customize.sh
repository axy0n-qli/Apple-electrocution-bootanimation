#!/system/bin/sh

SKIPUNZIP=1

ui_print "- Installing Apple electrocution bootanimation"

ui_print "- Extract bootanimation.zip"
unzip -o "$ZIPFILE" "files/bootanimation.zip" -d "$TMPDIR/.apple_bootanimation_unzip"

ui_print "- Find system bootanimation"
TARGETS=$(find /product /system -name 'bootanimation*.zip' -type f -print)

ui_print "- Create bootanimation overlay"
for TARGET in $TARGETS; do
    ui_print "- Found animation at '$TARGET'"

    DEST=
    HEAD="${TARGET#*/}"

    case "$HEAD" in
        /system) DEST="${MODPATH}${TARGET}" ;;
        *) DEST="${MODPATH}/system${TARGET}" ;;
    esac

    mkdir -p $(dirname "$DEST")
    cp -f "$TMPDIR/.apple_bootanimation_unzip/files/bootanimation.zip" "$DEST"
    set_perm "$DEST" 0 0 0644 "u:object_r:system_file:s0"
done

ui_print "- Extract module files"
unzip -o "$ZIPFILE" "module.prop" -d "$MODPATH"
unzip -o "$ZIPFILE" "action.sh" -d "$MODPATH"
unzip -o "$ZIPFILE" "post-mount.sh" -d "$MODPATH"
unzip -o "$ZIPFILE" "webroot/*" -d "$MODPATH"

ui_print "- Fixing Permissions"
set_perm "$MODPATH/action.sh" 0 0 0755 "u:object_r:system_file:s0"
set_perm "$MODPATH/post-mount.sh" 0 0 0755 "u:object_r:system_file:s0"
