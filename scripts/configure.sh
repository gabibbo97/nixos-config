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
  if [ -f "hosts/$(hostname)/$(hostname).nix" ]; then
    echo "Trying to configure machine $(hostname)"
    MACHINE="$(hostname)"
  else
    while ! [ -f "hosts/${MACHINE}/${MACHINE}.nix" ]; do
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
  gpg --decrypt --output secrets.nix secrets.gpg
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
  ## Recreate hardware-configuration.nix
  nixos-generate-config
elif [ $# -eq 1 ] && [ "$1" = "backup" ]; then
  # Backup
  echo "Backing up"
  ## Grab files
  rsync -acv --delete '/etc/nixos/hosts/' ./hosts/
  rsync -acv --delete '/etc/nixos/modules/' ./modules/
  rsync -acv '/etc/nixos/configuration.nix' .
  rsync -acv '/etc/nixos/secrets.nix' .
  ## Restore configuration.nix template
  devname=$(grep 'deviceName' configuration.nix | grep '=' | grep -v '\$' | grep -v '{' | grep -v '}' | awk '{ print $3 }' | grep -oE '"([^"]+)"' | tr -d '"')
  sed -i "s/${devname}/{{ deviceName }}/" configuration.nix
  ## Encrypt secrets
  gpg --symmetric --output secrets.gpg secrets.nix
fi
