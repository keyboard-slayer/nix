{
  imports = [
    ../common/home.nix
  ];

  home.stateVersion = "25.05";

  programs.firefox.package = null;
  programs.home-manager.enable = true;
}
