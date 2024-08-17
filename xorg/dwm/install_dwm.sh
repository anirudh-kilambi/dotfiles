#!/bin/bash
base_dir=$(pwd)
exists=$(sudo pacman -Q dwm)

if [[ "$exists" == "" ]]; then
    echo "Installing dwm"
    sudo yay -S dwm
else
    echo "DWM Already installed"
    exit 1

#mask kwin
systemctl mask plasma-kwin_x11.service
# create new systemd user unit for custom window manager
