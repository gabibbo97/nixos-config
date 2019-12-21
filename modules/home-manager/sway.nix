{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.gabibbo97.sway;

  buildSwayBarOutputs = outputs: concatStringsSep "\n" (builtins.map (output: "output " + output) outputs);

  configKeyBind = key: command: "bindsym ${key} ${command}";

  configKeyBinds = attrValues (mapAttrs configKeyBind (cfg.extraBindings
    // (mapAttrs (k: v: "exec " + v) cfg.extraCommandBindings)));

  swayBarConfig = ''
    #
    # Status Bar:
    #
    bar {
        font pango:DejaVu Sans Mono, FontAwesome 12
        position top
        status_command i3status
        separator_symbol -
        ${buildSwayBarOutputs cfg.swayBar.outputs}
        colors {
            separator #666666
            background #222222
            statusline #dddddd
            focused_workspace #CC0000 #CC0000 #ffffff
            active_workspace #770000 #770000 #ffffff
            inactive_workspace #333333 #333333 #888888
            urgent_workspace #2f343a #900000 #ffffff
        }
    }
  '';
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
    extraConfig = mkOption {
      default = [];
      type = types.listOf types.lines;
    };
    swayBar = {
      outputs = mkOption {
        default = [];
        type = types.listOf types.str;
      };
    };
  };

  config = {
    gabibbo97.sway.configFile = ''
      ${builtins.readFile ../../dotfiles/sway/config}
      ${swayBarConfig}
      # Host specific key bindings
      ${builtins.concatStringsSep "\n" configKeyBinds}
      # Host specific input configuration
      ${cfg.extraInputConfig}
      # Host specific output configuration
      ${cfg.extraOutputConfig}
    '';
  };
}
