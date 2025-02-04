{ pkgs, ... }:
{
  home.packages = [
    pkgs.cascadia-code
    pkgs.font-awesome
    pkgs.roboto
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layout = "top";
        position = "top";
        height = 35;
        width = 1400;
        spacing = 4;
        margin-top = 10;
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [
          "clock"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          warp-on-scroll = false;
          format = "{name}";
          persisent_workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
            "7" = [ ];
            "8" = [ ];
            "9" = [ ];
            "10" = [ ];
          };
        };

        "clock" = {
          tooltip-format = "<big>{=%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{=%Y-%m-%d}";
        };
      };
    };

    style = ''
      * {
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: Cascadia Code PL, FontAwesome, Roboto, Helvetica, Arial, sans-serif;
          font-size: 13px;
          min-height: 0;
          border-radius: 10px;
      }

      window#waybar {
          background-color: rgba(0, 0, 0, 0.8);
          color: #ffffff;
          transition-property: background-color;
          transition-duration: .5s;
      }

      window#waybar.hidden {
          opacity: 0.1;
      }

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          /* box-shadow: inset 0 -3px transparent; */
          /* Avoid rounded borders under each button name */
          background-color: transparent;
          border-radius: 0px;
      }

      worksapces button {
        border-radius: 10px;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
        border-color: rgba(0,0,0,0);
        box-shadow: none; /* Remove predefined box-shadow */
        text-shadow: none; /* Remove predefined text-shadow */
        background: none; /* Remove predefined background color (white) */
        transition: none; /* Disable predefined animations */
      }
      #workspaces {
        border-radius: 10px;
      }

      #workspaces button {
          color: #ffffff;
      }

      #workspaces button:hover {
        background-color: rgba(150,150,150, 0.15);
      }

      #workspaces button.active {
          background-color: rgba(150,150,150,0.2);
      }

      #workspaces button.urgent {
          background-color: #eb4d4b;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #tray,
      #mode,
      #idle_inhibitor,

      #window {
          margin-top: 0px;
        padding: 0px 5px;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 8px;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child {
          padding-right: 0px;
          margin-right: 5px;
      }

      #clock {
          margin-right: 8px;
      }

      #custom-swaylock {
        padding-right: 6px;
        padding-left: 5px;
      }

      #battery {
        padding-left: 5px;
        padding-right: 9px;
      }

      #battery.charging, #battery.plugged {
        padding-left: 5px;
        padding-right: 7px;
      }

      @keyframes blink {
        to {
          color: #000000;
          padding: 0px 5px;
          }
      }

      #battery.critical:not(.charging) {
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
          padding: 0px 5px;
      }

      label:focus {
      }

      #network.disconnected {
        padding: 0px 5px;
      }

      #pulseaudio.muted {
        padding: 0px 5px;
      }

      #temperature.critical {
        padding: 0px 5px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
        padding: 0px 5px;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
      }

      #idle_inhibitor.activated {
      }

      #backlight {
        padding-left: 5px;
        padding-right: 7px;
      }

      #temperature {
        padding-left: 5px;
        padding-right: 7px;
      }
    '';
  };
}
