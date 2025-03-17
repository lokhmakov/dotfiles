{ config, pkgs, lib, ... }: {
  # services.nix-daemon.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
    };

    brews = [
      "abseil"
      "atlas"
      "awscli@2"

      # "bun"
      # "bruno"
      # "bruno-cli"

      "cloudflared"

      "croc"
      "cf-cli@8"
      "dive"
      "caddy"
      "cmake"
      "entr"
      "grpc"
      "hashicorp/tap/terraform"
      "telnet"

      "git-lfs"

      "go"
      "gopls"

      # GitHub
      "gh"

      "hyperfine"
      "lazygit"

      # k8s
      "kubeseal"

      "nvm"
      "neovim"

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
      "postgresql@15"

      "pulumi"
      "crd2pulumi"

      "libpq"
      # "yabai"
      "yq"

      "zig"

      # FOR BUN
      "automake"
      "ccache"
      "cmake"
      "coreutils"
      "gnu-sed"
      "icu4c"
      "libiconv"
      "libtool"
      "ninja"
      "pkg-config"
      "rust"
      "ruby"
      "llvm@18"
    ];

    casks = [
      "anydesk"
      "amethyst"

      "bruno"
      "btp"

      # "background-music"
      "eqmac"

      # k8s
      "headlamp"
      # "rancher"

      "anki"
      "brave-browser"
      "dbeaver-community"
      "discord"
      "eul"
      "fbreader"
      "firefox"
      # "firefox-developer-edition"
      # "figma"
      "fork"

      "ghostty"
      "gitup"
      # "karabiner-elements"
      "kap"
      # "mockoon"
      # "miniconda"
      "ngrok"
      "orbstack"
      # "postman"
      "prince"
      "raycast"
      "qbittorrent"
      "sf-symbols"
      "shottr"
      # "slack"
      "spectacle"
      "telegram"
      "the-unarchiver"
      "time-out"
      # "ubersicht"
      "vlc"
      "zoom"

      # "visual-studio-code-insiders"

      # "vmware-fusion"
      # "microsoft-teams"
    ];

    taps = [
      "hashicorp/tap"

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
