{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    settings = {
      theme = "ayu";
      background = "#000000";
      font-family = "NeoSpleen Nerd Font";
      font-size = 17;
      shell-integration-features = "no-cursor";
      cursor-style = "block";
    };
  };
}
