{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/master";
    nix-darwin.url = "flake:nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "flake:home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };    

  outputs = {nixpkgs, home-manager, nix-darwin, ...}: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;

    darwinConfigurations = {
     "mac" = nix-darwin.lib.darwinSystem {
       system = "x86_64-darwin";
       modules = [ ./homebrew.nix ];
     };
    };

    homeConfigurations = {
      "lokhmakov" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-darwin;
        modules = [ ./home.nix ];
      };
    };
  };
}
