#!/usr/bin/env bash
set -euo pipefail

# Fails if tracked files include disallowed binary artifacts that should remain
# outside source control in cloud-terminal workflows.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

DISALLOWED_REGEX='\.(png|jpg|jpeg|gif|ico|icns|apk|aab|ipa|xcarchive|dylib|dll|exe|so|tflite|onnx|pt|pb|weights)$'

tracked_binary_lines="$(git ls-files | rg -n "$DISALLOWED_REGEX" || true)"

if [[ -n "$tracked_binary_lines" ]]; then
  echo "[error] Disallowed tracked binary artifacts detected:"
  echo "$tracked_binary_lines"
  echo
  echo "Use ./tools/bootstrap/restore_flutter_binary_assets.sh to regenerate local platform binaries as needed."
  exit 3
fi

echo "[ok] No disallowed binary artifacts are tracked in git."
