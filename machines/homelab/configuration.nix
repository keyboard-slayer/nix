# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../../services/vaultwarden.nix
    ../../services/forgejo.nix
    ../../services/ghost.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

  networking.hostName = "homelab"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.interfaces.wlp2s0.ipv4.addresses = [
    {
      address = "192.168.0.69";
      prefixLength = 24;
    }
  ];

  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";
  programs.zsh.enable = true;

  users.users.keyb = {
    isNormalUser = true;
    description = "Keyb";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  virtualisation = {
    containers.enable = true;
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      dockerCompat = true;
      autoPrune.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  services.openssh.enable = true;
  system.stateVersion = "25.05";
}
