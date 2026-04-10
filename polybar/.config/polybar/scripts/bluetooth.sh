#!/bin/bash

COLOR_BLUE="#7aa2f7"
COLOR_WHITE="#787c99"

get_power_state() {
    bluetoothctl show | grep "PowerState" | awk '{ print $2 }'
}

is_devices_connected() {
  local connected=$(bluetoothctl devices Connected)

  if [[ -z "$connected" ]]; then
    echo 0
  else
    echo 1
  fi
}

show_bluetooth_status() {
  local state=$(get_power_state)
  if [[ "$state" == "on" ]]; then
    local connected=$(is_devices_connected)
    if ((connected)); then
      echo "%{F$COLOR_BLUE}󰂯%{F-}"
    else
      echo "%{F$COLOR_WHITE}󰂯%{F-}"
    fi
  else
    echo "󰂲"
  fi
}

get_color_by_connection_status() {
  local connected=$(is_devices_connected)

  if ((connected)); then
    echo COLOR_BLUE
  else
    echo COLOR_WHITE
  fi
}


toggle_bluetooth() {
  local state=$(get_power_state)
  if [[ "$state" == "on" ]]; then
      bluetoothctl power off
  else
      bluetoothctl power on
  fi
}

launch_applet() {
  # kill if already running
  pkill blueman-applet
  # relaunch detached
  nohup blueman-applet >/dev/null 2>&1 &
}

"$@"
