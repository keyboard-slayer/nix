{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    extraConfig = ''
      monitor=,highrr,auto,1
    '';

    settings = {
      "$mainMod" = "SUPER";

      general = {
        gaps_in = 5;
        gaps_out = 25;
      };

      input = {
        repeat_delay = 300;
        repeat_rate = 30;
      };

      bind =
        [
          "$mainMod, Return, exec, kitty"
          "$mainMod SHIFT, A, killactive"
          "$mainMod, F, fullscreen"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            x:
            let
              ws =
                let
                  c = (x + 1) / 10;
                in
                builtins.toString (x + 1 - (c * 10));
            in
            [
              "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
              "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              "$mainMod CTRL, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
            ]
          ) 10
        ));

      decoration = {
        shadow.enabled = false;
        rounding = 0;
        dim_special = 0.3;
        blur = {
          enabled = true;
          special = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          xray = false;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        mouse_move_focuses_monitor = true;
        vfr = true;
      };
    };
  };
}
