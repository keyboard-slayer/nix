{
  pkgs,
  inputs,
  ...
}:
{
  home.stateVersion = "25.05";

  nixpkgs.config = {
    allowUnFree = true;
  };

  home = {
    username = "keyb";
    homeDirectory = "/home/keyb";
  };

  home.packages = [
    pkgs.chafa
    pkgs.keepassxc
    pkgs.man
    pkgs.man-pages
    pkgs.nixfmt-rfc-style
    pkgs.unzip
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
