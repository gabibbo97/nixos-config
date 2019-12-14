{ config, pkgs, ... }:
let
  deviceName = "{{ deviceName }}";
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "5e7a4c55ed110ff3c9d16906d9feeb710e4d0859";
    ref = "release-19.09";
  };
in
{
  imports =
    [
      (./. + "/hosts/${deviceName}/${deviceName}.nix")
      ./modules/adb.nix
      ./modules/audio.nix
      ./modules/docker.nix
      ./modules/fonts.nix
      ./modules/home-manager/home-manager.nix
      ./modules/k8s.nix
      ./modules/network/network.nix
      ./modules/office.nix
      ./modules/sway.nix
      ./modules/virtualisation.nix
      ./modules/vscode.nix
      ./modules/zsh.nix
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./secrets.nix
      # Load home manager
      "${home-manager}/nixos"
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

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware = {
    ksm = { # Kernel samepage merging
      enable = true;
    };
  };

  # Make Stallman sad
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  # Firmware update
  services.fwupd.enable = true;

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

  networking.hostName = "${deviceName}";

  # Programs
  programs = {
    chromium.enable = true;
    gnupg.agent.enable = true;
  };
  environment.systemPackages = with pkgs; [
    # GUI apps
    firefox-wayland
    mpv
    tdesktop

    # TUI apps
    aria curl wget # Downloaders
    bat ranger
    git
    gnupg
    rsync
  ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
