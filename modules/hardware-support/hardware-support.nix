{ config, lib, pkgs, ... }:
with lib;
let cfg = config.gabibbo97.hardware-support;
in {
  imports = [ ./intel-cpu.nix ./nvidia-gpu.nix ];

  options.gabibbo97.hardware-support = {
    intelCPU = mkEnableOption "INTEL CPU";
    nvidiaGPU = mkEnableOption "NVIDIA GPU";
  };
}
