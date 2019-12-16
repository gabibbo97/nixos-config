#! /usr/bin/env nix-shell
#! nix-shell -i sh -p nixfmt
find . -type f -name '*.nix' -exec nixfmt {} \;
