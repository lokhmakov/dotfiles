#!/bin/sh

cd $(dirname $0)
nix build ".#darwinConfigurations.mac.system"