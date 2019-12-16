{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.gabibbo97.sway;

  configKeyBind = key: command: "bindsym ${key} ${command}";

  configKeyBinds = attrValues (mapAttrs configKeyBind (cfg.extraBindings
    // (mapAttrs (k: v: "exec " + v) cfg.extraCommandBindings)));
in {
  options.gabibbo97.sway = {
    configFile = mkOption { type = types.lines; };
    extraBindings = mkOption {
      default = { };
      type = types.attrsOf types.str;
    };
    extraCommandBindings = mkOption {
      default = { };
      type = types.attrsOf types.str;
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
      # Host specific key bindings
      ${builtins.concatStringsSep "\n" configKeyBinds}
      # Host specific input configuration
      ${cfg.extraInputConfig}
      # Host specific output configuration
      ${cfg.extraOutputConfig}
    '';
  };
}
