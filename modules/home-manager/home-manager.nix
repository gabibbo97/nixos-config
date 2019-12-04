{ config, pkgs, ... }:
let
  dotfiles-dir = "/etc/nixos/dotfiles";
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "dff5f07952e61da708dc8b348ea677414e992215";
    ref = "release-19.09";
  };
in
{
  # Load home manager
  imports = [
    "${home-manager}/nixos"
  ];
  home-manager.users.giacomo = {
    programs = {
      home-manager.enable = true;
    };
    xdg.enable = true;

    xdg.configFile."sway/config".source = "${dotfiles-dir}/sway/config";
  };
}
