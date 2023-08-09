{ config, pkgs, lib, ... }: {
  services.nix-daemon.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
    };

    brews = [
      "awscli@2"
      "cf-cli@8"
      "terraform"
      "telnet"
      # "sketchybar"
      # "skhd"
      # "yabai"
    ];

    casks = [
      "anki"
      "brave-browser"
      "dbeaver-community"
      "discord"
      "eul"
      "firefox"
      "firefox-developer-edition"
      "figma"
      "fork"
      "gitup"
      "karabiner-elements"
      "kap"
      "postman"
      "raycast"
      "sf-symbols"
      "shottr"
      "slack"
      "spectacle"
      "telegram"
      "the-unarchiver"
      "time-out"
      "ubersicht"
      "vlc"
      "zoom"
    ];

    taps = [
      "homebrew/cask-versions"
      "cloudfoundry/tap" # cf-cli@8

      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      "homebrew/core"
      "homebrew/services"

      # "koekeishiya/formulae" # yabai
      # "FelixKratz/formulae" # sketchybar
    ];
  };
}
