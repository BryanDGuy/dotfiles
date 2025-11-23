#!/bin/bash

# Toggle PIA VPN connection state

state=$(piactl get connectionstate 2>/dev/null)

if [ "$state" = "Connected" ]; then
    piactl disconnect
else
    piactl connect
fi
