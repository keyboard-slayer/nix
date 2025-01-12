{
  pkgs,
  ...
}:
{
  imports = [
    ../common/home.nix
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
    enable = true;
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
}
