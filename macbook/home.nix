{
  pkgs,
  ...
}:
{
  imports = [
    ../common/home.nix
  ];

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.chafa
    pkgs.keepassxc
    pkgs.man
    pkgs.man-pages
    pkgs.nixfmt-rfc-style
  ];

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

  programs.home-manager.enable = true;
}
