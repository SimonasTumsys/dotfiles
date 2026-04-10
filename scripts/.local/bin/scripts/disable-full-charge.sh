#!/bin/bash

BAT="BAT0"
START="/sys/class/power_supply/$BAT/charge_start_threshold"
STOP="/sys/class/power_supply/$BAT/charge_stop_threshold"


echo 75 | sudo tee $START
echo 80 | sudo tee $STOP

notify-send "Battery Threshold" "Charge stop threshold reset back to 80%"


