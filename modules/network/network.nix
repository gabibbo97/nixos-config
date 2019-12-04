{ config, pkgs, ... }:
{
  # Networking
  networking = {
    useDHCP = false;
    useNetworkd = true;
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
