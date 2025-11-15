#!/bin/bash
basedir=$(pwd)
exists=$(which neovim)
if [[ "$exists" == "nvim not found" ]]; then
    cd ~/.builds/;
    git clone git@github.com:neovim/neovim.git;
    cd neovim;
    make CMAKE_BUILD_TYPE=Release;
    sudo make install
    exit 0
else
    echo "neovim already installed"
    exit 0
fi


