{ config, pkgs, ... }:
{
  imports = [
    ../../modules/laptop.nix
    ../../hardware-support/intel-cpu.nix
    ../../hardware-support/nvidia-gpu.nix
  ];

  home-manager.users.giacomo = {
    xdg.configFile."sway/hostconfig".source = ./sway-user-config;
    xdg.configFile."waybar/config".source = ./waybar.json;
  };
}
