{ config, pkgs, lib, ... }: {
  homebrew = {
    enable = true;
    # onActivation = {
    #   cleanup = "zap";
    #   autoUpdate = true;
    # };

    # brews = [
    #   "yabai"
    #   "sketchybar"
    #   "ifstat"
    # ];

    # casks = [
    #   "karabiner-elements"
    # ];
  };
}
