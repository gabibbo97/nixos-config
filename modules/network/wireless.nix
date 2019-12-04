{ config, pkgs, ... }:
{
  imports = [
    ./wireless/bluetooth.nix
    ./wireless/wifi.nix
  ];
}
