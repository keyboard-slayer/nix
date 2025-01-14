{
  pkgs,
  ...
}:
{
  imports = [
    ../../common/home.nix
    ./hyprland.nix
    ./waybar.nix
    ./wofi.nix
    ./terminal.nix
    ./screenshot.nix
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
    pkgs.unzip
    pkgs.wl-clipboard
    pkgs.tor-browser
    pkgs.thunderbird
  ];

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
