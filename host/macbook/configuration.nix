{ config, pkgs, ... }:

{
  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  services.nix-daemon.enable = true;

  environment.systemPackages = [
    pkgs.coreutils
  ];

  fonts.packages = [
    pkgs.nerdfonts
  ];

  programs.zsh.enable = true;
  programs.fish.enable = true;

  environment.shells = [
    pkgs.fish
    pkgs.zsh
  ];

  users.users.keyb = {
    home = "/Users/keyb";
    shell = pkgs.fish;
  };

  system.stateVersion = 4;
  system.keyboard.enableKeyMapping = true;

  system.defaults = {
    dock = {
      autohide = true;
      magnification = true;

      show-recents = false;
      largesize = 80;
      tilesize = 42;

      persistent-apps = [
        "/system/applications/Launchpad.app"
        "/Applications/Arc.app"
      ];

      persistent-others = [
        "/Users/keyb/Downloads"
      ];
    };

    finder = {
      CreateDesktop = false;
      AppleShowAllExtensions = true;
      _FXShowPosixPathInTitle = true;
    };

    NSGlobalDomain = {
      "com.apple.swipescrolldirection" = false;
      AppleShowAllExtensions = true;
      AppleInterfaceStyle = "Dark";
      InitialKeyRepeat = 35;
      KeyRepeat = 2;
      ApplePressAndHoldEnabled = false;
    };
  };

  documentation.enable = true;
  documentation.man.enable = true;

  homebrew = {
    enable = true;
    brews = [
    ];

    casks = [
      "temurin"
      "arc"
      "discord"
      "visual-studio-code"
      "logi-options-plus"
    ];
  };
}
