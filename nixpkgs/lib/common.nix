{ config, pkgs, libs, ... }:
{
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
    tmux
    bottom
    du-dust
    yarn
    docker
  ];

  programs.tmux = {
    enable = true;
    clock24 = true;
  };

  programs.dircolors = {
    enable = true;
  };
}