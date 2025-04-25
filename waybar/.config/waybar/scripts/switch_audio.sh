#!/bin/bash

# Define the names of your audio devices
HEADPHONES="alsa_output.pci-0000_c6_00.6.analog-stereo" # Headphones
BT_SPEAKER="bluez_output.10_94_97_39_1C_D7.1"  # Bluetooth speaker

# Get the current sink (audio device)
CURRENT_SINK=$(pactl get-default-sink)

# Toggle to the other device
if [[ "$CURRENT_SINK" == "$BT_SPEAKER" ]]; then
    pactl set-default-sink "$HEADPHONES"
else
    pactl set-default-sink "$BT_SPEAKER"
fi

# Add small delay

sleep 0.5

# Move all active audio streams to the new default sink
pactl list short sink-inputs | while read -r stream; do
    STREAM_ID=$(echo $stream | awk '{print $1}')
    pactl move-sink-input $STREAM_ID $(pactl get-default-sink)
done
