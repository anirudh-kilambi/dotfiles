#!/bin/bash

echo "Installing FD"
yay -S fd

echo "Installing bat"
yay -S bat

#updating zshrc with fzf commands
echo 'export FZF_DEFAULT_COMMAND="fd . $HOME"' >> ~/.zshrc
echo 'export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"' >> ~/.zshrc
echo 'export FZF_PREVIEW_COMMAND="bat --style=numbers,changes --wrap never --color always {} || cat {} || tree -C {}"' >> ~/.zshrc
