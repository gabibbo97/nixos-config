{ config, lib, pkgs, ... }:
with lib;
let cfg = config.gabibbo97.laptop;
in {
  imports = [ ./network/wireless.nix ];

  options.gabibbo97.laptop = {
    isLaptop = mkEnableOption "Is this pc a laptop?";
  };

  config = mkIf cfg.isLaptop {

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
    services.tlp = { enable = true; };

    # Do not wait for online
    systemd.services."systemd-networkd-wait-online".enable = false;
    systemd.targets."systemd-networkd-wait-online".enable = false;

  };
}
