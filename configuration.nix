{ config, pkgs, ... }:
let
  deviceName = "{{ deviceName }}"
in
{
  imports =
    [
      "./hosts/${deviceName}.nix"
      ./modules/docker.nix
      ./modules/sway.nix
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./secrets.nix
    ];

  # Bootloader
  boot = {
    loader = {
      efi = { efiSysMountPoint = "/boot"; };
      systemd-boot = {
        configurationLimit = 25; # Keep this amount of configurations
        editor = true;
        enable = true;
      };
    };
    plymouth = {
      enable = true;
    };
    tmpOnTmpfs = true; # /tmp on tmpfs
  };

  # Encryption
  boot.initrd.luks.devices = {
    linuxcrypt = {
      device = "/dev/disk/by-label/LINUXCRYPT";
      preLVM = true;
    };
  };

  # Networking
  networking = {
    hostName = "${deviceName}";
    useDHCP = false;
    useNetworkd = true;
  };
  services = {
    resolved = {
      enable = true;
      fallbackDns = [ "1.1.1.1" "8.8.8.8" "9.9.9.9" ];
    };
    timesyncd = {
      enable = true;
    };
  };

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware = {
    ksm = { # Kernel samepage merging
      enable = true;
    };
  };

  # Systemd
  systemd = {
    network = {
      enable = true;
      networks = {
        ethernet = {
          DHCP = "yes";
          name = "e*";
        };
      };
    };
  };

  # Internationalisation properties.
  i18n = {
    consoleKeyMap = "us";
    defaultLocale = "it_IT.UTF-8";
    extraLocaleSettings = {
      LC_MESSAGES = "en_US.UTF-8";
    };
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "it_IT.UTF-8/UTF-8"
    ];
  };
  time = {
    timeZone = "Europe/Rome";
  };

  # Users
  users.mutableUsers = false;
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Nix
  nix = {
    allowedUsers = [ "root" "@wheel" ];
    trustedUsers = config.nix.allowedUsers;
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
