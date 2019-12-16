{ config, lib, pkgs, ... }:
with lib;
let cfg = config.gabibbo97.hardware-support;
in {
  config = mkIf cfg.nvidiaGPU {
    # Graphics drivers
    hardware.opengl.extraPackages = with pkgs;
      [
        # Video HW acceleration
        vaapiVdpau # VA-API on VDPAU
      ];
  };
}
