#!/bin/bash

notify-send "Getting a list of available BT devices..."
bt_list=$(bluetoothctl list)
