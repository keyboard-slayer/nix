{ pkgs, ... }:
{
  home.file.".local/bin/fullshot" = {
    text = ''
      #!/bin/sh

      DIR="$HOME/Pictures/Screenshots"
      FILEPATH="$DIR/$(date +%Y-%m-%d-%H-%M-%S).png"

      if [ ! -d "$HOME/Pictures/Screenshots" ]; then
          mkdir -p $HOME/Pictures/Screenshots
      fi

      wayshot -f $FILEPATH
      wl-copy < $FILEPATH
    '';
    executable = true;
  };

  home.file.".local/bin/shot" = {
    text = ''
      #!/bin/sh

      DIR="$HOME/Pictures/Screenshots"
      FILEPATH="$DIR/$(date +%Y-%m-%d-%H-%M-%S).png"

      if [ ! -d "$HOME/Pictures/Screenshots" ]; then
          mkdir -p $HOME/Pictures/Screenshots
      fi

      wayshot -s "$(slurp)" -f $FILEPATH
      wl-copy < $FILEPATH
    '';
    executable = true;
  };

  home.packages = [
    pkgs.wayshot
    pkgs.slurp
  ];

  wayland.windowManager.hyprland.settings.bind = [
    "$mainMod, S, exec, ~/.local/bin/shot"
    "$mainMod SHIFT, S, exec, ~/.local/bin/fullshot"
  ];
}
