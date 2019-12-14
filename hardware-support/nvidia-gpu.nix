{ pkgs, ... }:
{
  # Graphics drivers
  hardware.opengl.extraPackages = with pkgs; [
    # Video HW acceleration
    vaapiVdpau # VA-API on VDPAU
  ];
}
