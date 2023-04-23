{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/master";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };    

  outputs = {nixpkgs, home-manager, darwin, ...}@inputs: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;

    darwinConfigurations.Pavels-MacBook-Pro = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      specialArgs = { inherit inputs; };
      modules = [ ./homebrew.nix ];
    };

    homeConfigurations = {
      "lokhmakov" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-darwin;
        modules = [ ./home.nix ];
      };
    };
  };
}
