#!/bin/bash

dingtalk=(
  update_freq=10
  icon=":dingtalk:"
  icon.font="sketchybar-app-font:Regular:14.0"
  icon.padding_left=10
  # background.color=$BACKGROUND_1
  # background.border_color=$BACKGROUND_2
  # background.height=30
  # background.corner_radius=9
  # background.border_width=2
  # padding_right=10
  label.padding_right=10
  label.font="SF Pro:Semibold:14.0"
  script="$CONFIG_DIR/plugins/app_status.sh"
  click_script="open -a DingTalk"
)

sketchybar --add item dingtalk right \
  --set dingtalk "${dingtalk[@]}"
