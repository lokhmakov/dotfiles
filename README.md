# Install (Mac OS)

1. https://zero-to-nix.com/start/install

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

- Start new shell

```sh
./mac-build.sh
```

<!-- 2. https://github.com/LnL7/nix-darwin

```sh
sudo mv /etc/nix/nix.conf /etc/nix/nix.conf-backup

nix-channel --add http://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
```

- Start new shell -->

# Run

```sh
nix build ".#darwinConfigurations.mac.system"
./result/sw/bin/darwin-rebuild switch --flake ".#mac"
```
