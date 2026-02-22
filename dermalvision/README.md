# DermalVision — The AI Skin Scope

![DermalVision Banner](https://placehold.co/1200x300/4F46E5/FFFFFF?text=DermalVision+AI)

> **Professional-grade skin monitoring and analysis powered by Vertex AI.**
> DermalVision brings clinical-grade skin analysis to your pocket, using advanced computer vision and LLMs to track changes, assess severity, and provide personalized guidance.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Auth%20%7C%20Firestore%20%7C%20Functions-orange.svg)](https://firebase.google.com)
[![Vertex AI](https://img.shields.io/badge/Vertex%20AI-MedGemma%20%2B%20Gemini-green.svg)](https://cloud.google.com/vertex-ai)
[![HIPAA](https://img.shields.io/badge/Compliance-HIPAA%20Ready-blue.svg)](SECURITY.md)
[![GDPR](https://img.shields.io/badge/Compliance-GDPR%20Ready-blue.svg)](SECURITY.md)
[![License](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)

---

## 💡 Why DermalVision?

Unlike generic symptom checkers, DermalVision combines **specialized dermatology models** (MedGemma) with **longitudinal tracking**.
- **Consistency:** AR overlays ensure every photo is comparable over time.
- **Privacy:** End-to-end encryption and PII redaction by default.
- **Actionable:** Not just a label—get severity scores (0-4), change metrics, and next steps via SkinShurpa.

---

## 🚀 Key Features

### 📸 Smart Capture System
- **AR Guidance:** Real-time overlays ensure consistent lighting, angle, and distance for every photo.
- **Ghost Image:** Overlay previous scans to align perfectly with historical data.
- **Lighting Analysis:** Instant feedback on ambient light quality to prevent poor scans.

### 🧠 Advanced AI Analysis
- **MedGemma Integration:** Powered by Google's specialized dermatology model for condition classification.
- **Acne & Wrinkle Scoring:** Custom models quantify severity (0-4 scale) and track progression.
- **Change Detection:** Pixel-level comparison highlights changes in size, color, or texture over time.

### 🤖 SkinShurpa Assistant
- **Context-Aware Chat:** Ask questions about specific spots or scans ("Is this mole changing?").
- **Proactive Guidance:** Receive personalized routine adjustments based on analysis trends.
- **Voice Interaction:** Hands-free mode for guiding you through full-body scans.

### ✨ Premium Experience
- **Depth UI:** Immersive 3D interface with "liquid glass" and "holographic" shader effects.
- **Privacy First:** All analysis happens on secure, HIPAA-compliant cloud infrastructure.
- **Cross-Platform:** Seamless experience on iOS and Android.

---

## 🛠️ Architecture

DermalVision follows a clean architecture pattern with Riverpod for state management.

```
lib/
├── features/           # Feature-based modular structure
│   ├── auth/           # Authentication & User Profile
│   ├── camera/         # Camera, AR, and Image Capture
│   ├── analysis/       # AI Pipeline & Results
│   ├── skin_shurpa/    # Chat Assistant (Gemini)
│   ├── body_map/       # Body Zone Tracking
│   └── subscription/   # RevenueCat Integration
├── core/               # Shared services (Network, Storage, Logger)
├── shared/             # Reusable UI components & Shaders
└── app/                # App-level config (Theme, Router)
```

See [PROJECT_SNAPSHOT_AND_ROADMAP.md](PROJECT_SNAPSHOT_AND_ROADMAP.md) for detailed architectural diagrams and development logs.

---

## 🔧 Getting Started

### Prerequisites
- Flutter SDK 3.24+
- Firebase CLI
- Google Cloud Project with Vertex AI enabled

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-org/dermalvision.git
   cd dermalvision
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure Environment:**
   - Create a `.env` file based on `.env.example`.
   - Ensure `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) are present.

4. **Run the app:**
   ```bash
   flutter run
   ```

### Troubleshooting Common Issues
- **Purple/Pink Screen:** Ensure your device supports OpenGL ES 3.0 for shaders. Check `SHADER_GUIDE.md`.
- **Auth Errors:** Verify SHA-1/SHA-256 fingerprints are added to Firebase Console for Android.
- **Camera Permission:** On iOS simulator, camera is not supported. Use a real device.

---

## 📚 Documentation

- [**API Reference**](docs/API.md): Cloud Functions, Auth flows, and Rate Limits.
- [**Data Model**](docs/DATA_MODEL.md): Firestore Schema, Indexing, and Retention.
- [**AI Models**](docs/ML_MODELS.md): Model Cards, Metrics, and Fairness Reports.
- [**Shader Guide**](docs/SHADER_GUIDE.md): Documentation for the custom GLSL shader system.
- [**MCP Server**](docs/MCP_SERVER.md): Guide for external AI agent integration.
- [**Security Policy**](SECURITY.md): HIPAA compliance and vulnerability reporting.

---

## 🛡️ Security

Security is paramount. DermalVision employs:
- **End-to-End Encryption** for data in transit.
- **Role-Based Access Control (RBAC)** via Firestore Security Rules.
- **PII Redaction** in logging and analytics.

See [SECURITY.md](SECURITY.md) for our vulnerability disclosure policy.

---

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on code style, testing, and pull requests.

---

Copyright © 2024 DermalVision Inc. All rights reserved.
