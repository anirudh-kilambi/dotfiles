#!/bin/bash


echo "syntax on
set nu rnu" > ~/.vimrc

rm -fr ~/.vim/plugged/

echo "------- Uninstalling Vim Plug -------"
echo "Removing plug.vim from autoload directory"

rm -f ~/.vim/autoload/plug.vim
ls -la ~/.vim/autoload/ | grep plug.vim

exit 0



