{ config, pkgs, ... }: {
  programs.adb.enable = true;

  environment.systemPackages = [ pkgs.android-udev-rules ];

  users.users.giacomo.extraGroups = [ "adbusers" ];
}
