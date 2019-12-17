{ config, pkgs, ... }: {
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

  # Mount Docker root on tmpfs
  systemd.mounts = [{
    before = [ "docker.service" "docker.socket" ];
    requiredBy = [ "docker.service" "docker.socket" ];
    description = "Mount Docker storage on tmpfs";
    type = "tmpfs";
    what = "tmpfs";
    where = "/var/lib/docker";
  }];

  # Enable docker-compose
  environment.systemPackages = with pkgs; [ docker-compose ];
}
