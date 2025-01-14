#!/bin/bash

if [ "$SENDER" = "space_windows_change" ]; then
  for sid in $(aerospace list-workspaces --all);
  do
    space=$sid
    if [ $sid == "S" ]; then
        continue
    fi
    app_count="$(echo $(aerospace list-windows --workspace $space --count))"
    icon_strip=" "
    if [ "${app_count}" != "0" ]; then
      app_list="$(echo "$(aerospace list-windows --workspace $space --format %{app-name})")"
      IFS=$'\n'
      for app in $app_list
      do
        icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
      done 
      unset IFS
    else
      icon_strip=" —"
    fi
    sketchybar --animate sin 10 --set space.$space label="$icon_strip"
  done
fi
