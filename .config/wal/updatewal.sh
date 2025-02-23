#!/bin/bash

# Script for updating wallpaper and colors matching the new wallpaper.
# Uses pywal.

wal -q -i "$HOME/Sync/Desktop Wallpapers/"

# Add wallpaper to variable
wallpaper=$(< $HOME/.cache/wal/wal)
echo "Wallpaper set to: $wallpaper"
# Load current pywal color scheme
source "$HOME/.cache/wal/colors.sh"

# Copy color file to waybar folder
cp ~/.cache/wal/colors-waybar.css ~/dotfiles/.config/waybar/

# Get wallpaper image name
wallpaper_name=$(echo $wallpaper | sed "s|$HOME/Sync/Desktop Wallpapers/||g")

# Set the new wallpaper
hyprctl hyprpaper preload "$wallpaper" &
hyprctl hyprpaper wallpaper ",$wallpaper" &

notify-send "Wallpaper set to $wallpaper_name."

# Reload waybar
# ~/dotfiles/.config/waybar/launch.sh
