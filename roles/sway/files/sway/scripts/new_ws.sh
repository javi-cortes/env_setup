#!/usr/bin/env bash
# new_ws.sh

# debug – uncomment to log:
# echo "$(date): get_workspaces → $(swaymsg -t get_workspaces)" >> /tmp/new_ws.log

next=$(swaymsg -t get_workspaces \
       | jq -r 'max_by(.num).num + 1')
swaymsg workspace number "$next"
