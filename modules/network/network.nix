{ config, pkgs, ... }:
{
  # Networking
  networking = {
    useDHCP = false;
    useNetworkd = true;
  };
  systemd = {
    network = {
      enable = true;
      networks = {
        ethernet = {
          DHCP = "yes";
          name = "e*";
        };
        "99-main" = { # FIXME: disable 99-main.conf
          enable = "false";
        };
      };
    };
  };
  services = {
    resolved = {
      enable = true;
      fallbackDns = [ "1.1.1.1" "8.8.8.8" "9.9.9.9" ];
    };
    timesyncd = {
      enable = true;
    };
  };
}
