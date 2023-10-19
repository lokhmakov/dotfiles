# Based on https://gist.github.com/jmatsushita/5c50ef14b4b96cb24ae5268dab613050
{
  description = "My Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-21.11-darwin";
    nixpkgs-unstable.url = github:NixOS/nixpkgs/nixpkgs-unstable;

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { self, darwin, nixpkgs, home-manager, ... }@inputs:
  let

    inherit (darwin.lib) darwinSystem;
    inherit (inputs.nixpkgs-unstable.lib) attrValues makeOverridable optionalAttrs singleton;

    nixpkgsConfig = {
      config = { allowUnfree = true; };
      overlays = attrValues self.overlays ++ singleton (
        final: prev: (optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
          inherit (final.pkgs-x86)
            idris2
            nix-index
            niv
            purescript
            rnix-lsp
            scc;
        })
      );
    };
  in
  {
    darwinConfigurations = rec {
      mac = darwinSystem {
        system = "aarch64-darwin";
        modules = attrValues self.darwinModules ++ [
          ./darwin/config.nix # Setup darwin
          home-manager.darwinModules.home-manager
          {
            nixpkgs = nixpkgsConfig;
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.lokhmakov.imports = [
                ./darwin-home
              ];
            };
          }
          ./darwin # Apply darwin stuff after home-manager
        ];
      };
    };

    overlays = {
      # Overlay useful on Macs with Apple Silicon
        apple-silicon = final: prev: optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
          # Add access to x86 packages system is running Apple Silicon
          pkgs-x86 = import inputs.nixpkgs-unstable {
            system = "x86_64-darwin";
            inherit (nixpkgsConfig) config;
          };
        };
      };

    darwinModules = {};
 };
}