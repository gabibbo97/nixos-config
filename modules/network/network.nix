{ config, pkgs, ... }:
{
  # Networking
  networking = {
    useDHCP = false;
    useNetworkd = true;
  };
  systemd.network.networks."99-main".enable = false; # FIXME: disable 99-main.conf
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
