{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Dictionaries
    hunspellDicts.en_GB-large
    hunspellDicts.en_US-large
    hunspellDicts.it_IT

    # LibreOffice
    libreoffice-fresh

    # LaTeX
    texlive.combined.scheme-basic

    # PDF
    evince
    zathura
  ];
}