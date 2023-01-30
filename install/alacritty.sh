#!/usr/bin/sh
sudo pacman -S --noconfirm alacritty

path="$(cd "$(dirname $0)";cd ..;pwd)"

ln -snf $path/alacritty ~/.config/alacritty
