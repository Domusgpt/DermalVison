# Projector Fork Spin-off Guide

## Goal
Create a clean projector-focused product fork while preserving DermalVision as the primary skin-monitoring product stream.

## Recommended repository strategy
1. Fork `Domusgpt/DermalVison` into a new repo (example: `Domusgpt/ProjectorCanvasOS`).
2. Keep the initial commit history intact for traceability.
3. Create long-lived branches:
   - `main` (stable release)
   - `develop` (integration)
   - `feat/projection-runtime`
   - `feat/hardware-abstraction`
   - `feat/latency-telemetry`
4. Remove or archive non-projector-only flows once replacement modules are in place.

## Initial technical carve-out
- Keep and adapt:
  - shader and interaction rendering infrastructure
  - camera/vision abstractions
  - notification/analytics plumbing where useful
- Replace/refactor:
  - skin-specific models, terminology, and UX text
  - medical/compliance/legal copy not applicable to projector use-cases

## 30-60-90 plan
### 0-30 days
- Define projection domain model + interaction primitives.
- Build calibration pipeline and latency instrumentation.
- Establish platform adapters (USB HID/BLE/Wi-Fi).

### 30-60 days
- Implement MVP interaction stack (tap, drag, swipe).
- Add per-environment profiles and diagnostics panel.
- Run pilot tests with KPI capture.

### 60-90 days
- Harden reliability, OTA, and fleet telemetry.
- Add enterprise controls and policy management.
- Prepare commercialization docs and deployment playbooks.

## Prompt template for the spin-off agent
Use this prompt in a new agent session for the fork:

"You are working in a forked projector-focused repo derived from DermalVision.
Your mission is to convert the product from skin-monitoring to interactive projection input systems.
Preserve useful architecture (Riverpod modularity, service boundaries, test harnesses), but remove or rename domain-specific skin/medical workflows.
Implement work in small verifiable PRs with:
1) architecture note,
2) code + tests,
3) latency KPI measurement updates,
4) migration notes.
Always run formatting, static analysis, and tests before commit.
When UI changes are made, include screenshot evidence and annotate the scenario shown.
Do not leave generated code stale.
Prioritize deterministic latency, calibration correctness, and hardware abstraction stability over feature breadth." 

## Operational instructions for spin-off
1. Create repo and set remote:
   - `git remote rename origin upstream`
   - `git remote add origin <new-fork-url>`
2. Create baseline branch:
   - `git checkout -b projector/bootstrap`
3. First cleanup commit:
   - domain glossary rename plan
   - module ownership map
   - deprecation list for skin-specific flows
4. Add CI gates immediately:
   - format, analyze, test, docs lint
5. Start iterative PR sequence:
   - PR1 architecture + glossary
   - PR2 calibration + coordinate mapping service
   - PR3 interaction state machine + latency telemetry
   - PR4 hardware adapters + pilot harness
