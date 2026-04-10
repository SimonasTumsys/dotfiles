#!/bin/bash

BAT="BAT0"
START="/sys/class/power_supply/$BAT/charge_start_threshold"
STOP="/sys/class/power_supply/$BAT/charge_stop_threshold"

echo 100 | sudo tee "$STOP"
echo 95 | sudo tee "$START"

notify-send "Battery Threshold" "Charge stop threshold set to 100%"

