#!/bin/bash

xrandr --output DP-2 --off # Turns off malfunctioning monitor

xrandr --output DP-2 --auto --right-of DP-3 # Turns monitor back on in proper position

xrandr --output DP-3 --primary # Sets primary monitor

