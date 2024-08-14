#!/bin/bash
basedir=$(pwd)
exists=$(sudo pacman -Q | grep tmux)
if [[ "$exists" == "" ]]; then
    yay -S tmux
    exit 0
else
    echo "tmux already installed"
    exit 0
fi


