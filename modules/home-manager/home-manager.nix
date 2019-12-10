{ config, pkgs, ... }:
let
  dotfiles-dir = "/etc/nixos/dotfiles";
in
{
  home-manager.users.giacomo = {
    programs = {
      home-manager.enable = true;
    };
    xdg.enable = true;

    xdg.configFile."alacritty/alacritty.yml".source = "${dotfiles-dir}/alacritty/alacritty.yml";
    xdg.configFile."sway/config".source = "${dotfiles-dir}/sway/config";
    xdg.configFile."waybar/style.css".source = "${dotfiles-dir}/waybar/style.css";
  
    programs.git.enable = true;
    programs.zsh.enable = true;
  };
}
