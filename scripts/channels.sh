#!/bin/sh
set -e

# Exit if nonroot
if [ $EUID -ne 0 ]; then echo "Run as root" >/dev/stderr && exit 1; fi

# NixOS
if nix-channel --list | grep -q 'nixos'; then
  if [ "$(nix-channel --list | grep -E '^nixos' | awk '{ print $2 }' | xargs -r basename)" != "nixos-unstable" ]; then
    nix-channel --remove nixos
    nix-channel --add https://nixos.org/channels/nixos-unstable nixos
  fi
else
  nix-channel --add https://nixos.org/channels/nixos-unstable nixos
fi

# Nixpkgs
if nix-channel --list | grep -q 'nixpkgs'; then
  if [ "$(nix-channel --list | grep -E '^nixpkgs' | awk '{ print $2 }' | xargs -r basename)" != "nixpkgs-unstable" ]; then
    nix-channel --remove nixpkgs
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
  fi
else
  nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
fi
