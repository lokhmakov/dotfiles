#!/bin/bash -i

set -ex

date

#mv ~/.config/home-manager ~/.config/home-manager-backup
ln -sv ~/.dotfiles/.config/nix ~/.config
#ln -sv ~/.dotfiles/.config/nixpkgs ~/.config

date
