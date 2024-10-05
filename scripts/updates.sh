# Script is from My Linux For Work

# Define thresholds for color indicators
threshold_green=0
threshold_yellow=25
threshold_red=100

# Calculate available updates (with trizen)
# Check updates for main arch packages
if ! updates_arch=$(checkupdates 2> /dev/null | wc -l); then
    updates_arch=0
fi
# Check updates for AUR packages
if ! updates_aur=$(yay -Qu --aur --quiet | wc -l); then
    updates_aur=0
fi

# Compute total updates
updates=$(("$updates_arch" + "$updates_aur"))

# Testing

# Overwrite updates with numbers for testing
# updates=120

# Test JSON output
# printf '{"text": "0", "alt": "0", "tooltip": 0 updates", "class": "red"}'
# exit

# Output in JSON format for Waybar module custom-updates

css_class="green"

if [ "$updates" -gt $threshold_yellow ]; then
    css_class="yellow"
fi

if [ "$updates" -gt $threshold_red ]; then
    css_class="red"
fi

if [ "$updates" -gt $threshold_green ]; then
    printf '{"text": "%s", "alt": "%s", "tooltip": "%s Updates", "class": "%s"}' "$updates" "$updates" "$updates" "$css_class"
else
    printf '{"text": "0", "alt": "0", "tooltip": "0 Updates", "class": "green"}'
fi