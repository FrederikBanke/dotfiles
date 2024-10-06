# Launch script for waybar.
# Kill all running waybar instances
killall waybar
pkill waybar

# Load waybar with config
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css &
