{ config, pkgs, ... }: {
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluezFull; # All features
    powerOnBoot = false;
  };
}
