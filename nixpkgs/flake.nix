# Based on https://github.com/nix-community/home-manager#nix-flakes
{
  description = "Home Manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    homeConfigurations = {
      gitpod = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/gitpod";
        username = "gitpod";
        configuration.imports = [
          ./lib/home-manager.nix
          ./lib/common.nix
        ];
      };

    };
  };
}