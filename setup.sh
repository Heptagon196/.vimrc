#!/bin/sh
mkdir -p $HOME/Backup

mv $HOME/.vimrc $HOME/Backup/
mv $HOME/.ycm_extra_conf.py $HOME/Backup/
dconf dump / > $HOME/Backup/gnome_settings
mv $HOME/.themes $HOME/Backup

ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.ycm_extra_conf.py $HOME/.ycm_extra_conf.py
mkdir -p $HOME/.themes
ln -s $PWD/VimixDark-Laptop $HOME/.themes/VimixDark-Laptop
dconf load / < .gnome_settings

sudo pacman -U ./xcursor-breeze-1:5.8-1-any.pkg.tar.xz
