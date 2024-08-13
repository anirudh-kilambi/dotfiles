#!/bin/bash

install=$1
exists=$(pacman -Q spotify-tui)

if [[ "$install" == "install" ]]; then
    # query if I've installed spotify-tui
    if [[ "$exists" == "" ]]; then
        yay -S spotify-tui
    else
        echo "spotify-tui already installed."
    fi
else
    if [[ "$exists" == "" ]]; then
        echo "spotify-tui already uninstalled."
    else
        yay -R spotify-tui
    fi
fi
