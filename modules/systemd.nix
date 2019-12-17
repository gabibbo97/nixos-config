{ config, pkgs, ... }: {
  # Journald
  services.journald.extraConfig = ''
    Storage = volatile
    Compress = yes
    RuntimeMaxUse = 256M
    RuntimeMaxFileSize = 16M
  '';

  # System
  systemd.coredump = {
    enable = true;
    extraConfig = ''
      Storage = external
      Compress = yes
      MaxUse = 25%
    '';
  };
}
