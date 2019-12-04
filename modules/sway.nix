{ config, pkgs, ... }:
{
  # Install Sway
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaybg swayidle swaylock
      alacritty # Default terminal
      waybar # Status bar
    ];
  };
}
