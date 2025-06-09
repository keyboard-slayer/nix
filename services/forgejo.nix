{
  services.forgejo = {
    enable = true;
    settings.server = {
      START_SSH_SERVER = true;
      USE_COMPACT_SSH_URI = false;
      SSH_PORT = 1337;
      SSH_DOMAIN = "192.168.0.69";
      HTTP_PORT = 3030;
      ROOT_URL = "https://git.keyb.moe/";
      APP_NAME = "(つ▀¯▀)つ";
    };
  };

  networking.firewall.allowedTCPPorts = [
    3030
    1337
  ];
}
