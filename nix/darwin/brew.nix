{ config, pkgs, lib, ... }: {
  services.nix-daemon.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
    };

    brews = [
      "sketchybar"
      "skhd"
      "yabai"
    ];

    casks = [
      "brave-browser"
      "gitup"
      "discord"
      "eul"
      "firefox"
      "karabiner-elements"
      "kap"
      "postman"
      "raycast"
      "sf-symbols"
      "shottr"
      "slack"
      "telegram"
      "the-unarchiver"
      "time-out"
      "ubersicht"
      "vlc"
      "zoom"
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
