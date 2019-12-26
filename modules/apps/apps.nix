{ pkgs, ... }: {
  imports = [
    ./coding.nix
  ];

  # Programs
  programs = {
    chromium.enable = true;
    gnupg.agent.enable = true;
  };
  environment.systemPackages = with pkgs; [
    manpages

    # GUI apps
    firefox-wayland
    mpv
    tdesktop

    # TUI apps
    ansible # ansible-lint
    aria
    curl
    wget # Downloaders
    bat
    ranger
    git
    gnupg
    rsync
    htop # Information
    jq # JSON formatting
  ];
}
