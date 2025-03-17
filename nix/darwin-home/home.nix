{ config, pkgs, lib, ... }: {
  home.username = "lokhmakov";
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    DEVELOPER = "lokhmakov";
    VISUAL = "${pkgs.neovim}/bin/nvim";
  };

  home.file.".config/karabiner/karabiner.json".text = builtins.readFile ./configs/karabiner.json;

  home.packages = with pkgs; [
    bottom
    cachix
    coreutils
    chafa
    curl
    du-dust
    duf
    eza
    gnused
    httpie
    imagemagick
    jq
    kubectl
    kubectx
    kubernetes-helm
    mmv-go
    niv
    ripgrep
    scc
    tldr
    viu
    wget

    # go
    #go
    #gopls

    # rust
    # rustc
    rustup

    # NodeJs
    #nodejs
    #nodePackages.node2nix
    #nodePackages.pnpm
    #nodePackages.typescript
    purescript

    ## Fonts
    meslo-lgs-nf
    jetbrains-mono
    fira
    fira-code
    source-sans-pro
    source-code-pro
    font-awesome_5
  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli
    trash-cli
  ];

  programs.pistol = {
    enable = true;
    associations = [
      {
        mime = "image/*";
        command = "chafa %pistol-filename%";
      }
    ];
  };

  programs.bat.enable = true;
  programs.broot.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  programs.fzf = {
    enable = true;
    defaultOptions = [ "--height 50% --preview='pistol {}'" ];
  };

  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    extraConfig = builtins.readFile ./configs/tmux.conf;
  };

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

  programs.lf = {
    enable = true;
    extraConfig = builtins.readFile ./configs/lfrc;
  };

  programs.zellij = {
    enable = true;
    enableZshIntegration = false;

    settings = {
      theme = lib.mkDefault "Gruvbox Dark";
      # default_layout = "compact";
      
      pane_frames = false;
    };
  };

  # programs.neovim = {
  #   enable = true;

  #   defaultEditor = true;

  #   viAlias = true;
  #   vimAlias = true;

  #   extraConfig = ''
  #     set number relativenumber
  #     set clipboard=unnamed "Copy by default in system buffer
  #     colorscheme gruvbox
  #     set expandtab
  #     set shiftwidth=2
  #   '';

  #   plugins = with pkgs.vimPlugins; [
  #     vim-nix
  #     gruvbox
  #   ];
  # };

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
      k = "kubectl";

      icat = "${pkgs.kitty}/bin/kitty +kitten icat";
      d = "${pkgs.kitty}/bin/kitty +kitten diff";
      hm = "home-manager";
      hs = "home-manager switch";
      he = "home-manager edit";
      gd = "${pkgs.git}/bin/git difftool --no-symlinks --dir-diff";
      gs = "${pkgs.git}/bin/git status";
      ls = "eza";
      ll = "eza -lh";
      la = "eza -lhaa";
      lt = "eza -lTh";
      lg = "eza -lh --git";
      lgt = "eza -lTh --git";
      bunx = "bun x";

      mbuild = "~/.dotfiles/nix/mac-build.sh";
      mup = "~/.dotfiles/nix/mac-up.sh";
    };

    initExtra = ''
      source ~/.profile

      export BUN_INSTALL="$HOME/.bun"
      export PATH="/opt/homebrew/opt/libpq/bin;$BUN_INSTALL/bin:$PATH"
      export PATH="/Users/lokhmakov/.cargo/bin:$PATH"
      export PATH="/Users/lokhmakov/.npm-packages/bin:$PATH"
      export PATH="/Users/lokhmakov/.temporalio/bin:$PATH"
      export PATH="/Users/lokhmakov/project/oven/bun/build:$PATH"
      # export PATH="/Users/lokhmakov/.zig:$PATH"

      export CARGO="/etc/profiles/per-user/lokhmakov/bin/cargo"

      bindkey "\e[1;3D" backward-word # kitty ⌥←
      bindkey "\e[1;3C" forward-word # kitty ⌥→

      export NVM_DIR="$HOME/.nvm"
      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'; # Fix tmux suggestion color
    '' + builtins.readFile ./configs/.p10k.zsh;
  };
}
