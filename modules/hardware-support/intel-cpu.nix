{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.gabibbo97.hardware-support;
in
{
  config = mkIf cfg.intelCPU {
    # Update microcode
    hardware.cpu.intel.updateMicrocode = true;

    # Graphics drivers
    hardware.opengl.extraPackages = with pkgs; [
      # Video HW acceleration
      vaapiIntel # VA-API
      intel-media-driver # VA-API - Broadwell+ GPUs
      libvdpau-va-gl # VDPAU
      # OpenCL
      beignet # OpenCL for Ivy Bridge+ GPUs
      intel-ocl
    ];
  };
}
