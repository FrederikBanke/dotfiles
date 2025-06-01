#!/bin/bash

# Check if app is running. If a third argument is passed, it is used for the pid instead.
# Otherwise, use the app name of the 1st argument.
if pgrep -x "${3:-$1}" >/dev/null; then
    # App is running, switch to workspace
    hyprctl dispatch workspace name:$2
    if [ "$1" = "zen-browser" ]; then
        # code to execute if condition is true
        hyprctl dispatch focuswindow class:zen
    fi
else
    # App is not running, launch app and switch to workspace
    notify-send -t 3000 -u low -- "Switch to $2" "Switching to $2 workspace, and launching $1."
    hyprctl dispatch workspace name:$2
    hyprctl dispatch exec $1 &
    disown
fi
