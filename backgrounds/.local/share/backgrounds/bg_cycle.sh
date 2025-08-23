#!/bin/bash

SELF_PID=$$

# Kill all other processes ending with bg_cycle.sh
for pid in $(ps -eo pid,cmd | grep 'bg_cycle.sh' | grep -v grep | awk '{print $1}'); do
    if [[ "$pid" != "$SELF_PID" ]]; then
        echo "Killing old instance: $pid"
        kill "$pid" 2>/dev/null
    fi
done

while true; do
  feh --randomize --bg-scale ~/.local/share/backgrounds/images/*
  sleep 600 # 10 minutes
done

