{
  services.forgejo = {
    enable = true;
    settings = {
      server = {
        SSH_PORT = 1337;
        SSH_DOMAIN = "192.168.0.69";
        HTTP_PORT = 3030;
        ROOT_URL = "https://git.keyb.moe/";
      };
      service = {
        APP_NAME = "(つ▀¯▀)つ";
        START_SSH_SERVER = true;
        DISABLE_REGISTRATION = true;
        USE_COMPACT_SSH_URI = false;
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    3030
    1337
  ];
}
