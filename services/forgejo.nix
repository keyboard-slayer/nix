{
  services.forgejo = {
    enable = true;
    settings.server = {
      SSH_PORT = 1337;
      HTTP_PORT = 3030;
      ROOT_URL = "https://git.keyb.moe/";
      APP_NAME = "(つ▀¯▀)つ";
    };
  };

  networking.firewall.allowedTCPPorts = [
    3030
  ];
}
