#!/usr/bin/env bash

WORKSPACE="$1"

# If this workspace item doesn't exist yet, create it
if ! sketchybar --query space.$WORKSPACE &>/dev/null; then
  sketchybar --add item space.$WORKSPACE left space_separator \
    --subscribe space.$WORKSPACE aerospace_workspace_change \
    --set space.$WORKSPACE \
    drawing=off \
    background.color=0x44ffffff \
    background.corner_radius=5 \
    background.drawing=on \
    background.border_color=0xAAFFFFFF \
    background.border_width=0 \
    background.height=25 \
    icon="$WORKSPACE" \
    icon.padding_left=10 \
    icon.shadow.drawing=off \
    label.font="sketchybar-app-font:Regular:16.0" \
    label.padding_right=20 \
    label.padding_left=0 \
    label.y_offset=-1 \
    label.shadow.drawing=off \
    click_script="aerospace workspace $WORKSPACE" \
    script="$CONFIG_DIR/plugins/aerospace.sh $WORKSPACE"
fi

# Update app icons for this workspace (with timeout protection)
apps=$( gtimeout 2s aerospace list-windows --workspace "$WORKSPACE" 2>/dev/null | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}' )

icon_strip=" "
if [ -n "$apps" ]; then
  while read -r app; do
    icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
  done <<<"$apps"
fi

if [ "$WORKSPACE" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME \
    drawing=on \
    background.color=0x88FF00FF \
    label="$icon_strip" \
    label.shadow.drawing=off \
    icon.shadow.drawing=off \
    background.border_width=2
else
  if [ -n "$apps" ]; then
    sketchybar --set $NAME \
      drawing=on \
      background.color=0x44FFFFFF \
      label="$icon_strip" \
      label.shadow.drawing=off \
      icon.shadow.drawing=off \
      background.border_width=0
  else
    sketchybar --set $NAME drawing=off
  fi
fi

# Also update the previous workspace if it lost/gained a window
if [ -n "$PREV_WORKSPACE" ] && [ "$PREV_WORKSPACE" != "$WORKSPACE" ]; then
  prev_apps=$( gtimeout 2s aerospace list-windows --workspace "$PREV_WORKSPACE" 2>/dev/null | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}' )
  prev_icon_strip=" "
  if [ -n "$prev_apps" ]; then
    while read -r app; do
      prev_icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<<"$prev_apps"
  fi
  if [ -n "$prev_apps" ]; then
    sketchybar --set space.$PREV_WORKSPACE \
      drawing=on \
      background.color=0x44FFFFFF \
      label="$prev_icon_strip" \
      label.shadow.drawing=off \
      icon.shadow.drawing=off \
      background.border_width=0
  else
    sketchybar --set space.$PREV_WORKSPACE drawing=off
  fi
fi
