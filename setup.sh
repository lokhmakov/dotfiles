#!/bin/bash -i

set -ex

date

mv ~/.config/nix ~/.config/nix-backup
ln -sv ~/.dotfiles/nix ~/.config

date
