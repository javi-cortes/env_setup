#!/usr/bin/env bash
# doesnt work as i3 exec so put it here
pkill compton
compton -b --config ~/.config/compton/compton.conf
