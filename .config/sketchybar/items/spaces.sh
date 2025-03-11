#!/bin/bash

# We need to add this to create padding for the spaces bracket.
sketchybar --add item space.left left\
           --set space.left background.drawing=off \
                            width=4

for sid in $(aerospace list-workspaces --all);
do
  if [ $sid == "S" ]; then
      continue
  fi
  space=(
    space=1
    icon.padding_left=5
    icon.padding_right=5
    padding_left=2
    padding_right=2
    icon.highlight_color=$RED
    label.color=$GREY
    label.highlight_color=$WHITE
    label.font="sketchybar-app-font:Regular:16.0"
    label.y_offset=-1
    background.color=$BACKGROUND_2
    background.drawing=on
    background.corner_radius=100
    background.height=15
    script="$CONFIG_DIR/plugins/aerospace.sh $sid"
    click_script="aerospace workspace $sid"
  )

  sketchybar --add item space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid aerospace_workspace_change
done

# The right padding for spaces bracket.
sketchybar --add item space.right left\
           --set space.right background.drawing=off \
                             width=10

space_creator=(
  icon=􀆊
  icon.font="$FONT:Heavy:16.0"
  padding_left=10
  padding_right=8
  label.drawing=off
  display=active
  click_script='aerospace workspace next --wrap-around'
  icon.color=$WHITE
)

# sketchybar --add item space_creator left               \
#            --set space_creator "${space_creator[@]}"
