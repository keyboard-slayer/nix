{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../../common/neovim
  ];

  home.stateVersion = "25.05";

  nixpkgs.config = {
    allowUnFree = true;
  };

  home = {
    username = "keyb";
    homeDirectory = "/home/keyb";
  };

  home.packages = [
    pkgs.man
    pkgs.man-pages
    pkgs.chafa
    pkgs.unzip
    pkgs.keepassxc
  ];

  programs.kitty = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = "	set fish_greeting\n";
  };

  programs.firefox = {
    enable = true;
    profiles.main = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        sponsorblock
      ];
      settings = {
        "extensions.autoDisableScopes" = 0;
      };
    };
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
