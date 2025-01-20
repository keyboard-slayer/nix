{ pkgs, ... }:
{
  programs.kitty = {
    font = {
      package = pkgs.nerd-fonts.zed-mono;
      name = "ZedMono Nerd Font";
    };

    settings = {
      allow_remote_control = "yes";
      window_padding_width = 4;
    };

    shellIntegration.mode = "no-cursor";
    enable = true;
  };
}
