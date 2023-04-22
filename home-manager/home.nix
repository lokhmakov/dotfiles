{ config, pkgs, ... }:

{
  home.username = "lokhmakov";
  home.homeDirectory = "/Users/lokhmakov";

  home.stateVersion = "22.11";

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    bottom
    du-dust
    jq
    fzf
    ripgrep
    m-cli
    meslo-lgs-nf
    nodejs
    nodePackages.pnpm
  ];

  programs.bat.enable = true;
  programs.broot.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.home-manager.enable = true;
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;
  programs.tmux.enable = true;

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      set number relativenumber
      colorscheme gruvbox
    '';

    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    prezto = {
      enable = true;
      prompt.theme = "powerlevel10k";
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "git"
        "completion"
        "syntax-highlighting"
        "history-substring-search"
        "prompt"
      ];
    };

    initExtra = ''
      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'; # Fix tmux suggestion color
    '' + builtins.readFile ./.p10k.zsh;
  };
}
