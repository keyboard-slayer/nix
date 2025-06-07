{ pkgs, ... }:
{
  imports = [
    ../../dotfiles/ghostty.nix
    ../../dotfiles/librewolf.nix
    ../../dotfiles/neovim.nix
    ../../dotfiles/zsh.nix
    ../../dotfiles/fzf.nix
    ../../dotfiles/direnv.nix
    ../../dotfiles/tmux.nix
  ];

  home.packages = with pkgs; [
    discord
    ffmpeg
  ];

  programs.zsh = {
    shellAliases = {
      anix = "git -C ~/nix add . && sudo darwin-rebuild switch --flake ~/nix";
    };
  };

  home.sessionPath = [
    "/Applications/Postgres.app/Contents/Versions/latest/bin"
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
