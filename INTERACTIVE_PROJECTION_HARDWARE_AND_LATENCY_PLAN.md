# Interactive Projection System: Hardware SKU + Latency & Model Plan

## Scope
This document covers:
1. Reference hardware BOM with costed SKU strategy (consumer vs enterprise).
2. End-to-end latency budget and model selection matrix for a projected-surface touch interaction product.

---

## 1) Reference Hardware BOM + Costed SKU Strategy

## Product family
- **SKU-A: Mobile Starter (phone-first, software-led)**
- **SKU-B: Clip-On Edge Module (mass market sweet spot)**
- **SKU-C: Enterprise Pro Module (classroom/collaboration/fleet)**

All figures below are rough-order-of-magnitude planning values intended for architecture and go-to-market planning.

### SKU-A: Mobile Starter (phone-first)
Goal: fastest validation and developer ecosystem growth with minimal dedicated hardware.

| Component | Reference | Est. Unit Cost (USD) |
|---|---|---:|
| Mobile app (iOS/Android) | Existing user phone hardware | 0 BOM |
| Optional clip accessory frame | Injection molded + mount | 3.50 |
| Optional active IR LED ring (USB-C powered) | Basic emitter + driver | 5.00 |
| Companion BLE trigger/button | nRF52 class module | 4.50 |
| Packaging + accessories | Box, cable, quick start | 2.00 |
| **Total accessory BOM** |  | **15.00** |

**Target pricing**
- Accessory-only: $49–$79
- App subscription add-on (advanced gesture profile + cloud analytics): $4–$9/month

**Strengths**
- Fastest route to user data and UX iteration.
- No custom compute board dependency.

**Risks**
- Camera variability and thermal limits across phones.
- Background app constraints and inconsistent latency.

---

### SKU-B: Clip-On Edge Module (recommended primary product)
Goal: self-contained, low-latency module attachable to most projectors.

| Component | Reference | Est. Unit Cost (USD) |
|---|---|---:|
| Main SoC + NPU | Mid-range edge AI SoC (e.g., RK3588S class / Qualcomm IoT class) | 28.00 |
| LPDDR4/5 RAM | 4 GB | 10.00 |
| eMMC/UFS storage | 32 GB | 5.00 |
| RGB global shutter camera | 1080p, low motion blur | 14.00 |
| IR camera or ToF depth sensor | Short-range depth/contact aid | 16.00 |
| IR emitter/illumination | Structured assist/low-light robustness | 4.00 |
| Connectivity module | Wi-Fi 6 + BT 5.2 | 6.00 |
| USB-C PD + power stage | Power + HID path | 4.00 |
| USB controller/PHY | HID and firmware update modes | 2.00 |
| IMU | 6-axis orientation sensing | 1.20 |
| PCB + assembly | 6-layer board + SMT | 12.00 |
| Thermal solution | Heat spreader + pad | 2.20 |
| Enclosure + mount | Adjustable clip + lens alignment | 7.00 |
| QA + calibration station allocation | Factory calibration cost amortized | 4.00 |
| Packaging + accessories | Cable, mount shim, docs | 3.50 |
| **Total BOM** |  | **119.90** |

**Manufacturing economics (illustrative)**
- BOM: ~$120
- COGS with test/yield/logistics reserve: ~$150–$165
- MSRP target: $299–$399
- Gross margin target: 45%+ at scale

**Why SKU-B first for hardware scale**
- Controlled optics and compute produce stable latency and gesture quality.
- Works with USB HID for universal compatibility.
- Balanced ASP vs performance for education/SMB/prosumer.

---

### SKU-C: Enterprise Pro Module
Goal: premium robustness, manageability, and multi-user collaboration.

| Component | Reference | Est. Unit Cost (USD) |
|---|---|---:|
| Higher-tier SoC + stronger NPU | Enterprise-grade edge compute | 52.00 |
| RAM | 8 GB | 18.00 |
| Storage | 64 GB | 9.00 |
| Dual RGB cameras | Primary + side camera for occlusion resilience | 26.00 |
| ToF/depth module | Higher precision depth/contact estimation | 24.00 |
| Advanced IR subsystem | Better ambient rejection | 9.00 |
| Wi-Fi 6E + BT + optional Ethernet | Fleet and dense network support | 14.00 |
| Secure element/TPM | Device identity + attestation | 2.50 |
| Rich I/O (USB-C, HDMI passthrough optional) | Enterprise deployment flexibility | 10.00 |
| Chassis + thermal | Ruggedized housing | 12.00 |
| PCB + assembly | Higher complexity | 18.00 |
| Factory calibration + extended QA | Tighter reliability requirements | 8.00 |
| Packaging + accessories | Mounting kit + documentation | 5.00 |
| **Total BOM** |  | **207.50** |

**Pricing model**
- Hardware MSRP: $599–$899
- Annual software/fleet license: $99–$249/device

**Enterprise differentiators**
- Remote provisioning + policy control
- OTA staged rollout and rollback
- Multi-room health telemetry and uptime SLA insights

---

## SKU roadmap and commercialization sequence
1. **Start with SKU-A** for UX validation and dataset capture (8–12 weeks).
2. **Launch SKU-B** as core revenue product (6–9 months path to production).
3. **Add SKU-C** once enterprise features and reliability KPIs are proven.

## Non-recurring engineering (NRE) buckets to plan
- Optics calibration tooling
- Firmware and boot chain hardening
- HID certification/interoperability matrix
- Manufacturing test fixtures
- Fleet backend (if enterprise enabled)

---

## 2) End-to-End Latency Budget + Model Selection Matrix

## UX-driven latency targets
- **Premium touch feel**: 16–24 ms median, <35 ms p95
- **Acceptable touch feel**: 25–40 ms median, <55 ms p95
- **Usability floor**: <70 ms p95 for non-precision interaction

## End-to-end latency budget (SKU-B baseline)

| Stage | Target (ms) | Notes |
|---|---:|---|
| Sensor exposure + readout | 4.0 | Global shutter preferred to reduce blur artifacts |
| ISP pre-processing | 2.0 | Denoise and normalization |
| Hand/finger inference | 5.5 | Quantized detector + keypoint head on NPU |
| Contact/hover inference fusion | 2.5 | Depth + motion + temporal classifier |
| Gesture state machine | 1.0 | Deterministic transition logic |
| Coordinate mapping and smoothing | 0.8 | Homography + adaptive filter |
| Event packaging (HID/BLE/Wi-Fi) | 0.8 | HID report generation |
| Transport + host stack | 3.5 | USB usually lower, BLE variable |
| UI response onset (host-side) | 5.0 | OS/app dependent |
| **Total target** | **25.1 ms** | Median target for SKU-B |

## p95 guard-band plan
- Keep perception pipeline deterministic and fixed-frequency.
- Reserve ~8–12 ms jitter headroom across transport + host stack.
- Degrade gracefully: pointer mode fallback when contact confidence is low.

---

## Model selection matrix (on-device)

| Function | Candidate approach | Why it fits | Compute profile | Product recommendation |
|---|---|---|---|---|
| Hand presence / ROI | Tiny CNN detector (MobileNet/YOLO-nano) | Fast ROI pruning | Very low | Use in all SKUs |
| Fingertip/keypoint tracking | Lightweight keypoint head | Stable spatial precision | Low | Use in all SKUs |
| Contact classification | Hybrid: depth delta + compact MLP/CNN | Better hover/contact separation | Low | Strongly recommended for B/C |
| Gesture recognition | Temporal ConvNet or compact transformer-lite | Robust sequence understanding | Medium | Optional in A, default in B/C |
| Surface mapping | Geometric homography + periodic recalibration | Deterministic and explainable | Very low | Mandatory in all SKUs |
| Drift correction | Kalman/OneEuro + confidence gating | Smooth without lag inflation | Very low | Mandatory in all SKUs |

## Why not CNN-only
A pure RGB CNN stack can work in constrained lighting, but product-grade reliability requires a **hybrid architecture**:
- geometric calibration for deterministic mapping,
- depth/IR for contact confidence,
- temporal modeling for gesture semantics,
- rule-based safety rails for edge cases.

---

## Hardware-to-model fit table

| SKU | Preferred model stack | Precision mode | Notes |
|---|---|---|---|
| A (Phone-first) | Tiny detector + keypoint + rule-based gestures | INT8 / mobile NN API | Use cloud-assisted model updates |
| B (Clip-on) | Detector + keypoint + contact fusion + TCN | INT8/NPU | Best latency/reliability balance |
| C (Enterprise) | Multi-camera fusion + richer temporal model | Mixed INT8/FP16 | Better occlusion handling and analytics |

---

## Validation KPIs for pilot and scale
- Tap detection F1 (per surface and lighting condition)
- Swipe direction accuracy
- False touch rate per 10 minutes
- End-to-end latency p50/p95
- Recalibration frequency and mean recovery time
- User-perceived smoothness score (subjective MOS)

Suggested gates:
- Pilot gate: p95 latency <55 ms, false touch <2/10 min
- Production gate: p95 latency <35 ms, false touch <1/10 min

---

## Engineering execution checklist (next 6–10 weeks)
1. Build capture rig and calibration harness across 5+ surface types.
2. Implement deterministic latency telemetry in every pipeline stage.
3. Benchmark USB HID vs BLE HID transport paths.
4. Train and quantize fingertip + contact models for on-device inference.
5. Run closed pilot with KPI dashboard and per-environment tuning profiles.

