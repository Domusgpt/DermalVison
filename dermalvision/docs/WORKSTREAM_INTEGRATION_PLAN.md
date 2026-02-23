# DermalVision Workstream Integration Plan

## Purpose
Align newly imported launch/compliance documentation with the implementation work already present on branch `work`, then continue delivery in small verifiable increments.

## Imported baseline docs
- `dermalvision/PROJECT_STATUS_AND_LAUNCH_PLAN.md`
- `dermalvision/SECURITY.md`
- `dermalvision/CONTRIBUTING.md`
- `dermalvision/PRIVACY_POLICY.md`
- `dermalvision/TERMS_OF_SERVICE.md`
- `dermalvision/docs/API.md`
- `dermalvision/docs/DATA_MODEL.md`
- `dermalvision/docs/ML_MODELS.md`
- `dermalvision/docs/MCP_SERVER.md`
- `dermalvision/docs/SHADER_GUIDE.md`
- `dermalvision/docs/DOCUMENTATION_AUDIT.md`

## Gap map: code vs docs

### A) Notification and scheduling reliability
**Code exists now**
- `lib/core/services/notification_service.dart`
- `lib/features/monitoring/domain/scheduling_policy.dart`
- `lib/features/monitoring/domain/scheduling_provider.dart`
- `lib/app/app_startup_provider.dart`
- `test/scheduling_policy_test.dart`

**Doc actions**
1. Add deterministic ID strategy + collision handling notes to `docs/API.md` and `docs/DATA_MODEL.md`.
2. Add startup lifecycle notes (`appStartupProvider`, scheduling manager keep-alive) to `PROJECT_STATUS_AND_LAUNCH_PLAN.md` under runtime architecture.
3. Add explicit operational runbook: permissions, timezone assumptions, and background behavior in `SECURITY.md`/ops section.

### B) Camera overlays and UX guidance
**Code exists now**
- `lib/features/camera/presentation/widgets/guide_overlay.dart`
- `lib/features/camera/presentation/widgets/ghost_image_overlay.dart`
- `lib/features/camera/presentation/widgets/lighting_indicator.dart`
- `test/camera_widgets_test.dart`

**Doc actions**
1. Add behavior specs for readiness bar, ghost opacity, and lighting thresholds to `docs/ML_MODELS.md` and `docs/SHADER_GUIDE.md` (if UI rendering constraints are relevant).
2. Add acceptance criteria and screenshot matrix for camera UX in `PROJECT_STATUS_AND_LAUNCH_PLAN.md`.

### C) Project operations and quality gates
**Code/docs exist now**
- `scripts/preflight.sh`
- `Makefile`

**Doc actions**
1. Link `scripts/preflight.sh` from `CONTRIBUTING.md`.
2. Define required pre-merge checks (`flutter test`, `flutter analyze`, generated files up to date).
3. Add release gate checklist for docs + tests + legal consistency.

## Execution sequence (recommended)
1. **Doc parity pass**: update imported docs to reflect current code reality.
2. **Validation pass**: add/refresh tests where imported docs claim behavior not currently tested.
3. **Launch readiness pass**: tighten security/legal and production config sections.
4. **Release pass**: produce store assets, launch checklist evidence, and final audit.

## Definition of done
- Imported docs no longer conflict with actual source code.
- Every critical claim has either test evidence or an explicit TODO owner.
- Preflight and CI checks pass cleanly.
- Launch checklist references concrete files and commands in this repo.
