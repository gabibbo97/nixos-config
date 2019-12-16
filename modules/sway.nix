{ config, pkgs, ... }: {
  # Install Sway
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaybg
      swayidle
      swaylock
      alacritty # Default terminal
      (waybar.override { pulseSupport = true; }) # Status bar
      xwayland # Wayland support
      fzf # Launcher
      wl-clipboard # Clipboard
      grim
      slurp # Screenshots
      mako
      libnotify # Notifications
      xdg_utils
      pavucontrol # Audio
    ];
  };

  # Waybar icon fonts
  fonts.fonts = with pkgs; [ font-awesome ];
}
