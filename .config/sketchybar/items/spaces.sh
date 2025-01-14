#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "S")

for sid in $(aerospace list-workspaces --all);
do
  if [ $sid == "S" ]; then
      continue
  fi
  space=(
    space=1
    icon="${SPACE_ICONS[sid-1]}"
    icon.padding_left=10
    icon.padding_right=10
    padding_left=2
    padding_right=2
    label.padding_right=20
    icon.highlight_color=$RED
    label.color=$GREY
    label.highlight_color=$WHITE
    label.font="sketchybar-app-font:Regular:16.0"
    label.y_offset=-1
    background.color=$BACKGROUND_1
    background.border_color=$BACKGROUND_2
    script="$CONFIG_DIR/plugins/aerospace.sh $sid"
    click_script="aerospace workspace $sid"
  )

  sketchybar --add item space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid aerospace_workspace_change
done

space_creator=(
  icon=􀆊
  icon.font="$FONT:Heavy:16.0"
  padding_left=10
  padding_right=8
  label.drawing=off
  display=active
  click_script='aerospace workspace next --wrap-around'
  script="$PLUGIN_DIR/space_windows.sh"
  icon.color=$WHITE
)

sketchybar --add item space_creator left               \
           --set space_creator "${space_creator[@]}"   \
           --subscribe space_creator space_windows_change
