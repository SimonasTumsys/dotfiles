#!/bin/bash

BAT="BAT0"
START="/sys/class/power_supply/$BAT/charge_start_threshold"
STOP="/sys/class/power_supply/$BAT/charge_stop_threshold"

echo 95 | sudo tee "$START"
echo 100 | sudo tee "$STOP"

notify-send "Battery Threshold" "Charge stop threshold set to 100%"


while true; do
  STATUS=$(cat /sys/class/power_supply/$BAT/status)
  CAPACITY=$(cat /sys/class/power_supply/$BAT/capacity)

  if [[ "$STATUS" == "Discharging" && "$CAPACITY" -ge 99 ]]; then

      echo 75 | sudo tee $START
      echo 80 | sudo tee $STOP

      notify-send "Battery Threshold" "Charge stop threshold reset back to 80%"
      break
  fi

  sleep 60
done

