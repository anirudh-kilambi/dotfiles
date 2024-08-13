kitty_conf="$(pwd)/kitty.conf"
echo "----- setting up kitty -----"

echo "check if kitty installed"
kitty_exists=$(pacman -Q kitty)

if [[ "$kitty_exists" == "" ]]; then
    pacman -S kitty
else
    echo "kitty is already installed"
fi

echo $kitty_conf

ln -sf $kitty_conf ~/.config/kitty/kitty.conf 

exit 0
