{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.gabibbo97.waybar;
  moduleList =
    cfg.configFile.modules-left 
      ++ cfg.configFile.modules-center
      ++ cfg.configFile.modules-right;
  hasModule = moduleName: builtins.elem moduleName moduleList;
in
{
  options.gabibbo97.waybar = {
    configFile = mkOption {
      type = types.attrs;
    };
    extraModules = {
      right = mkOption {
        default = [];
        type = types.listOf types.str;
      };
    };
  };

  config = {
    gabibbo97.waybar.configFile = {
      layer = "top";
      position = "top";
      modules-left = [
        "sway/workspaces"
        "sway/window"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "tray"
        "network"
        "pulseaudio"
      ] ++ cfg.extraModules.right;
      network = {
        format = "{ifname}";
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ifname} {ipaddr} {cidr} ";
        format-disconnected = "OFFLINE";
        tooltip-format = "{ifname}";
        tooltip-format-wifi = "{essid} ({signalStrength}% UP {bandwidthUpBits} DOWN {bandwidthDownBits}) ";
        tooltip-format-ethernet = "{ifname} ";
        tooltip-format-disconnected = "Disconnected";
        max-length = 50;
      };
      pulseaudio = {
        format = "VOL: {volume}%";
        format-muted = "MUTE";
        scroll-step = 1;
        on-click = "pavucontrol";
        on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +1%";
        on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -1%";
      };
      backlight = {
        format = "{percent}% ";
        on-scroll-down = "sudo brightnessctl set 1%-";
        on-scroll-up = "sudo brightnessctl set +1%";
      };
      battery = {
        interval = 3;
        states = {
          warning = 30;
          critical = 10;
        };
        format = "{capacity}% {icon}";
        format-warning = "{capacity}% ";
        format-critical = "";
        format-charging = "{time} ";
        format-full = "FULL";
        format-icons = [
          "" "" "" "" ""
        ];
      };
    };
  };
}