{ config, pkgs, lib, ... }: {
  services.nix-daemon.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
    };

    brews = [
      "cf-cli@8"
      "sketchybar"
      "skhd"
      "yabai"
    ];

    casks = [
      "brave-browser"
      "discord"
      "eul"
      "firefox"
      "gitup"
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
      "cloudfoundry/tap" # cf-cli@8

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
