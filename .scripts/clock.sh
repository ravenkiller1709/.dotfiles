#!/bin/bash
# icons depend on nerdfonts being installed
clock=$(date '+%I')

case "$clock" in
    "00") icon="🕛" ;;
    "01") icon="🕐" ;;
    "02") icon="🕑" ;;
    "03") icon="🕒" ;;
    "04") icon="🕓" ;;
    "05") icon="🕔" ;;
    "06") icon="🕕" ;;
    "07") icon="🕖" ;;
    "08") icon="🕗" ;;
    "09") icon="🕘" ;;
    "10") icon="🕙" ;;
    "11") icon="🕚" ;;
    "12") icon="🕛" ;;
esac

#case $BLOCK_BUTTON in
#    1) notify-send  ;;
#    2) setsid -f  ;;
#    3) notify-send
#
#    6) "$TERMINAL" -e "$EDITOR" "$0" ;;
#esac

echo "📆 $(date  "+^c#b294bb^%d %b %Y^c#ffffff^ $icon ^c#cc6666^%H:%M%p")"
