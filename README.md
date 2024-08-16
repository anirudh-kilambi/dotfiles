# dotfiles

This houses my vimrc, and zshrc along with config files for other packages I use.

## VIMRC
For the .vimrc, you can execute `setup.vim`

## I USE ARCH BTW

My arch setup is a little wack. If I'm being completely honest, I just watched
some ordinary gamers and setup arch as fast as possible because I wanted to see
how much better Steam gaming on Linux has gotten. However after playing around more and more,
*I'm in love*. The second windows 10 goes EOL, it's wraps for my Windows install.

Currently I'm using KDE Plasma with SDDM. Time to move onto a tiling window manager.
We're gonna try awesome for a WM.

### 08/16/24 UPDATE
ran `sudo pacman -Rcns` on sddm and plasma. Losing SDDM was frankly whatever. I don't really care about having a fancy looking login page.
Losing kde-plasma was quite painful, I kinda forgot how much just running `sudo pacman -Sy plasma` does in terms of setup. Audio drivers, network drivers,
it's crazy. That being said I have come out of it stronger. We're using a simple `pulseaudio` setup with pulseaudio and `pulseaudio-ctl` to handle that.

I've also moved to DWM as a tiling window manager. I didn't even bother trying out awesome wm tbh. I really liked how simple DWM is. 
It really is no frills (funny moment for all my Canadian friends) out of the box. One of my biggest fears is installing stuff that I don't need.
Which is why you can now see under `packages/install.sh`. That is meant to exist as a running tab of all the packages I've installed (outside of installation).
The hope being to avoid any bloat in my load. I have a very barebones dwm setup, I just tried to tie it together with the changes I made to my vim setup.
Realistically need to update the tab bar with some nice to have information (datetime is the only thing I *really* want. The rest I don't really care about).

![Picture attached.](./docs/dwm_preview_08_17_24.png)
