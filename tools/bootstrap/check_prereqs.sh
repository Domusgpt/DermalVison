#!/usr/bin/env bash
set -euo pipefail

# DermalVision prerequisite verifier.
# Supports globally installed CLIs and repo-local toolcache installs.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
TOOLCACHE="$ROOT_DIR/.toolcache"

resolve_cmd() {
  local cmd="$1"
  case "$cmd" in
    flutter)
      [[ -x "$TOOLCACHE/flutter/bin/flutter" ]] && { echo "$TOOLCACHE/flutter/bin/flutter"; return 0; }
      ;;
    dart)
      [[ -x "$TOOLCACHE/flutter/bin/dart" ]] && { echo "$TOOLCACHE/flutter/bin/dart"; return 0; }
      ;;
    gcloud)
      [[ -x "$TOOLCACHE/google-cloud-sdk/bin/gcloud" ]] && { echo "$TOOLCACHE/google-cloud-sdk/bin/gcloud"; return 0; }
      ;;
  esac

  if command -v "$cmd" >/dev/null 2>&1; then
    command -v "$cmd"
    return 0
  fi

  return 1
}

REQUIRED_CMDS=(flutter dart firebase gcloud node npm python3 pip)
OPTIONAL_CMDS=(java pod)
FAILED=0

printf '== DermalVision Environment Prerequisite Check ==\n'
for cmd in "${REQUIRED_CMDS[@]}"; do
  if path="$(resolve_cmd "$cmd")"; then
    version="$($path --version 2>/dev/null | head -n 1 || true)"
    printf '[OK] %s -> %s%s\n' "$cmd" "$path" "${version:+ - $version}"
  else
    printf '[MISSING] %s\n' "$cmd"
    FAILED=1
  fi
done

printf '\n'
for cmd in "${OPTIONAL_CMDS[@]}"; do
  if path="$(resolve_cmd "$cmd")"; then
    version="$($path --version 2>/dev/null | head -n 1 || true)"
    printf '[OK][optional] %s -> %s%s\n' "$cmd" "$path" "${version:+ - $version}"
  else
    printf '[MISSING][optional] %s\n' "$cmd"
  fi
done

printf '\n'
if [[ "$FAILED" -eq 1 ]]; then
  echo "One or more required tools are missing. Install prerequisites before Phase 0 implementation."
  exit 2
fi

echo "All required tools are available."
