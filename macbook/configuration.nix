{ pkgs, ... }:
{
  nix.package = pkgs.nix;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  services.nix-daemon.enable = true;

  environment.systemPackages = [
    pkgs.coreutils
  ];

  # fonts.packages = [
  #   pkgs.nerdfonts
  # ];

  programs.fish.enable = true;

  environment.shells = [
    pkgs.fish
  ];

  users.users.keyb = {
    home = "/Users/keyb";
    shell = pkgs.fish;
  };

  system.stateVersion = 4;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    dock = {
      autohide = false;
      magnification = true;

      show-recents = true;
      largesize = 50;
      tilesize = 35;

      persistent-apps = [
        "/Applications/Firefox.app"
        "/Applications/Ghostty.app"
        "/system/applications/Launchpad.app"
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
      "com.apple.mouse.tapBehavior" = 1;
      AppleInterfaceStyleSwitchesAutomatically = true;
      AppleShowAllExtensions = true;
      AppleInterfaceStyle = "Dark";
      InitialKeyRepeat = 15;
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
      "thunderbird"
      "ghostty"
      "firefox"
    ];
  };
}
