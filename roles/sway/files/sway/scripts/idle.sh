#!/bin/sh
# Idle handling: lock at 10 min, screens off at 30 min.
# pkill and start must run in the same shell, sequentially. Two separate
# exec_always lines race and the pkill can kill the freshly spawned swayidle.
pkill -x swayidle

exec swayidle -w \
    timeout 600 'swaylock -f' \
    timeout 1800 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' \
    before-sleep 'swaylock -f'
