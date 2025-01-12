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
  ];

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
