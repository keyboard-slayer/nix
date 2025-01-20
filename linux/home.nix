{ pkgs, ... }:
{
  imports = [
    ../common/home.nix
    ./hyprland.nix
    ./waybar.nix
    ./wofi.nix
    ./terminal.nix
    ./screenshot.nix
    ./wlsunset.nix
    ./gtk.nix
  ];
  home.stateVersion = "25.05";

  nixpkgs.config = {
    allowUnFree = true;
  };

  home = {
    username = "keyb";
    homeDirectory = "/home/keyb";
  };

  home.packages = with pkgs; [
    obsidian
    unzip
    wl-clipboard
    tor-browser
    thunderbird
  ];

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
