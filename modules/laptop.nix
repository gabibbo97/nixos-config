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

  # TLP
  services.tlp = {
    enable = true;
  };
}
