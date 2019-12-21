{ config, pkgs, ... }: {
  # Install Sway
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      swaybg
      swayidle
      swaylock
      alacritty # Default terminal
      # (waybar.override { pulseSupport = true; }) # Status bar
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

  # Display Manager
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
}
