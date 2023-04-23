{ config, pkgs, lib, ... }: {
  services.nix-daemon.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
    };

    brews = [
      "yabai"
      "sketchybar"
    ];

    casks = [
      "karabiner-elements"
      "slack"
    ];

    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      "homebrew/core"
      "homebrew/services"

      "koekeishiya/formulae" # yabai
      "FelixKratz/formulae" # sketchybar
    ];
  };
}
