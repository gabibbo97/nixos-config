{ config, pkgs, ... }:
let
  dotfiles-dir = "/etc/nixos/dotfiles";
in
{
  imports = [
    ./sway.nix
    ./waybar.nix
  ];
  home-manager.users.giacomo = {
    programs = {
      home-manager.enable = true;
    };
    xdg.enable = true;

    xdg.configFile."alacritty/alacritty.yml".source = "${dotfiles-dir}/alacritty/alacritty.yml";
    xdg.configFile."ranger/rc.conf".source = "${dotfiles-dir}/ranger/rc.conf";
    xdg.configFile."sway/config" = {
      onChange = "swaymsg reload";
      text = config.gabibbo97.sway.configFile;
    };
    xdg.configFile."waybar/style.css".source = "${dotfiles-dir}/waybar/style.css";
    xdg.configFile."waybar/config".text = builtins.toJSON config.gabibbo97.waybar.configFile;

    programs.git.enable = true;
    programs.ssh = {
      enable = true;
      compression = true;
      controlMaster = "auto";
      controlPath = "~/.ssh/control-%r-%h-%p";
      controlPersist = "3m";
    };
  };
}
