#!/bin/bash

install=$1
exists=$(pacman -Q spotifyd)
confdir=$(pwd)

if [[ "$install" == "install" ]]; then
    # query if I've installed spotifyd
    if [[ "$exists" == "" ]]; then
        yay -S spotifyd
        echo "$confdir/spotifyd.conf"
        mkdir ~/.config/spotifyd
        cp "$confdir/spotifyd.conf" ~/.config/spotifyd/spotifyd.conf
    else
        echo "spotifyd already installed."
    fi
else
    if [[ "$exists" == "" ]]; then
        echo "spotifyd already uninstalled."
    else
        yay -R spotifyd
        rm -fr ~/.config/spotifyd
    fi
fi
