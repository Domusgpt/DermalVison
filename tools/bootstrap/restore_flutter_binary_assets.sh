#!/usr/bin/env bash
set -euo pipefail

# Regenerates Flutter platform binary asset defaults that are intentionally
# excluded from this repository in cloud-terminal workflows.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
APP_DIR="$ROOT_DIR/dermalvision"

if [[ ! -d "$APP_DIR" ]]; then
  echo "[error] Missing app directory: $APP_DIR"
  exit 1
fi

if ! command -v flutter >/dev/null 2>&1; then
  if [[ -x "$ROOT_DIR/.toolcache/flutter/bin/flutter" ]]; then
    export PATH="$ROOT_DIR/.toolcache/flutter/bin:$PATH"
  fi
fi

if ! command -v flutter >/dev/null 2>&1; then
  echo "[error] flutter not found. Run ./tools/bootstrap/install_dev_tools.sh first."
  exit 1
fi

cd "$APP_DIR"
flutter create . --platforms android,ios,web

echo "[ok] Restored default Flutter binary icon/splash web assets for android/ios/web."
