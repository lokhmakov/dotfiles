{ pkgs, lib, ... }: {

  nix.binaryCaches = [
    "https://cache.nixos.org/"
  ];
  nix.binaryCachePublicKeys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];
  nix.trustedUsers = [
    "@admin"
  ];
  #users.nix.configureBuildUsers = true;

  users = {
    users = {
      lokhmakov = {
        shell = pkgs.zsh;
        home = "/Users/lokhmakov";
      };
    };
  };

  # Enable experimental nix command and flakes
  nix.package = pkgs.nixVersions.stable;
  nix.extraOptions = ''
    keep-derivations = false
    auto-optimise-store = false
    experimental-features = nix-command flakes
  '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;

  # Apps
  # `home-manager` currently has issues adding them to `~/Applications`
  # Issue: https://github.com/nix-community/home-manager/issues/1341
  environment.systemPackages = with pkgs; [
    kitty
    terminal-notifier
  ];

  # https://github.com/nix-community/home-manager/issues/423
  # environment.variables = {
  #   TERMINFO_DIRS = "${pkgs.kitty.terminfo.outPath}/share/terminfo";
  # };
  programs.nix-index.enable = true;

  # Fonts
  #fonts.enableFontDir = true;
  fonts.packages = with pkgs; [
    ibm-plex
    recursive
    nerd-fonts.jetbrains-mono
    #(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  ids.gids.nixbld = 30000;
  system.stateVersion = 5;

  # Keyboard
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

}
