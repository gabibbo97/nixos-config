{ config, pkgs ? import <nixpkgs> {} }:

mkShell {
  buildInputs = with pkgs; [
    git gnupg rsync
  ];
}
