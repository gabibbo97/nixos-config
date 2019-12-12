{ config, pkgs, ... }:
{
  # Enable daemon
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false; # Socket activated

      # Cleanup
      autoPrune = {
        enable = true;
        flags = [ "--all" "--volumes" ];
      };
    };
  };

  # Enable docker-compose
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
