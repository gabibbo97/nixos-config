{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.gabibbo97.sway;
in
{
  options.gabibbo97.sway = {
    configFile = mkOption {
      type = types.lines;
    };
    extraInputConfig = mkOption {
      default = "";
      type = types.lines;
    };
    extraOutputConfig = mkOption {
      default = "";
      type = types.lines;
    };
  };

  config = {
    gabibbo97.sway.configFile = ''
      ${builtins.readFile ../../dotfiles/sway/config}
      # Host specific input configuration
      ${cfg.extraInputConfig}
      # Host specific output configuration
      ${cfg.extraOutputConfig}
    '';
  };
}