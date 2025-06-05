{
  services.vaultwarden = {
    enable = true;
    config = {
      DOMAIN = "https://bitwarden.keyb.moe";
      SIGNUPS_ALLOWED = true;
      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = "8080";
    };
  };

  networking.firewall.allowedTCPPorts = [
    8080
  ];
}
