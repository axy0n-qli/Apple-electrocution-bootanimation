#!/system/bin/sh
LOG="/data/local/tmp/bootanim_time.log"

echo "start $(date +%T) uptime=$(cut -d' ' -f1 /proc/uptime)" > "$LOG"

setprop ctl.restart bootanim