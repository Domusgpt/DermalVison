#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="$ROOT_DIR/dermalvision"

if ! command -v flutter >/dev/null 2>&1 && [[ -x "$HOME/flutter/bin/flutter" ]]; then
  export PATH="$HOME/flutter/bin:$PATH"
fi

require_cmd() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    printf "[OK] %s found: %s\n" "$cmd" "$(command -v "$cmd")"
  else
    printf "[ERR] %s is not installed.\n" "$cmd"
    return 1
  fi
}

echo "=== DermalVision Preflight ==="

require_cmd git
require_cmd bash
require_cmd flutter
require_cmd dart

if [[ ! -d "$APP_DIR" ]]; then
  echo "[ERR] Expected app directory not found: $APP_DIR"
  exit 1
fi

echo "[OK] App directory found: $APP_DIR"

pushd "$APP_DIR" >/dev/null

echo "\n--- Tool Versions ---"
flutter --version

echo "\n--- Flutter Doctor ---"
flutter doctor -v || true

echo "\n--- Dependency Resolution ---"
flutter pub get

echo "\n--- Code Generation Check ---"
dart run build_runner build --delete-conflicting-outputs

echo "\n--- Static Analysis ---"
flutter analyze

echo "\n--- Unit/Widget Tests ---"
flutter test

popd >/dev/null

echo "=== Preflight Complete ==="
