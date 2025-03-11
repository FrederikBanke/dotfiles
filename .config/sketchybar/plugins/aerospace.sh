#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --animate linear 10 \
               --set $NAME background.color=$MAGENTA \
                           icon.padding_right=30
else
    sketchybar --animate linear 10 \
               --set $NAME background.color=$BACKGROUND_2 \
                           icon.padding_right=5
fi
