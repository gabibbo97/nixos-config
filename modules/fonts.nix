{ config, pkgs, ... }:
{
  # Font configuration
  fonts = {
    enableDefaultFonts = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Emoji" ];
        monospace = [ "Fira Mono" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
    fonts = with pkgs; [
      # Other
      corefonts
      dejavu_fonts
      eunomia
      liberation_ttf
      noto-fonts
      noto-fonts-emoji
      # Monospace
      anonymousPro
      fira-code
      fira-mono
      hermit
      inconsolata
      iosevka
      # Sans-serif
      carlito
      comfortaa
      lato
      montserrat
      overpass
      # Serif
      crimson
    ];
  };
}