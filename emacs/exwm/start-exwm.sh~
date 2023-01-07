!/bin/sh
# Set the screen DPI (uncomment this if needed!)
xrdb ~/.Xresources

xsetroot -cursor_name left_ptr &
setxkbmap dk &

# Run the screen compositor
picom &
dunst &
# Enable screen locking on suspend
xss-lock -- slock &

gpgconf --reload gpg-agent &

gpg-connect-agent /bye

# Fire it up
exec dbus-launch --exit-with-session emacs -mm --debug-init -l ~/.config/emacs/desktop.el
