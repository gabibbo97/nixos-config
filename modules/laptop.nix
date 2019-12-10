{ config, pkgs, ... }:
{
  imports = [
    ./network/wireless.nix
  ];

  # Autosuspension
  powerManagement.enable = true;
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchDocked = "ignore";
    lidSwitchExternalPower = "ignore";
  };

  # Display
  hardware.brightnessctl.enable = true;

  # TLP
  services.tlp = {
    enable = true;
  };

  # Do not wait for online
  systemd.services."systemd-networkd-wait-online".enable = false;
  systemd.targets."systemd-networkd-wait-online".enable = false;
}
