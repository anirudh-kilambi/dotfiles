#!/bin/bash

echo "----- Creating sym link to vimrc in root directory -----"
base_dir=$(pwd)
vimrc_directory="$base_dir/vimrc"
vim_default_settings_path="$base_dir/default_settings.vim"
echo $vimrc_directory

ln -sf $vimrc_directory ~/.vimrc

ls -la ~ | grep .vimrc

vimrc_contents=$(cat ~/.vimrc | grep "$vim_default_settings_path")

if [[ "$vimrc_contents" == "" ]]; then
    echo "source $vim_default_settings_path" >> ~/.vimrc
fi

echo "----- installing plug.vim -----"
plug_exists=$(ls ~/.vim/autoload/ | grep plug.vim)
if [[ "$plug_exists" == "" ]]; then
    echo "plug.vim not installed. Loading..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo "plug.vim exists in ~/.vim/autoload/. Not downloading."
fi

echo "----- installing nodejs -----"
node_exists=$(pacman -Q nodejs)
if [[ "$node_exists" == "" ]]; then
    echo "NodeJS not installed. Installing"
    sudo pacman -Sy nodejs
else
    echo "NodeJS installed. Skipping."
fi

echo "----- Installing npm -----"
npm_exists=$(pacman -Q npm)
if [[ "$npm_exists" == "" ]]; then
    echo "NPM not installed. Installing"
    sudo pacman -Sy npm
else
    echo "NPM installed. Skipping."
fi

echo "----- adding plugins.vim file -----"
plugins_exists=$(cat ~/.vimrc | grep plugins.vim)
if [[ "$plugins_exists" == "" ]]; then
    echo "Sourcing Plugins"
    echo "call plug#begin() 
    source $base_dir/plugins/plugins.vim 
call plug#end()" >> ~/.vimrc
else
    echo "Plugins Already Sourced. Continue."
fi

echo "----- Installing Plugins -----"
vim -c 'PlugInstall' -c 'qa!'

echo "----- Sourcing plugin .vim files -----"
files=$(ls plugins/)

for f in $files; do
    echo "File => $f"
    exists=$(cat ~/.vimrc | grep $f)
    if [[ $exists == "" ]]; then
        echo "source $base_dir/plugins/$f" >> ~/.vimrc
    else
        echo "$f has already been sourced. Continue."
    fi
done

exit 0

