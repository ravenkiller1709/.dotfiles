#!/bin/sh
PATH=$HOME/.scripts:~/.local/bin:$PATH
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi
