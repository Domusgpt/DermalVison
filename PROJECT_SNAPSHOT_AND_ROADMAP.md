# DermalVision — Project Snapshot & Roadmap
**Date**: 2026-02-11
**Status**: Phase 4 (Premium UI) Integrated

---

## 1. Executive Summary
DermalVision is a cross-platform mobile application for AI-powered skin monitoring. We have successfully implemented the **Foundation (Phase 0)**, **Camera System (Phase 1)**, **Analysis Pipeline (Phase 2)**, **SkinShurpa AI (Phase 3)**, and **Premium UI (Phase 4)**. The application features a distinctive 3D depth-scroll interface with shader effects, alongside its core monitoring capabilities.

Key accomplishments:
- **Flutter Framework**: Robust architecture using Riverpod (state), GoRouter (navigation), and Freezed (immutable models).
- **Backend**: Firebase Auth, Firestore, Storage, Cloud Functions (TypeScript), and Vertex AI (Gemini).
- **Camera**: Custom `CameraService` with AR overlays for guidance and lighting assessment.
- **Analysis**: End-to-end flow from capture -> upload -> cloud processing -> result display.
- **AI Assistant**: SkinShurpa chat interface integrated with Gemini 1.5 Flash.
- **UI/UX**: Custom `DepthScrollView` with "water-around-sphere" physics and GLSL shader effects (`iridescent`, `liquid_glass`).

---

## 2. Implemented Features

### Phase 0: Foundation
- **Authentication**: Email/Password Sign-up & Login with Firebase Auth.
- **Onboarding**: Skin type quiz and goal selection with Firestore persistence.
- **Navigation**: Deep-link capable routing with Auth and Onboarding guards.
- **Theme**: Premium "DermalTheme" with custom color tokens.

### Phase 1: Camera System
- **Body Map**: `BodyZone` model and selector UI for tracking specific skin areas.
- **Camera Screen**: Custom UI with:
  - **AR Guide Overlay**: Visual box and readiness indicator.
  - **Lighting Indicator**: Real-time feedback (Good/Too Dark) based on image luminance.
  - **Ghost Image**: Overlay of previous photos (infrastructure ready).
- **Capture Logic**: Securely captures, saves to local storage, uploads to Firebase Storage, and creates `MonitoringSession` records.

### Phase 2: AI Analysis Pipeline
- **Cloud Infrastructure**: `analysisOrchestrator` (mocked in Cloud Functions) triggers on image upload.
- **Result Processing**: Simulates AI analysis (acne severity, overall health) and updates Firestore.
- **UI Feedback**: `AnalysisWaitingScreen` listens for analysis completion.
- **Results Display**: `AnalysisResultScreen` with:
  - **Skin Heatmap**: Visual overlay of problem areas.
  - **Metric Cards**: Detailed scoring (e.g., "Acne: Mild", "Health: 88/100").
  - **Trend Charts**: Visualization of progress over time.

### Phase 3: SkinShurpa AI
- **Conversational Engine**: Integrated `firebase_vertexai` (Gemini 1.5 Flash).
- **Chat UI**: `ChatScreen` with message bubbles and typing indicators.
- **Context Awareness**: System prompt injection (infrastructure ready).
- **Integration**: Access from Home Screen via FAB.

### Phase 4: Premium UI
- **Depth Scroll**: `DepthScrollView` widget implementing 3D transforms (`Matrix4`) for a "vertical conveyor belt" effect.
- **Shaders**: `ShaderCard` widget applying GLSL fragment shaders (`iridescent.frag`) to UI elements.
- **Motion Design**: Fluid animations and reactive touch effects.

---

## 3. Architecture & File Manifest

### Directory Structure (`lib/`)
```
lib/
├── app/
│   ├── router.dart            # GoRouter configuration
│   └── theme/                 # DermalTheme & ColorTokens
├── core/
│   └── services/              # Camera, ML, Lighting services
├── features/
│   ├── auth/                  # Login, Signup, AuthRepo
│   ├── body_map/              # BodyZone model, Repo, Selector UI
│   ├── camera/                # CameraScreen, Overlays (Guide, Ghost, Lighting)
│   ├── monitoring/            # MonitoringSession, Repo (Capture flow)
│   ├── analysis/              # AnalysisResult, Repo, UI (Result, Waiting)
│   ├── skin_shurpa/           # ChatMessage, ChatRepo, GeminiService, ChatScreen
│   ├── onboarding/            # OnboardingScreen (Quiz)
│   ├── profile/               # UserProfile model, Repo
│   ├── home/                  # HomeScreen
│   └── subscription/          # Subscription provider stub
├── shared/
│   ├── widgets/               # ShaderCard, DepthScrollView
│   └── shaders/               # GLSL fragment shaders
└── main.dart                  # App Entry Point
```

### Key Dependencies & Resolutions
- **UI/Shaders**: `flutter` (includes `FragmentProgram`).
- **AI**: `firebase_vertexai`.
- **State Management**: `flutter_riverpod` + `riverpod_generator` (pinned to `^2.4.0` to resolve `analyzer` conflicts).
- **Data Models**: `freezed` (pinned to `^2.5.2`) + `json_serializable`.
- **Network**: `retrofit` (pinned to `4.4.1`) + `dio`.
- **ML/Camera**: `camera`, `google_mlkit_face_mesh_detection`, `tflite_flutter`.
- **Platform**:
  - **Android**: `minSdkVersion 24`, `noCompress "tflite"`.
  - **iOS**: Permissions for Camera, Microphone, Photo Library added to `Info.plist`.

---

## 4. Development Log (Dev Comments)

- **Dependency Hell**: We encountered significant conflicts between `retrofit_generator` (requiring newer `analyzer`) and `freezed`/`riverpod_generator`.
  - *Resolution*: Downgraded `riverpod_generator` to `^2.4.0`, `retrofit_generator` to `^8.2.1`, and pinned `freezed` to `^2.5.2` to find a compatible set of `analyzer` and `source_gen` versions.
- **Platform Specifics**: The `google_mlkit` dependencies required increasing Android `minSdkVersion` to 24.
- **Logic Fixes**:
  - ADDED: Profile creation step in `SignupScreen` to prevent "missing profile" errors in Onboarding.
  - ADDED: Router guard logic to force Onboarding if profile is incomplete.
  - ADDED: `AnalysisWaitingScreen` to handle the asynchronous nature of Cloud Function analysis.

---

## 5. Future Roadmap

### Phase 5: Subscription System
- **Goal**: Monetization via RevenueCat.
- **Tasks**:
  - Integrate `purchases_flutter`.
  - Implement Paywall UI.
  - Gate advanced analysis features.

### Phase 6: Notifications & Scheduling
- **Goal**: Re-engagement.
- **Tasks**:
  - Implement Local Notifications for reminders.
  - Integrate FCM for "Analysis Complete" pushes.

### Phase 7: Advanced Features
- **Goal**: Time-lapse and advanced metrics.
- **Tasks**:
  - Time-lapse video generation.
  - Weather/Environmental data integration.

### Phase 8: Launch Prep
- **Goal**: Store submission.
- **Tasks**:
  - App Store / Play Store assets.
  - Legal compliance (Privacy Policy).
  - Final QA.

---

*End of Snapshot.*
