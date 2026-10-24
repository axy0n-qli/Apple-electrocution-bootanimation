#!/system/bin/sh
LOG="/data/local/tmp/bootanim_time.log"

echo "$(cut -d' ' -f1 /proc/uptime)" > "$LOG"

setprop ctl.restart bootanim
