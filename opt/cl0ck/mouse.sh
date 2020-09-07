#! /bin/bash

device='/dev/input/event0'

#key_playpause='*type 1 (EV_KEY), code 164 (KEY_PLAYPAUSE), value 1*'
#key_stop='*type 1 (EV_KEY), code 128 (KEY_STOP), value 1*'
#key_next='*type 1 (EV_KEY), code 407 (KEY_NEXT), value 1*'
#key_previous='*type 1 (EV_KEY), code 412 (KEY_PREVIOUS), value 1*'


key_left='*(BTN_LEFT), value 1*'
key_right='*(BTN_RIGHT), value 1*'
key_middle='*(BTN_MIDDLE), value 1*'


evtest "$device" | while read line; do
    case $line in
#       ($key_playpause)    notify-send "Play/Pause" && rhythmbox-client --playpause ;;
        ($key_left)     echo "left click pressed" ;;
        ($key_right)     echo "right button pressed" ;;
        ($key_middle)     echo "middle button pressed" ;;
    esac
done
