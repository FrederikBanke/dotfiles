#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$FONT:Regular:19.0"
  padding_right=5
  padding_left=0
  label.drawing=off
  update_freq=120
  updates=on
)
battery_label=(
  padding_right=0
  padding_left=0
  label.drawing=on
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
sketchybar --add item battery.label right      \
           --set battery.label "${battery_label[@]}"
