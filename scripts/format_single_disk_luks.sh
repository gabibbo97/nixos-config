#!/bin/sh
set -e # Fail on error

# Set parameters
while [ -z "$ROOT_DEVICE" ]; do
  clear && lsblk
  printf 'Select root device: ' && read -r
  ROOT_DEVICE="${REPLY}"
done
while [ -z "$LUKS_PASS" ]; do
  printf 'Insert luks password: ' && read -r
  LUKS_PASS="${REPLY}"
done

# Wipe out partitions
wipefs --all --force "${ROOT_DEVICE}"

# Create partitions
sgdisk --new=0:0:+512M --typecode=0:EF00 "${ROOT_DEVICE}"
sgdisk --largest-new=0 --typecode=0:8309 "${ROOT_DEVICE}"

# Format filesystems
mkfs.vfat -F32 -n LINUXBOOT "${ROOT_DEVICE}1"

printf '%s' "${LUKS_PASS}" | cryptsetup --batch-mode luksFormat --type luks2 --label LINUXCRYPT \
  --use-urandom \
  --cipher aes-xts-plain64 --key-size 512 --hash sha512 \
  "${ROOT_DEVICE}2" -

KEYFILE=$(mktemp)
printf '%s' "${LUKS_PASS}" >"$KEYFILE"
cryptsetup open --type luks --key-file "$KEYFILE" "${ROOT_DEVICE}2" linuxcrypt
rm -f "$KEYFILE"

pvcreate --yes /dev/mapper/linuxcrypt
vgcreate --yes linux /dev/mapper/linuxcrypt
SWAP_SIZE=$((($(grep 'MemTotal' /proc/meminfo | awk '{ print $2 }') / 1024 / 1024) + 1))
lvcreate --size "${SWAP_SIZE}G" --name swap linux
lvcreate --extents 100%FREE --name root linux

mkswap -L LINUXSWAP /dev/linux/swap
mkfs.xfs -L LINUXROOT -m reflink=1 /dev/linux/root

# Mount filesystems
swapon /dev/linux/swap
mount /dev/linux/root /mnt

mkdir -p /mnt/boot
mount "${ROOT_DEVICE}1" /mnt/boot
