{ config, pkgs, ... }:

{
  home.username = "lokhmakov";
  home.homeDirectory = "/Users/lokhmakov";

  home.stateVersion = "22.11";

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    DEVELOPER = "lokhmakov";
    VISUAL = "${pkgs.neovim}/bin/nvim";
  };

  home.file.".config/karabiner/karabiner.json".text = builtins.readFile ./karabiner.json;

  home.packages = with pkgs; [
    bottom
    docker
    docker-compose    
    du-dust
    duf
    exa
    fzf
    httpie
    jq
    karabiner-elements
    m-cli
    ripgrep
    tldr

    # NodeJs
    nodejs
    nodePackages.pnpm

    ## Fonts
    meslo-lgs-nf
    jetbrains-mono
    fira fira-code
    source-sans-pro source-code-pro
    font-awesome_5
  ];

  programs.bat.enable = true;
  programs.broot.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.home-manager.enable = true;
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;
  programs.tmux.enable = true;

  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
    };
    theme = "One Dark";
    settings = {
      editor = "~/.nix-profile/bin/nvim";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 12;
      strip_trailing_spaces = "smart";
      enable_audio_bell = "no";
      term = "xterm-256color";
      macos_titlebar_color = "background";
      macos_option_as_alt = "yes";
      scrollback_lines = 10000;
      shell_integration = "no-cursor";
      confirm_os_window_close = 0;
    };
  };

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      set number relativenumber
      set clipboard=unnamed "Copy by default in system buffer
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

    shellAliases = {
      icat = "${pkgs.kitty}/bin/kitty +kitten icat";
      d = "${pkgs.kitty}/bin/kitty +kitten diff";
      gd = "${pkgs.git}/bin/git difftool --no-symlinks --dir-diff";
      gs = "${pkgs.git}/bin/git status";
      ls = "exa";
      ll = "exa -lh";
      la = "exa -lhaa";
      lt = "exa -lTh";
      lg = "exa -lh --git";
      lgt = "exa -lTh --git";
    };

    initExtra = ''
      bindkey "\e[1;3D" backward-word # kitty ⌥←
      bindkey "\e[1;3C" forward-word # kitty ⌥→

      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'; # Fix tmux suggestion color
    '' + builtins.readFile ./.p10k.zsh;
  };
}
