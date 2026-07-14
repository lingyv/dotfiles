#!/usr/bin/env bash
# Called by AeroSpace exec-on-workspace-change

SKETCHYBAR_CONFIG="$HOME/.config/sketchybar"
PLUGIN_DIR="$SKETCHYBAR_CONFIG/plugins"

create_workspace_item() {
  local ws="$1"
  sketchybar --add item space.$ws left space_separator \
    --subscribe space.$ws aerospace_workspace_change \
    --set space.$ws \
    drawing=off \
    background.color=0x44ffffff \
    background.corner_radius=5 \
    background.drawing=on \
    background.border_color=0xAAFFFFFF \
    background.border_width=0 \
    background.height=25 \
    icon="$ws" \
    icon.padding_left=10 \
    icon.shadow.drawing=off \
    label.font="sketchybar-app-font:Regular:16.0" \
    label.padding_right=20 \
    label.padding_left=0 \
    label.y_offset=-1 \
    label.shadow.drawing=off \
    click_script="aerospace workspace $ws" \
    script="$PLUGIN_DIR/aerospace.sh $ws"
}

reorder_workspaces() {
  # Get all space items sorted numerically
  local sorted
  sorted=$(sketchybar --query bar 2>/dev/null | python3 -c "
import sys, json, re
items = json.load(sys.stdin).get('items', [])
spaces = []
for i in items:
    m = re.match(r'space\.(\d+)$', i)
    if m:
        spaces.append((int(m.group(1)), i))
spaces.sort()
for _, name in spaces:
    print(name)
" 2>/dev/null)

  # Reorder by moving each item after the previous one
  local prev=""
  for item in $sorted; do
    if [ -z "$prev" ]; then
      sketchybar --move "$item" after space_separator 2>/dev/null
      # Actually, move to the beginning of left items
      sketchybar --move "$item" before space_separator 2>/dev/null
    else
      sketchybar --move "$item" after "$prev" 2>/dev/null
    fi
    prev="$item"
  done
}

# Ensure workspace items exist for both focused and previous workspaces
changed=false
for ws in "$@"; do
  if ! sketchybar --query space.$ws &>/dev/null; then
    create_workspace_item "$ws"
    changed=true
  fi
done

# If we created new items, reorder all workspaces
if [ "$changed" = true ]; then
  reorder_workspaces
fi

# Trigger the event for all involved workspaces
for ws in "$@"; do
  sketchybar --trigger aerospace_workspace_change \
    FOCUSED_WORKSPACE="$1" \
    PREV_WORKSPACE="$2"
done
