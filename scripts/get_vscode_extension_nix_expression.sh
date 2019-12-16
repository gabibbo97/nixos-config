#! /usr/bin/env nix-shell
#! nix-shell -i sh -p jq unzip

# $1 ext $2 ver

set -e

getPackage() {
  EXT_AUTHOR=$(echo "$1" | cut -d '.' -f 1)
  EXT_NAME=$(echo "$1" | cut -d '.' -f 2-)
  EXT_URL="https://${EXT_AUTHOR}.gallery.vsassets.io/_apis/public/gallery/publisher/${EXT_AUTHOR}/extension/${EXT_NAME}/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"

  EXTFILE="${TMPDIR}/extfile"
  curl -L --silent --show-error --fail -X GET "$EXT_URL" > "$EXTFILE"

  EXT_SHA256=$(sha256sum < "$EXTFILE" | awk '{ print $1 }')
  EXT_VERSION=$(unzip -qc "$EXTFILE" "extension/package.json" | jq -r '.version')

  rm -f "$EXTFILE"

  cat <<EOF
{
  name = "$EXT_NAME";
  publisher = "$EXT_AUTHOR";
  version = "$EXT_VERSION";
  sha256 = "$EXT_SHA256";
}
EOF
}

TMPDIR=$(mktemp -d)
for ext in $(codium --list-extensions | sort)
do
  getPackage "$ext"
done
rm -rf "$TMPDIR"
