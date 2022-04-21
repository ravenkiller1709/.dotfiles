#!/bin/sh
wallpaper_directory=~/Dokumenter/Billeder/4k
interval=10 # in seconds
IFS='
'; set -ef
while true; do
  set $(find "$wallpaper_directory" -type f | shuf -r -n 2)
  feh --bg-scale "S1" 
  sleep "$interval"
done
