#!/usr/bin/env bash
# Creative SoundBlaster Z output switcher
# Toggles the main output to headphones

DEVICE=$(awk '/\[Creative/ {print $1}' /proc/asound/cards)
STATE=$(amixer -c "${DEVICE}" sget "HP/Speaker Auto Detect" | grep -Po "(?<=\[)(.*?)(?=\])")

if [ "$STATE" == "on" ]; then
  amixer -c "${DEVICE}" sset "HP/Speaker Auto Detect" off >/dev/null 2>&1
elif [ "$STATE" == "off" ]; then
  amixer -c "${DEVICE}" sset "HP/Speaker Auto Detect" on >/dev/null 2>&1
fi
