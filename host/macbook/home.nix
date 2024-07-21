{ config, pkgs, lib, ... }:
{
  home.stateVersion = "24.05";
  home.packages = [
    pkgs.ghidra
    pkgs.neofetch
    pkgs.nix-prefetch-github
    pkgs.man
    pkgs.man-pages
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = "	set fish_greeting\n";
  };

  programs.starship = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      shell = "${pkgs.fish}/bin/fish";
      window = {
        padding = {
          x = 10;
          y = 10;
        };
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font Mono";
        };
        size = 14.0;
      };
    };
  };

  programs.home-manager.enable = true;
}
