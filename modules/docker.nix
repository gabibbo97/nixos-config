{ config, pkgs, ... }:
{
  # Enable daemon
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false; # Socket activated
    };
  };

  # Enable docker-compose
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
