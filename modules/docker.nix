{ config, pkgs, ... }:
{
  # Enable daemon
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false; # Socket activated
    };
  };
}
