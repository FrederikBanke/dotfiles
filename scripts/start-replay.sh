#!/bin/sh

pidof -q gpu-screen-recorder && exit 0
video_path="$HOME/Videos"
mkdir -p "$video_path"
notify-send -t 1500 -u low -- "GPU Screen Recorder" "Start replay"
gpu-screen-recorder -w screen -f 60 -a default_output -a default_input -c mkv -r 60 -o "$video_path" -q very_high -restart-replay-on-save yes
