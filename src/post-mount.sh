#!/system/bin/sh
LOG="/data/local/tmp/apple-electr-bootanim.log"

echo "$(cut -d' ' -f1 /proc/uptime)" > "$LOG"

setprop ctl.restart bootanim
