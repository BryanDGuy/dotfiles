#!/bin/bash

# Function to prepare directory for fresh copy
prepare_dir() {
    local dest_dir="$1"
    if [ -d "$dest_dir" ]; then
        # Directory exists, remove all contents
        rm -rf "$dest_dir"/*
    else
        # Create directory
        mkdir -p "$dest_dir"
    fi
}

# Prepare and copy wallpapers
prepare_dir "$HOME/wallpapers"
cp -r wallpapers/* "$HOME/wallpapers/"

cp hyprland.conf $HOME/.config/hypr/
cp hyprpaper.conf $HOME/.config/hypr/