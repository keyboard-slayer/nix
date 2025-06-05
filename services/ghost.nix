{ lib, ... }:
{
  virtualisation.oci-containers.containers.ghost = {
    image = "ghost:latest";

    environment = {
      url = "http://blog.keyb.moe";
      database__client = "sqlite3";
      database__connection__filename = "/var/lib/ghost/content/data/ghost.db";
    };

    volumes = [
      "/srv/ghost:/var/lib/ghost/content:cached"
    ];

    autoStart = true;
    ports = [ "2368:2368" ];
  };

  systemd.tmpfiles.rules = [
    "d /srv/ghost 0755 root root -"
  ];

  networking.firewall.allowedTCPPorts = [
    2368
  ];
}
