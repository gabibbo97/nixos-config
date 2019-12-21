{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.gabibbo97.i3status;
in
{
  # Configuration
  home-manager.users.giacomo.xdg.configFile."i3status/config".text = builtins.readFile ../../dotfiles/i3status/config;

  # Add self
  environment.systemPackages = with pkgs; [ i3status ];
}
