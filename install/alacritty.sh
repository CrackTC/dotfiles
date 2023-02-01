#!/usr/bin/sh
sudo pacman -S --noconfirm alacritty

path="$(cd "$(dirname $0)";cd ..;pwd)"

mkdir -p ~/backup
rm -rf ~/backup/alacritty
mv ~/.config/alacritty ~/backup/alacritty

ln -s $path/alacritty ~/.config/alacritty
