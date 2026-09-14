#!/bin/sh

# Generate ~/.gitignore_global.
#
# git reads global ignore rules from a single file (core.excludesFile), so a
# machine-local ignore file cannot simply be layered on top of the shared one.
# This script concatenates the two sources into the file git actually reads:
#
#   <dotfiles>/.gitignore_global   shared rules, tracked by git
#   ~/.gitignore_global.local      rules for this machine only, untracked
#
# Run this script after editing either file. ./deploy.sh calls it as well.

set -eu

DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)
SHARED="${DOTFILES_DIR}/.gitignore_global"
LOCAL="${HOME}/.gitignore_global.local"
DEST="${HOME}/.gitignore_global"

if [ ! -f "${LOCAL}" ]; then
  cat > "${LOCAL}" <<'LOCAL_EOF'
# Global gitignore rules for this machine only.
# Not tracked by git. Merged into ~/.gitignore_global by <dotfiles>/gitignore.sh.
# Run that script after editing this file.
LOCAL_EOF
  echo "created  ${LOCAL}"
fi

# Build in a temp file in the same directory so the final mv is atomic, and so
# that we never truncate ~/.gitignore_global while it is still a symlink to the
# shared source file.
tmp=$(mktemp "${DEST}.XXXXXX")
trap 'rm -f "${tmp}"' EXIT

{
  echo '# ============================================================================'
  echo '# GENERATED FILE - DO NOT EDIT. Changes made here will be overwritten.'
  echo '#'
  echo '# git accepts only one global ignore file (core.excludesFile), so the two'
  echo '# source files below are merged into this one.'
  echo '#'
  echo "#   shared, tracked by git : ${SHARED}"
  echo "#   this machine only      : ${LOCAL}"
  echo '#'
  echo '# HOW TO UPDATE'
  echo '#   1. edit whichever of the two files above you want to change'
  echo "#   2. run: ${DOTFILES_DIR}/gitignore.sh"
  echo '#      (./deploy.sh and ./install.sh run it for you)'
  echo '#'
  echo "# generated: $(date '+%Y-%m-%d %H:%M:%S')"
  echo '# ============================================================================'
  echo
  echo "# ---------- shared: ${SHARED} ----------"
  cat "${SHARED}"
  echo
  echo "# ---------- this machine only: ${LOCAL} ----------"
  cat "${LOCAL}"
} > "${tmp}"

chmod 644 "${tmp}"
mv "${tmp}" "${DEST}"
trap - EXIT

echo "generated ${DEST}"
