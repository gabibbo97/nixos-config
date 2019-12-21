{ config, pkgs, ... }: {

  hardware.trackpoint = { enable = true; };

  gabibbo97.hardware-support = { intelCPU = true; };

  gabibbo97.laptop.isLaptop = true;

  gabibbo97.sway = {
    extraCommandBindings = {
      XF86Search = "$menu";
      XF86LaunchA = "$menu";
      XF86Explorer = "$menu";
      XF86Tools =
        "notify-send --expire-time=1500 'Unsupported key' 'No action mapped to tools button'";
      XF86Display =
        "notify-send --expire-time=1500 'Unsupported key' 'No action mapped to display button'";
      XF86WLAN =
        "notify-send --expire-time=1500 'Network card switched' 'Pressed WLAN key'";
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
    swayBar.outputs = [ "eDP-1" ];
  };
}
