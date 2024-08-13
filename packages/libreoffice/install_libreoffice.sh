#!/bin/bash

libre_exists=$(pacman -Q libreoffice-fresh)

if [[ $libre_exists == "" ]]; then
    sudo pacman -S libreoffice-fresh
else
    echo "libre office fresh already installed."
fi

exit 0
