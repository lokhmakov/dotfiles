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
      "ifstat"
    ];

    casks = [
      "karabiner-elements"
    ];
  };
}
