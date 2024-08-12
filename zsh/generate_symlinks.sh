#!/bin/bash

echo "Creating sym link to zshrc in root directory"
zshrc_directory="$(pwd)/zshrc"
aliases_path="$(pwd)/aliases"
echo $zshrc_directory

ln -sf $zshrc_directory ~/.zshrc

ls -la ~ | grep .zshrc

echo "source $aliases_path" >> ~/.zshrc

exit 0
