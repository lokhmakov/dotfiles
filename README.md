# RUN

```sh
nix build ".#darwinConfigurations.mac.system"
./result/sw/bin/darwin-rebuild switch --flake ".#mac"
```
