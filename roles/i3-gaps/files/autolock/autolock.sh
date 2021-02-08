#!/bin/sh
exec xautolock -detectsleep -time 15 -locker "exec i3lock -t -i $(find ~/.config/wallpapers/ | shuf -n1)" -corners ---- -cornersize 30 -notify 30 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" &
