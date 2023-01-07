#!/bin/sh

bookmark="$(xclip -o)"
file="$HOME/.local/share/snippets"

if grep -q "^$bookmark$" "$file"; then
    notify-send "hov!." "Allerede et bogmærke!"
else
    notify-send "bogmærke gemt!" "$bookmark er nu gemt til fil."
    echo "$bookmark" >> "$file"
fi
