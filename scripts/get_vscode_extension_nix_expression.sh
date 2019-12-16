#!/bin/sh

# $1 ext $2 ver

set -e

EXT_AUTHOR=$(echo "$1" | cut -d '.' -f 1)
EXT_NAME=$(echo "$1" | cut -d '.' -f 2-)
EXT_URL="https://${EXT_AUTHOR}.gallery.vsassets.io/_apis/public/gallery/publisher/${EXT_AUTHOR}/extension/${EXT_NAME}/${2}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
EXT_SHA256=$(curl -L "$EXT_URL" | sha256sum | awk '{ print $1 }')

cat <<EOF
{
  name = "$EXT_NAME";
  publisher = "$EXT_AUTHOR";
  version = "$EXT_URL";
  sha256 = "$EXT_SHA256";
}
EOF
