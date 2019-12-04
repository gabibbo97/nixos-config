{ config, pkgs, ... }:
{
  # iwd
  networking.wireless.iwd.enable = true;

  # systemd-networkd
  systemd.network.networks = {
    wireless = {
      DHCP = "yes";
      name = "w*";
    };
  };
}
