#!/bin/bash

# Monitor PIA VPN connection state using piactl

piactl monitor connectionstate | while read -r state; do
    case "$state" in
        "Connected")
            protocol=$(piactl get protocol 2>/dev/null)

            # Loop until we get a valid VPN IP
            vpnip=""
            while [ -z "$vpnip" ] || [ "$vpnip" = "Unknown" ]; do
                vpnip=$(piactl get vpnip 2>/dev/null)
                if [ -z "$vpnip" ] || [ "$vpnip" = "Unknown" ]; then
                    sleep 1
                fi
            done

            echo "{\"text\": \"VPN Connected: ${vpnip}\", \"tooltip\": \"${protocol}\", \"class\": \"connected\"}"
            ;;
        "Connecting")
            echo "{\"text\": \"VPN Connecting...\", \"class\": \"connecting\"}"
            ;;
        "Disconnecting")
            echo "{\"text\": \"VPN Disconnecting...\", \"class\": \"disconnecting\"}"
            ;;
        "Disconnected")
            echo "{\"text\": \"VPN Disconnected\", \"tooltip\": \"Click to connect\", \"class\": \"disconnected\"}"
            ;;
        *)
            echo "{\"text\": \"VPN: ${state}\", \"class\": \"disconnected\"}"
            ;;
    esac
done
