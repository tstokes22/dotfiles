#!/bin/bash

# Check if blueman-manager is already running
if pgrep -x "blueman-manager" > /dev/null; then
    # If it's running, kill it
    pkill -x "blueman-manager"
else
    # If it's not running, launch it
    blueman-manager &
fi
