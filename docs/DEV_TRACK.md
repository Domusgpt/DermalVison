# DermalVision Dev Track

## 2026-02-12 — Cloud terminal binary handling & repo hygiene hardening

### Objective
Resolve cloud-terminal limitations where binary files are not supported for reliable workflow/PR handling, while preserving reproducible project setup.

### Work completed
- Removed tracked Flutter-generated binary icon/splash assets from source control:
  - Android launcher PNGs (`mipmap-*/ic_launcher.png`)
  - iOS app icon and launch image PNGs
  - Web favicon and icon PNGs
- Added targeted ignore rules in `dermalvision/.gitignore` so these generated binaries are not re-committed accidentally.
- Added `tools/bootstrap/restore_flutter_binary_assets.sh` to regenerate all removed platform binaries on demand using `flutter create . --platforms android,ios,web`.
- Kept textual asset manifests/config files (e.g., `Contents.json`, `manifest.json`) versioned to preserve platform structure.

### Validation
- Confirmed binary files are no longer tracked by `git ls-files` filters.
- Confirmed ignore coverage for removed binary paths with `git check-ignore -v ...`.
- Confirmed project still analyzes/tests in cloud terminal after removal.

### Notes
- This is an intentional interim approach for cloud-terminal compatibility.
- For production branding assets, manage source artwork in a design repository/object storage and restore via CI/bootstrap pipeline.
