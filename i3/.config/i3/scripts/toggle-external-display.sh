#!/bin/bash

# Get the internal display (usually eDP-1 or LVDS-1)
INTERNAL=$(xrandr | grep " connected" | grep -E "eDP|LVDS" | cut -d" " -f1)

# Get the external display (usually HDMI or DP)
EXTERNAL=$(xrandr | grep " connected" | grep -vE "eDP|LVDS" | cut -d" " -f1)

# State file to track current mode
STATE_FILE="/tmp/display_mode_state"

# If no external display is connected, exit
if [ -z "$EXTERNAL" ]; then
    exit 0
fi

# Read current state (default to "laptop" if file doesn't exist)
if [ -f "$STATE_FILE" ]; then
    CURRENT_STATE=$(cat "$STATE_FILE")
else
    CURRENT_STATE="laptop"
fi

# Cycle through modes: laptop -> mirror -> external -> extend -> laptop
case $CURRENT_STATE in
    "laptop")
        # Switch to mirror mode
        xrandr --output "$INTERNAL" --auto --output "$EXTERNAL" --auto --same-as "$INTERNAL"
        echo "mirror" > "$STATE_FILE"
        notify-send "Display Mode" "Mirror Mode" -t 2000
        ;;
    "mirror")
        # Switch to external only
        xrandr --output "$INTERNAL" --off --output "$EXTERNAL" --auto
        echo "external" > "$STATE_FILE"
        notify-send "Display Mode" "External Only" -t 2000
        ;;
    "external")
        # Switch to extend mode (external to the right)
        xrandr --output "$INTERNAL" --auto --output "$EXTERNAL" --auto --right-of "$INTERNAL"
        echo "extend" > "$STATE_FILE"
        notify-send "Display Mode" "Extended Mode" -t 2000
        ;;
    "extend")
        # Switch back to laptop only
        xrandr --output "$INTERNAL" --auto --output "$EXTERNAL" --off
        echo "laptop" > "$STATE_FILE"
        notify-send "Display Mode" "Laptop Only" -t 2000
        ;;
    *)
        # Default case: laptop only
        xrandr --output "$INTERNAL" --auto --output "$EXTERNAL" --off
        echo "laptop" > "$STATE_FILE"
        ;;
esac
