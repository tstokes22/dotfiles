#!/bin/bash

# Menu options with icons (Unicode escapes for fuzzel)
CHOICE=$(echo -e \
"\Uf0425  Power\n"\
"\Uf0343  Logout\n"\
"\Uf04b2  Suspend\n"\
"\Uf0709  Reboot" | fuzzel --dmenu --config ~/.config/fuzzel/fuzzel-power.ini)

# Match based on the text part of the selection
case "$CHOICE" in
    "Power") systemctl poweroff ;;
    "Reboot") systemctl reboot ;;
    "Suspend") systemctl suspend ;;
    "Logout") swaymsg exit ;;
    *) exit 1 ;;  # Exit if no match (e.g., cancel or invalid selection)
esac
