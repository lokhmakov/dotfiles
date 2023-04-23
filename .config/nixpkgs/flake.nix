{
    description = "My Home Manager Flake";

    # inputs = {
    #     nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    #     home-manager = {
    #         url = "github:nix-community/home-manager";
    #         inputs.nixpkgs.follows = "nixpkgs";
    #     }
    # };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/master";
    nix-darwin.url = "flake:nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "flake:home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };    

    outputs = {nixpkgs, home-manager, ...}: {
        defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
        defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;

        homeConfigurations = {
            "mac" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.x86_64-darwin;
                modules = [ ./home.nix ];
            };
        };
    };
}

# # Based on https://github.com/nix-community/home-manager#nix-flakes
# {
#   description = "Home Manager flake";

#   inputs = {
#     nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
#     # nixpkgs.url = "github:NixOS/nixpkgs/master";
#     nix-darwin.url = "flake:nix-darwin";
#     nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
#     home-manager.url = "flake:home-manager";
#     home-manager.inputs.nixpkgs.follows = "nixpkgs";
#   };

#   outputs = { self, nixpkgs, nix-darwin, home-manager, ... }@inputs:
#     let
#       flakeContext = {
#         inherit inputs;
#       };
#     in
#     {
#       homeConfigurations = {
#         pkgs = nixpkgs.legacyPackages.x86_64-darwin;
#         mac = import ./home.nix flakeContext;
#       };
#     };

#   # outputs = inputs: {
#   #   homeConfigurations = {
#   #     mac = inputs.home-manager.lib.homeManagerConfiguration {
#   #       system = "aarch64-darwin";
#   #       homeDirectory = "/Users/lokhmakov";
#   #       username = "lokhmakov";
#   #       configuration.imports = [
#   #         ./home-manager/home.nix
#   #       ];
#   #     };
#   #   };
#   # };
# }