{ pkgs, ... }:
{
  imports = [
    ./firefox.nix
  ];

  home.packages = [
    pkgs.chafa
    pkgs.keepassxc
    pkgs.man
    pkgs.man-pages
    pkgs.nixfmt-rfc-style
    pkgs.discord
    pkgs.ripgrep
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

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
    '';
  };

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
