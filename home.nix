{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "joda";
  home.homeDirectory = "/home/joda";

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    pkgs.file
    pkgs.google-chrome
    pkgs.bemenu
    pkgs.nixfmt
    pkgs.gnome.gnome-keyring
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-utils
    pkgs.steam-run
    pkgs.brightnessctl
    pkgs.discord
    pkgs.hyprpaper
    pkgs.imv
    pkgs.waybar
    pkgs.neofetch
    pkgs.wayshot
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.blueberry
    pkgs.pavucontrol

    # fonts
    pkgs.cascadia-code
    pkgs.comic-mono
    pkgs.font-awesome
    pkgs.roboto
    pkgs.noto-fonts-emoji

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/scripts".source = ./scripts;
    ".config/hypr".source = ./cfgs/hypr;
    ".config/waybar".source = ./cfgs/waybar;
    ".config/fish/functions".source = ./cfgs/fish/functions;
    ".walls".source = ./walls;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/joda/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = "	set fish_greeting\n";
  };

  programs.kitty = {
    enable = true;
    settings = { 
      confirm_os_window_close = 0; 
      font_family = "Cascadia Code PL, FontAwesome";
      background_opacity = "0.9";
      cursor_shape = "block";
      window_padding_width = 10;
      shell_integration = "disabled";
    };
  };

  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    extensions = with pkgs.vscode-extensions;
      [
        vscodevim.vim
        ms-python.python
        eamodio.gitlens
        pkief.material-icon-theme
        github.copilot
        bbenoist.nix
        brettm12345.nixfmt-vscode
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
        name = "ayu";
        publisher = "teabyii";
        version = "1.0.5";
        sha256 = "f8816a8169622abfaa8c12e6425cc5e385cd6cdec1af96b5d7dbfd5809d93aee";
      }
      {
        name = "atom-keybindings";
        publisher = "ms-vscode";
        version = "3.0.3";
        sha256 = "613935a342c27fd83401cda88970b112f1237c03f9ae39a3a96cc8a36c403a01";
      }];
    userSettings = {
      keyboard.dispatch = "keyCode";
      terminal.integrated.cursorStyleInactive = "block";
      editor.cursorSmoothCaretAnimation = "on";
      editor.smoothScrolling = true;
      editor.cursorBlinking = "smooth";
      workbench.list.smoothScrolling = true;
      window.titleBarStyle = "custom";
      workbench.iconTheme = "material-icon-theme";
      editor.mouseWheelZoom = true;
      editor.cursorStyle = "block";
      editor.fontFamily = "Cascadia Mono PL";
      workbench.colorTheme = "Ayu Dark";
    };
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.gnome-keyring.enable = true;
  services.mako = {
    enable = true;
    borderRadius = 10;
    backgroundColor = "#000000";
    font = "Cascadia Code PL 10";
    padding = "10";
    defaultTimeout = 5000;
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.config/scripts"
  ];
}
