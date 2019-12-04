#!/bin/sh
set -e

# Cleanup function
cleanupAssetsDir() {
  if [ -z "$ASSETDIR" ]; then return; fi
  rm -rf "$ASSETDIR"
  echo "Cleaned up assets directory"
}
cleanup() {
  cleanupAssetsDir
}
trap cleanup EXIT HUP TERM QUIT

# Logic
if [ $# -eq 0 ]; then
  # Configuration
  ## Get machine name
  if [ -f "hosts/$(hostname).nix" ]; then
    echo "Trying to configure machine $(hostname)"
    MACHINE="$(hostname)"
  else
    while ! [ -f "hosts/${MACHINE}.nix" ]; do
      echo "Available hosts:"
      clear
      for host in hosts/*; do
        basename "$host" | rev | cut -d '.' -f 2- | rev
      done
      echo ""

      printf 'Select configuration: ' && read -r
      MACHINE="$REPLY"
    done
  fi
  ## Decrypt secrets using gpg
  if ! [ -f secrets.gpg ]; then
    echo "No secrets.gpg file found!" >/dev/stderr && exit 1
  fi
  gpg --decrypt --output secrets.nix <secrets.gpg
  ## Generate assets
  ASSETDIR="$(mktemp -d)"
  rsync -acq --delete \
    --exclude '.git' \
    --exclude '.gitignore' \
    --exclude '*.gpg' \
    --exclude '*.md' \
    --exclude '*.txt' \
    --exclude 'scripts' \
    . "$ASSETDIR"
  sed -i "s/{{ deviceName }}/${MACHINE}/" "${ASSETDIR}/configuration.nix"
  ## Copy assets
  sudo rsync -acv --delete "$ASSETDIR/" /etc/nixos/
fi
