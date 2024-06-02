{ config, pkgs, lib, ... }: {
  services.nix-daemon.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
    };

    brews = [
      "abseil"
      "awscli@2"

      # "bun"

      "croc"
      "cf-cli@8"
      "dive"
      "caddy"
      "cmake"
      "grpc"
      "terraform"
      "telnet"

      "go"
      "gopls"

      # GitHub
      "gh"

      "hyperfine"

      # k8s
      "kubeseal"

      # node
      "node"

      # TEMPORAL
      "tctl"
      "temporal"

      "oha"
      "openjdk"
      # "sketchybar"
      # "skhd"
      "python@3.9"
      "pyenv"
      "portaudio"
      "protobuf"

      "pulumi"
      "crd2pulumi"

      "libpq"
      # "yabai"
      "yq"

      "zig"
    ];

    casks = [
      "anydesk"

      # k8s
      "headlamp"
      "rancher"

      "anki"
      "brave-browser"
      "dbeaver-community"
      "discord"
      "eul"
      "fbreader"
      "firefox"
      "firefox-developer-edition"
      "figma"
      "fork"
      "gitup"
      "karabiner-elements"
      "kap"
      # "mockoon"
      "miniconda"
      "ngrok"
      "orbstack"
      "postman"
      "raycast"
      "qbittorrent"
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

      "visual-studio-code-insiders"

      "vmware-fusion"
      "microsoft-teams"
    ];

    taps = [
      "homebrew/cask-versions"
      "cloudfoundry/tap" # cf-cli@8

      "homebrew/bundle"
      "homebrew/cask-drivers"
      "homebrew/cask-fonts"
      "homebrew/services"

      "pulumi/tap"

      # "oven-sh/bun"

      # "koekeishiya/formulae" # yabai
      # "FelixKratz/formulae" # sketchybar
    ];
  };
}
