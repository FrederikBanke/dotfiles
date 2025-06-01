#!/bin/bash

# Define the workspace number you want to switch to
WORKSPACE=dotfiles

# Define the terminal command you want to use (e.g., alacritty, kitty, etc.)
TERMINAL="ghostty"

# Check if there is already a terminal open in the specified workspace
if hyprctl clients | grep -q "workspace:.*$WORKSPACE" && hyprctl clients | grep -q "$TERMINAL"; then
    # If a terminal is already open, just switch to the workspace
    hyprctl dispatch workspace name:$WORKSPACE
else
    # If no terminal is open, open a new terminal with tmux and switch to the workspace
    hyprctl dispatch workspace name:$WORKSPACE
    hyprctl dispatch exec "$TERMINAL -e 'tmux new -A -s dots'"
fi
