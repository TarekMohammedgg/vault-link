#!/usr/bin/env bash
set -euo pipefail

repo="https://github.com/TarekMohammedgg/vault-link.git"
dest="${VAULT_LINK_SRC:-${XDG_DATA_HOME:-$HOME/.local/share}/vault-link}"

if ! command -v git >/dev/null 2>&1; then
  printf '[vault-link] Git is required.\n' >&2
  exit 1
fi

if [ -d "$dest/.git" ]; then
  git -C "$dest" pull --ff-only
elif [ -e "$dest" ]; then
  printf '[vault-link] %s exists and is not a vault-link checkout.\n' "$dest" >&2
  exit 1
else
  mkdir -p "$(dirname "$dest")"
  git clone --depth 1 "$repo" "$dest"
fi

bash "$dest/bin/vault-link" --install
