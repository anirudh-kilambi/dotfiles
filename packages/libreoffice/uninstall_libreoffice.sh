#!/bin/bash

libre_exists=$(pacman -Q libreoffice-fresh)

if [[ $libre_exists == "" ]]; then
    echo "libre office fresh already uninstalled."
else
    sudo pacman -Rcns libreoffice-fresh
fi

exit 0
