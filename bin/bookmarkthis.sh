#!/bin/sh
bookmark="$(xclip -o)"
file="$HOME/.local/share/snippets"

if grep -q "^$bookmark$" "$file"; then
  notify-send "Oops " "den er allerede et bogmærke!"
else
  notify-send "Bogmærke er gemt" "$bookmark er nu gemt i listen."
  echo "$bookmark" >> "$file"
fi

