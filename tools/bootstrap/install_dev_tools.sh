#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
TOOLCACHE="$ROOT_DIR/.toolcache"
mkdir -p "$TOOLCACHE"

install_flutter() {
  if [[ -x "$TOOLCACHE/flutter/bin/flutter" ]]; then
    echo "[skip] flutter already installed in toolcache"
    return
  fi

  local archive="/tmp/flutter.tar.xz"
  local url="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.5-stable.tar.xz"
  echo "[install] flutter from $url"
  curl -L -o "$archive" "$url"
  tar -C "$TOOLCACHE" -xf "$archive"
  git config --global --add safe.directory "$TOOLCACHE/flutter" || true
}

install_gcloud() {
  if [[ -x "$TOOLCACHE/google-cloud-sdk/bin/gcloud" ]]; then
    echo "[skip] gcloud already installed in toolcache"
    return
  fi

  local archive="/tmp/gcloud.tar.gz"
  local url="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-515.0.0-linux-x86_64.tar.gz"
  echo "[install] gcloud from $url"
  curl -L -o "$archive" "$url"
  tar -C "$TOOLCACHE" -xzf "$archive"
}

install_firebase() {
  if command -v firebase >/dev/null 2>&1; then
    echo "[skip] firebase already available globally"
    return
  fi

  if ! command -v npm >/dev/null 2>&1; then
    echo "[error] npm is required to install firebase-tools"
    exit 1
  fi

  echo "[install] firebase-tools via npm"
  npm install -g firebase-tools
}

install_flutter
install_gcloud
install_firebase

echo
echo "Add these to PATH when working in this repo:"
echo "  export PATH=$TOOLCACHE/flutter/bin:$TOOLCACHE/google-cloud-sdk/bin:\$PATH"
