{ config, pkgs, ... }:
{
  gabibbo97.hardware-support = {
    intelCPU = true;
  };

  gabibbo97.laptop.isLaptop = true;

  gabibbo97.sway = {
    extraBindings = {
      XF86Search = "exec $menu";
      XF86LaunchA = "exec $menu";
      XF86Explorer = "exec $menu";
    };
    extraInputConfig = ''
      input "1739:0:Synaptics_tm2963-001" {
        dwt enabled
        events disabled_on_external_mouse
        tap enabled
      }
      input "1:1:AT_Translated_Set_2_keyboard" {
        xkb_layout it
      }
    '';
  };

  gabibbo97.waybar.configFile = {
    output = "eDP-1";
  };
}
