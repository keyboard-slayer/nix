{ pkgs, ... }:
{
  imports = [
    ../../dotfiles/neovim.nix
    ../../dotfiles/zsh.nix
    ../../dotfiles/fzf.nix
  ];

  home = {
    username = "keyb";
    homeDirectory = "/home/keyb";
  };

  home.packages = with pkgs; [
    git
    neofetch
  ];

  programs.zsh.shellAliases = {
    anix = "git -C ~/nix add . && sudo nixos-rebuild switch --flake ~/nix && home-manager switch --flake ~/nix";
  };

  home.stateVersion = "25.05";
  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

}
