# DermalVision Project Kickoff Operations (Session-Ready)

This document makes the project execution-ready for collaborative work before feature coding.

## 1) Development Workflow Baseline
- Use `make preflight` before opening or merging any implementation PR.
- Use small branch-scoped tasks with clear acceptance criteria.
- Require `flutter analyze` + `flutter test` passing before merge.

## 2) Environments and Tooling
- Root bootstrap script: `./setup_env.sh`
- Full validation pipeline: `./scripts/preflight.sh`
- Repeatable shortcuts: `Makefile`

Standard command flow:
1. `make setup`
2. `make preflight`
3. Develop feature branch
4. `make ci`

## 3) Operating Model for the Interactive Projection Initiative
Track work in five parallel lanes:
1. **Hardware lane**: optics, sensor module, enclosure, thermal.
2. **Perception lane**: fingertip, contact inference, gesture models.
3. **Systems lane**: calibration, latency instrumentation, HID transport.
4. **Mobile/Desktop lane**: pairing, configuration UX, firmware updater.
5. **Platform lane**: telemetry, OTA orchestration, fleet management.

## 4) Weekly Cadence (recommended)
- **Monday**: architecture + KPI review (30 min)
- **Wednesday**: integration checkpoint and latency dashboard review
- **Friday**: demo + risk burndown

## 5) KPI Dashboard (minimum set)
- End-to-end latency (p50/p95)
- False touch rate per 10 min
- Tap/swipe accuracy by lighting condition
- Calibration drift and recovery time
- Crash-free sessions

## 6) Risk Register Starter
- Lighting variance causing detection instability
- Surface reflectivity causing false positives
- BLE latency jitter impacting gesture confidence
- Device thermal throttling under sustained inference
- Calibration drift after projector movement

## 7) Definition of Ready (for any implementation task)
- Problem statement and user-facing outcome
- Input/output contract documented
- Test strategy defined (unit/integration/manual)
- Performance budget impact estimated
- Rollback/fallback behavior identified

## 8) Definition of Done (for any implementation task)
- Acceptance criteria met
- Static analysis + tests passing
- Instrumentation/logging added where needed
- Documentation updated
- Demo artifact produced (video/screenshot when UI is affected)

