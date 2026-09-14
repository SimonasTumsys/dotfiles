#!/usr/bin/env bash

# Terminate existing instances
killall -q polybar

# Wait until they're actually gone
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 0.5; done

# Launch one bar per connected monitor
if type xrandr >/dev/null 2>&1; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload toph &
  done
else
  polybar --reload toph &
fi

echo "Polybar launched"
