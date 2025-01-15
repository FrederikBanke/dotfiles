#!/bin/bash

POPUP_OFF='sketchybar --set apple.logo popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

apple_logo=(
  icon=$APPLE
  icon.font="$FONT:Black:16.0"
  icon.padding_left=8
  icon.padding_right=8
  # icon.color=$GREEN
  background.color=$BACKGROUND_2
  background.border_color=$BLACK
  background.border_width=1
  padding_left=1
  padding_right=1
  label.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
  popup.height=35
)

apple_prefs=(
  icon=$PREFERENCES
  label="Preferences"
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

apple_activity=(
  icon=$ACTIVITY
  label="Activity"
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

apple_lock=(
  icon=$LOCK
  label="Lock Screen"
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

apple_bracket=(
    background.color=$TRANSPARENT
    background.height=30
    background.border_color=$GREY
)

sketchybar --add item apple_bracket_left left          \
           --set apple_bracket_left width=5            \
           --add item apple.logo left                  \
           --set apple.logo "${apple_logo[@]}"         \
                                                       \
           --add item apple.prefs popup.apple.logo     \
           --set apple.prefs "${apple_prefs[@]}"       \
                                                       \
           --add item apple.activity popup.apple.logo  \
           --set apple.activity "${apple_activity[@]}" \
                                                       \
           --add item apple.lock popup.apple.logo      \
           --set apple.lock "${apple_lock[@]}"         \
                                                       \
           --add bracket apple_bracket apple.logo      \
           --set apple_bracket "${apple_bracket[@]}"   \
                                                       \
           --add item apple_bracket_right left         \
           --set apple_bracket_right width=7
