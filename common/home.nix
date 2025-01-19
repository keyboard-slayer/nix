{ pkgs, config, ... }:
{
  imports = [
    ./firefox.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.chafa
    pkgs.keepassxc
    pkgs.man
    pkgs.man-pages
    pkgs.nixfmt-rfc-style
    pkgs.discord
    pkgs.ripgrep
    pkgs.fastfetch
    # pkgs.ruff
  ];

  programs.git = {
    enable = true;
    userName = "keyboard-slayer";
    userEmail = "jordan@dalcq.eu";
    ignores = [
      ".DS_Store"
    ];
    extraConfig = {
      init.defaultBranch = "main";
    };
    diff-so-fancy = {
      enable = true;
      stripLeadingSymbols = true;
    };
  };

  programs.direnv = {
    enable = true;
    config = {
      whitelist = {
        prefix = [ "${config.home.homeDirectory}/Developer" ];
      };
    };
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      shell = "nix develop --command fish";
    };

    interactiveShellInit = ''
      set fish_greeting
      set -U fish_user_paths ~/.local/bin $fish_user_paths
      set -x DIRENV_LOG_FORMAT ""
      starship init fish | source
    '';
  };

  services.syncthing.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[λ](bold blue)";
        error_symbol = "[λ](bold red)";
      };
    };
  };
}
