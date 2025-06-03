{ pkgs, config, ... }:
{
  nix.package = pkgs.nix;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  system.primaryUser = "jordan";

  environment.systemPackages = [
    pkgs.coreutils
    pkgs.mkalias
  ];

  programs.fish.enable = true;

  users.users.jordan = {
    home = "/Users/jordan";
    shell = pkgs.zsh;
  };

  system.stateVersion = 6;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  system.defaults = {
    dock = {
      autohide = false;
      magnification = true;

      show-recents = true;
      largesize = 50;
      tilesize = 35;

      persistent-apps = [
        "${pkgs.librewolf}/Applications/LibreWolf.app"
        "${pkgs.ghostty-bin}/Applications/Ghostty.app"
        "/system/applications/Launchpad.app"
      ];

      persistent-others = [
        "/Users/jordan/Downloads"
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
    ];
  };

  system.activationScripts.applications.text =
  let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
  pkgs.lib.mkForce ''
    # Set up applications.
    echo "setting up /Applications..." >&2
    rm -rf /Applications/Nix\ Apps
    mkdir -p /Applications/Nix\ Apps
    find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
    while read -r src; do
      app_name=$(basename "$src")
      echo "copying $src" >&2
      ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
    done
  '';

}
