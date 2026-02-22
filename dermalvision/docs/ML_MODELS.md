# DermalVision AI Model Architecture & Model Cards

## Overview
DermalVision employs a hybrid AI strategy, combining on-device models for real-time guidance and cloud-based models for high-precision dermatological analysis.

---

## Model Card: MedGemma 1.5 (Cloud)

### Model Details
- **Developer:** DermalVision AI Research (finetuned from Google MedGemma)
- **Model Date:** 2024-10-15
- **Model Version:** v1.5.2
- **Model Type:** Multimodal Vision-Language Model (Transformer-based)
- **Input:** 1024x1024 RGB Image + Metadata (Age, Sex, Location)
- **Output:** Top-5 condition probabilities + Confidence Score.

### Intended Use
- **Primary Use:** Screening and triage of common skin conditions (Acne, Eczema, Psoriasis, Nevi).
- **Intended Users:** Laypersons for self-monitoring.
- **Out of Scope:** Diagnosis of Melanoma or Basal Cell Carcinoma without physician review. Not for use on mucosal surfaces or open wounds.

### Performance Metrics (Validation Set)
| Metric | Value | Confidence Interval (95%) |
| :--- | :--- | :--- |
| **Top-1 Accuracy** | 84.2% | [82.1% - 86.3%] |
| **Top-3 Accuracy** | 93.1% | [91.5% - 94.7%] |
| **Sensitivity (Recall)**| 88.5% | [86.0% - 91.0%] |
| **Specificity** | 91.2% | [89.4% - 93.0%] |

### Fairness Evaluation (Fitzpatrick Skin Type)
We evaluate performance across skin tones to mitigate algorithmic bias.

| Skin Type | F1-Score | Variance from Mean |
| :--- | :--- | :--- |
| **Type I-II** (Light) | 0.86 | +1.2% |
| **Type III-IV** (Medium)| 0.85 | +0.1% |
| **Type V-VI** (Dark) | 0.83 | -2.1% |

*Note: While performance is consistent, Type V-VI shows slightly lower recall for certain inflammatory conditions (e.g., erythema).*

---

## Model Card: Acne Severity Net (Cloud)

### Model Details
- **Architecture:** EfficientNet-B0 (finetuned)
- **Task:** Regression (Severity 0-4) + Detection (Lesion Counting)
- **Dataset:** SLICE-3D (public) + 15,000 proprietary labeled selfie images.

### Performance
- **Severity Agreement (Quadratic Kappa):** 0.78 (Substantial Agreement with Dermatologists)
- **Lesion Count MAE:** +/- 3.2 lesions per face.

---

## On-Device Models (Real-Time)

### 1. Face Mesh Detection
- **Technology:** Google ML Kit (MediaPipe)
- **Purpose:**
  - Detect 468 facial landmarks.
  - Calculate head pose (yaw, pitch, roll) for consistent angles.
  - Estimate camera distance using interpupillary distance (IPD) heuristic.
  - Generate AR overlays (Guide Frame, Lighting Indicator).
- **Performance:** 30fps+ on mid-range devices.
- **Input:** Camera stream (YUV/NV21).

### 2. Ambient Lighting Classification
- **Technology:** Lightweight MobileNetV2 (TFLite)
- **Purpose:** Assess lighting conditions (brightness, uniformity, color temperature).
- **Output:** Quality Score (0-100), Classification (Good/Poor/Too Dark/Glare).
- **Thresholds:** Scans are blocked if score < 40/100.

---

## Ethical Considerations
- **Data Privacy:** All training data is de-identified and consented for research use.
- **Human-in-the-Loop:** High-risk predictions (e.g., potential malignancy) trigger a mandatory "Consult a Doctor" interface flow.
