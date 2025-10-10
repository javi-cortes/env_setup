#!/usr/bin/env bash
# ~/.config/sway/scripts/new_ws_move.sh

# figure out the next workspace number
next=$(swaymsg -t get_workspaces \
       | jq -r 'max_by(.num).num + 1')

# move the focused container there…
swaymsg move container to workspace number "$next"
# …and switch you to it
swaymsg workspace number "$next"
