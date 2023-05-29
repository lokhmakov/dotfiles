#!/bin/bash -i

set -ex

date

exit 0

mv ~/.config/nix ~/.config/nix-backup
ln -sv ~/.dotfiles/nix ~/.config

nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz home-manager
nix-channel --update

nix-env -iA nixpkgs.nix

export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

nix-shell '<home-manager>' -A install

pushd ~/.config/nixpkgs
home-manager switch --flake .#gitpod
popd