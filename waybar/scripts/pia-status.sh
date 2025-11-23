#!/bin/bash

# Check PIA VPN connection state using piactl

state=$(piactl get connectionstate 2>/dev/null)

if [ "$state" = "Connected" ]; then
    protocol=$(piactl get protocol 2>/dev/null)
    pubip=$(piactl get pubip 2>/dev/null)
    echo "{\"text\": \"VPN Connected: ${pubip}\", \"tooltip\": \"${protocol}\", \"class\": \"connected\"}"
else
    echo "{\"text\": \"VPN Disconnected\", \"tooltip\": \"Execute 'piactl connect'\", \"class\": \"disconnected\"}"
fi
