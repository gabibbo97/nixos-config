{ config, pkgs, ... }:
{
  imports = [
    ../../modules/laptop.nix
  ];

  home-manager.users.giacomo = {
    xdg.configFile."sway/hostconfig".source = ./sway-user-config;
    xdg.configFile."waybar/config".source = ./waybar.json;
  };
}
