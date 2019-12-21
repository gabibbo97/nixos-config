{ config, pkgs, ... }: {
  gabibbo97.hardware-support = {
    intelCPU = true;
    nvidiaGPU = true;
  };

  gabibbo97.laptop.isLaptop = true;

  gabibbo97.sway = {
    extraInputConfig = ''
      output eDP-1 scale 2
    '';
    extraOutputConfig = ''
      input "2:7:SynPS/2_Synaptics_TouchPad" {
        dwt enabled
        events disabled_on_external_mouse
        tap enabled
      }
      input "1:1:AT_Translated_Set_2_keyboard" {
        xkb_layout gb
        xkb_variant intl
      }
    '';
    swayBar.outputs = [ "eDP-1" ];
  };
}
