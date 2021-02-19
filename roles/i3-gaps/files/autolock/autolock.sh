#!/bin/sh
exec xautolock -detectsleep -time 15 -locker "exec betterlockscreen -l" -corners ---- -cornersize 30 -notify 30 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" &
