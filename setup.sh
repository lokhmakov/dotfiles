#!/usr/bin/bash -i

set -ex

date

mv ~/.config/home-manager ~/.config/homa-manager-backup
ln -sv ~/dotfiles/home-manager ~/.config/

date