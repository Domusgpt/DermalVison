# DermalVision AI Model Architecture

## Overview
DermalVision employs a hybrid AI strategy, combining on-device models for real-time guidance and cloud-based models for high-precision dermatological analysis.

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
- **Technology:** Heuristic + Sensor Fusion (or lightweight TFLite)
- **Purpose:** Assess lighting conditions (brightness, uniformity, color temperature).
- **Output:** Quality Score (0-100), Classification (Good/Poor/Too Dark/Glare).

## Cloud Models (Vertex AI Pipeline)

### 3. MedGemma 1.5 (Primary Classifier)
- **Model Type:** Fine-tuned Vision Transformer / LLM.
- **Dataset:** Aggregated clinical datasets (ISIC 2024, PAD-UFES-20, Custom Internal).
- **Task:** Multi-label classification of skin lesions.
- **Output:** Top-5 potential conditions with confidence scores.
- **Latency:** ~2-4 seconds.

### 4. Acne Severity Net (EfficientNet-B0)
- **Model Type:** CNN (EfficientNet-B0).
- **Dataset:** SLICE-3D + labeled acne severity images.
- **Task:** Quantify acne severity based on IGA scale (0-4) and lesion counting.
- **Output:**
  - Global Severity Score (0-4).
  - Localized lesion count (inflammatory vs. non-inflammatory).

### 5. Wrinkle Depth Estimator (U-Net)
- **Model Type:** Semantic Segmentation / Depth Estimation (U-Net variant).
- **Task:** Identify and measure wrinkle depth and length.
- **Output:** Density map and aggregate "Skin Age" score.

## Fairness & Ethics
- **Fitzpatrick Scale Evaluation:** All models are evaluated across Fitzpatrick skin types I-VI to ensure consistent performance (<5% variance in F1 score).
- **Bias Mitigation:** Training data is balanced or re-weighted for underrepresented skin tones.
- **Disclaimer:** All outputs are marked as "For informational purposes only; not a medical diagnosis."
