#!/bin/bash
# 获取触摸板ID
TP_ID=$(xinput list | grep Synaptics | cut -f 2 | grep -Eo '[0-9]{1,}')

if [ -n "$TP_ID" ]; then
    # libinput Natural Scrolling Enabled ID 设置自然滚动
    NS_ID=$(xinput list-props "$TP_ID" | grep 'Natural Scrolling Enabled (' | cut -f 2 | grep -Eo '[0-9]{1,}')
    xinput set-prop "$TP_ID" "$NS_ID" 1
    # libinput Accel Speed 设置触摸板速度
    SP_ID=$(xinput list-props "$TP_ID" | grep 'Accel Speed (' | cut -f 2 | grep -Eo '[0-9]{1,}')
    xinput set-prop "$TP_ID" "$SP_ID" 1
fi
# 设置小红点灵敏度
echo 200 | sudo tee /sys/devices/platform/i8042/serio1/driver/serio2/sensitivity
echo 200 | sudo tee /sys/devices/platform/i8042/serio1/driver/serio2/speed
