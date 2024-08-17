#!/bin/bash

pacman -S zsh
echo "Creating sym link to zshrc in root directory"
zshrc_directory="$(pwd)/zshrc"
aliases_path="$(pwd)/aliases"
echo $zshrc_directory

ln -sf $zshrc_directory ~/.zshrc

ls -la ~ | grep .zshrc

aliases_exists=$(cat ~/.zshrc | grep "$aliases_path")

if [[ "$aliases_exists" == "" ]]; then
    echo "aliases not sourced"
    echo "source $aliases_path" >> ~/.zshrc
else
    echo "aliases already sourced. Exiting"
fi

exit 0

