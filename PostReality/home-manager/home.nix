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

  programs.kitty = {
    font = {
      package = pkgs.nerd-fonts.zed-mono;
      name = "ZedMono Nerd Font";
    };
    shellIntegration.mode = "no-cursor";
    enable = true;
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
