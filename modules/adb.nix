{ config, pkgs, ... }:
{
  programs.adb.enable = true;

  users.users.giacomo.extraGroups = [ "adbusers" ];
}