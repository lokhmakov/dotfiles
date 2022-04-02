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
      mac = inputs.home-manager.lib.homeManagerConfiguration {
        system = "aarch64-darwin";
        homeDirectory = "/Users/lokhmakov";
        username = "lokhmakov";
        configuration.imports = [
          ./lib/home-manager.nix
          ./lib/common.nix
        ];
      };

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