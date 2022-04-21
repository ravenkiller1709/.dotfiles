#!/bin/bash
# icons depend on nerdfonts being installed
hostname="${HOSTNAME:-${hostname:-$(hostname)}}"
network() {
wire="$(ip a | grep 'enp3s0' | grep inet | wc -l)"
wifi="$(ip a | grep wlp4s0 | grep inet | wc -l)"

if [ $wire = 1 ]; then 
    echo "  ^c#b5bd68^$(ifconfig | grep inet | awk 'NR==1 {print $2}')"
elif [ $wifi = 1 ]; then
    echo " ^c#b5bd68^$(ifconfig | grep inet | awk 'NR==3 {print $2}')"
else 
    echo "睊 "
fi
}

vpn() {
    state="$(ip a | grep tun0 | grep inet | wc -l)"
    
if [ $state = 1 ]; then
    echo "ﱾ"
else
    echo " "
fi
}

echo "$(network) $(vpn)" 

#case $BUTTON in
#    1) setsid -f "st -e pia-client"
#    2) notify-send "~/.scripts/network.sh"
#esac
