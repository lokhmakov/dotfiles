#!/bin/sh

cd $(dirname $0)
./result/sw/bin/darwin-rebuild switch --flake ".#mac" --fallback