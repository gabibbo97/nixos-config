{ config, pkgs, ... }: {
  # Enable LibVirt
  virtualisation = {
    libvirtd = {
      enable = true;
      qemuOvmf = true;
    };
  };

  # Management utilities
  environment.systemPackages = with pkgs; [ vagrant virtmanager virt-viewer ];
}
