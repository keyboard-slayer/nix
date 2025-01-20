{
  programs.wofi = {
    enable = true;
  };

  wayland.windowManager.hyprland.settings.bind = [
    # --show run if cmds are better
    "$mainMod, D, exec, wofi --show drun"
  ];
}
