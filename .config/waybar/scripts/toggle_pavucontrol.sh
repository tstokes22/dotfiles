#!/bin/bash

# Check if pavucontrol is already running
if pgrep -x "pavucontrol" > /dev/null; then
    # If it's running, kill it
    pkill -x "pavucontrol"
else
    # If it's not running, launch it
    pavucontrol &
fi
