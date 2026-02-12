# DermalVision — Development Track & System Architecture

> **"The AI Skin Scope"**
> Version: 0.1.0-draft | Last Updated: 2026-02-11

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Product Vision & Scope](#2-product-vision--scope)
3. [Target Demographics & Use Cases](#3-target-demographics--use-cases)
4. [Feature Taxonomy — Full Capability Map](#4-feature-taxonomy--full-capability-map)
5. [System Architecture](#5-system-architecture)
6. [AI/ML Pipeline Architecture](#6-aiml-pipeline-architecture)
7. [Camera & Guided Photography System](#7-camera--guided-photography-system)
8. [SkinShurpa — AI Assistant Architecture](#8-skinshurpa--ai-assistant-architecture)
9. [UI/UX Architecture — Z-Axis Depth System](#9-uiux-architecture--z-axis-depth-system)
10. [Shader & Motion Design System](#10-shader--motion-design-system)
11. [Color System & Visual Identity](#11-color-system--visual-identity)
12. [Push Notifications & Scheduling](#12-push-notifications--scheduling)
13. [Subscription & Monetization Model](#13-subscription--monetization-model)
14. [Data Model & Storage Architecture](#14-data-model--storage-architecture)
15. [Security, Privacy & Regulatory Compliance](#15-security-privacy--regulatory-compliance)
16. [Agent, MCP & Extension Architecture](#16-agent-mcp--extension-architecture)
17. [Telemetry & Observability](#17-telemetry--observability)
18. [CLI & Developer Tooling](#18-cli--developer-tooling)
19. [Phased Development Roadmap](#19-phased-development-roadmap)
20. [Testing Strategy](#20-testing-strategy)
21. [Technology Stack Summary](#21-technology-stack-summary)
22. [Risk Matrix & Mitigations](#22-risk-matrix--mitigations)

---

## 1. Executive Summary

DermalVision is a cross-platform mobile application that uses computer vision and AI to help users monitor, track, and understand their skin health over time. The app serves all demographics — men, women, teens, and seniors — with a camera-based system that guides consistent photography, performs AI-powered skin analysis, and provides personalized guidance through an AI assistant called **SkinShurpa**.

The application is built on **Flutter** (cross-platform frontend), **Firebase** (auth, database, storage, messaging), and **Google Cloud** (AI/ML inference, image processing pipelines). It features a distinctive **Z-axis depth scrolling UI** with reactive shader effects, live camera overlays, and a premium visual design language inspired by deep teal-to-amber gradient palettes with iridescent accent tones.

**Business Model**: Free tier with limited analysis credits + Premium subscription ($7.99–$14.99/mo) unlocking unlimited analysis, advanced AI features, SkinShurpa Pro, and time-lapse exports.

---

## 2. Product Vision & Scope

### Core Value Proposition
- **Track anything on your skin over time** with consistent, guided photography
- **AI-powered analysis** that detects changes, measures progress, and flags concerns
- **SkinShurpa AI assistant** that walks you through monitoring sessions and answers questions
- **Not a diagnostic tool** — a monitoring and awareness companion that knows when to recommend professional attention

### Design Principles
1. **Inclusive by Default** — UI, language, and AI models work across all skin tones (Fitzpatrick I–VI), genders, and ages
2. **Consistency is King** — The guided photography system is the technical moat; repeatable conditions produce meaningful comparison data
3. **Gentle Authority** — The app educates and informs without causing alarm; it escalates to "see a professional" when patterns warrant it
4. **Privacy First** — Skin images are deeply personal; encryption, local-first storage options, and transparent data policies are non-negotiable
5. **Delightful Depth** — The Z-axis UI creates a sense of exploring your own skin health journey, not scrolling through a medical chart

---

## 3. Target Demographics & Use Cases

### Primary Segments

| Segment | Key Use Cases | Priority |
|---------|--------------|----------|
| **Women 25–45** | Anti-aging tracking, product efficacy testing, acne cycle monitoring, melasma tracking, pregnancy skin changes | P0 |
| **Men 25–55** | Mole monitoring, sun damage tracking, shaving irritation, aging baseline | P0 |
| **Teens 13–24** | Acne management, skincare routine building, skin education | P0 |
| **Seniors 55+** | Mole/lesion monitoring, skin cancer awareness, medication skin effects | P1 |
| **Athletes** | UV exposure tracking, friction/chafing zones, sweat-related skin issues | P1 |
| **Post-Treatment** | Scar healing progress, laser treatment recovery, chemical peel tracking, tattoo healing | P1 |
| **Dermatology Patients** | Treatment compliance documentation, teledermatology image prep, flare tracking | P2 |
| **Skincare Enthusiasts** | Product A/B testing, routine optimization, seasonal adaptation | P1 |

### Novel Use Cases (Differentiation Opportunities)
- **Tattoo Lifecycle Monitoring** — Track fresh tattoo healing through all stages, monitor fading over years
- **Product Efficacy A/B Testing** — Apply different products to symmetric skin zones, track results
- **Environmental Skin Correlation** — Cross-reference skin changes with weather, UV index, humidity, pollution data
- **Cycle-Linked Skin Tracking** — For menstrual cycle users, correlate hormonal phases with skin condition patterns
- **Pre/Post Vacation Skin** — Track sun exposure recovery, tan progression and fade

---

## 4. Feature Taxonomy — Full Capability Map

### 4.1 Skin Condition Detection & Monitoring

#### Tier 1 — Core (MVP)
| Condition | Detection Type | AI Approach | Professional Referral Trigger |
|-----------|---------------|-------------|-------------------------------|
| **Acne/Pimples** | Count, severity grade, location mapping | Object detection + classification (comedonal, inflammatory, cystic, nodular) | Severe/cystic grade 4+, sudden widespread outbreak |
| **Moles** | ABCDE scoring (Asymmetry, Border, Color, Diameter, Evolution) | Segmentation + multi-criteria classification | Any ABCDE flag, rapid evolution between captures |
| **Wrinkles/Fine Lines** | Depth estimation, length mapping, density scoring | Semantic segmentation + depth regression | N/A (cosmetic) |
| **Hyperpigmentation** | Area measurement, color intensity delta tracking | Color space analysis (L*a*b*) + segmentation | Sudden spreading, irregular borders |
| **Scars** | Type classification, area tracking, color normalization progress | Multi-class segmentation (hypertrophic, keloid, atrophic, ice-pick, boxcar, rolling) | Keloid growth, infection signs |
| **Blackheads/Whiteheads** | Count, density mapping by zone | Fine-grained object detection | N/A (cosmetic) |

#### Tier 2 — Enhanced
| Condition | Detection Type | AI Approach | Professional Referral Trigger |
|-----------|---------------|-------------|-------------------------------|
| **Rosacea** | Severity grading, trigger correlation | Color analysis + texture classification | Ocular involvement, phymatous changes |
| **Eczema/Dermatitis** | Flare mapping, severity scoring (SCORAD-like) | Segmentation + severity regression | Large body surface area, facial involvement, infection signs |
| **Psoriasis** | Plaque detection, PASI-lite scoring | Texture + color segmentation | >10% BSA, joint pain correlation |
| **Sun Damage** | UV damage grading, age spot detection | Multi-spectral analysis simulation + classification | Rapidly changing lesions |
| **Dark Circles** | Severity grading, color intensity tracking | ROI segmentation + L*a*b* color analysis | N/A (cosmetic) |
| **Enlarged Pores** | Pore density mapping, size distribution | Texture analysis + statistical mapping | N/A (cosmetic) |
| **Skin Tags** | Count, size tracking | Object detection | Growth/color change |
| **Stretch Marks** | Length, width, color stage (red → silver) tracking | Line detection + color classification | N/A (cosmetic) |
| **Cellulite** | Grade classification (Nürnberger-Müller scale) | Texture analysis under controlled lighting | N/A (cosmetic) |

#### Tier 3 — Advanced / Novel
| Feature | Description | AI Approach |
|---------|-------------|-------------|
| **Skin Age Estimation** | Biological vs. chronological skin age using wrinkle density, texture uniformity, elasticity indicators, pore size, pigmentation evenness | Multi-task regression model |
| **Skin Barrier Health Index** | Composite score based on redness, dryness indicators, texture roughness, visible irritation | Multi-feature fusion model |
| **Collagen Density Estimation** | Proxy estimation via skin texture analysis, elasticity visual cues, fine line patterns | Deep regression with synthetic training |
| **UV Damage Prediction** | Given current skin state + location UV data, predict damage risk | Regression + external API fusion |
| **Seasonal Skin Profiling** | Track skin parameter shifts across seasons, build personalized seasonal care profiles | Time-series analysis on user data |
| **Product Efficacy Scoring** | Track specific metrics before/during/after product use, generate efficacy score | Before/after statistical comparison |
| **Skin Tone Mapping** | Fitzpatrick classification, undertone analysis (cool/warm/neutral), even-ness mapping | Color space classification |
| **Hydration Estimation** | Visual indicators of skin hydration (sheen, texture, fine line prominence) | Multi-feature visual regression |
| **Tan Progression Tracking** | L*a*b* color delta tracking for tanning/fading over time | Color space time-series analysis |

### 4.2 Monitoring & Photography Features
- **Guided Shot System** — AR overlays for distance, angle, and position matching
- **Lighting Environment Calibration** — Ambient light analysis, flash recommendation, color temperature normalization
- **Ghost Image Overlay** — Semi-transparent previous photo over live camera feed for position matching
- **Multi-Zone Body Mapping** — Full body zone system for organizing monitoring sites
- **Time-Lapse Generation** — Automated before/after and time-lapse video creation from monitoring series
- **Monitoring Session Scheduler** — Configurable intervals per monitoring zone (daily, weekly, monthly)
- **Comparison View** — Side-by-side, overlay, and slider comparison of images over time

### 4.3 SkinShurpa AI Assistant Features
- **Session Guide Mode** — Walks user through photo-taking process with voice and visual guidance
- **Analysis Walkthrough** — Explains what the AI detected, what changed since last session, what to watch
- **Question Answering** — General skin health questions, product ingredient analysis, routine recommendations
- **Professional Referral** — When patterns warrant concern, guides user on what to tell a dermatologist
- **Routine Builder** — Suggests monitoring schedules based on user goals and conditions
- **Education Mode** — Teaches users about skin biology, condition progression, prevention strategies

---

## 5. System Architecture

### 5.1 High-Level Architecture Diagram (Textual)

```
┌─────────────────────────────────────────────────────────────────────┐
│                        FLUTTER CLIENT                              │
│  ┌─────────┐  ┌──────────┐  ┌─────────────┐  ┌────────────────┐   │
│  │ Camera  │  │ Z-Axis   │  │ SkinShurpa  │  │ Notifications  │   │
│  │ + AR    │  │ Depth UI │  │ Chat UI     │  │ Scheduler      │   │
│  │ Overlay │  │ + Shaders│  │             │  │                │   │
│  └────┬────┘  └────┬─────┘  └──────┬──────┘  └───────┬────────┘   │
│       │            │               │                  │            │
│  ┌────┴────────────┴───────────────┴──────────────────┴────────┐   │
│  │              State Management (Riverpod)                    │   │
│  └────────────────────────┬────────────────────────────────────┘   │
│                           │                                        │
│  ┌────────────────────────┴────────────────────────────────────┐   │
│  │           On-Device ML (TFLite / MediaPipe)                 │   │
│  │  • Face mesh (distance/angle)  • Basic skin segmentation    │   │
│  │  • Lighting analysis           • Quick anomaly screening    │   │
│  └─────────────────────────────────────────────────────────────┘   │
└──────────────────────────────┬──────────────────────────────────────┘
                               │ Firebase SDK / REST
                               ▼
┌──────────────────────────────────────────────────────────────────────┐
│                        FIREBASE LAYER                                │
│  ┌──────────┐  ┌───────────┐  ┌──────────┐  ┌───────────────────┐   │
│  │ Firebase │  │ Cloud     │  │ Firebase │  │ Firebase          │   │
│  │ Auth     │  │ Firestore │  │ Storage  │  │ Cloud Messaging   │   │
│  └──────────┘  └───────────┘  └──────┬───┘  └───────────────────┘   │
│                                      │ Upload trigger               │
│  ┌───────────────────────────────────┴───────────────────────────┐   │
│  │              Cloud Functions (2nd gen / Cloud Run)             │   │
│  │  • Image preprocessing       • Analysis orchestration         │   │
│  │  • Thumbnail generation      • Notification dispatch          │   │
│  │  • Subscription validation   • SkinShurpa context builder     │   │
│  └──────────────────────────────┬────────────────────────────────┘   │
└─────────────────────────────────┬────────────────────────────────────┘
                                  │ gRPC / REST
                                  ▼
┌──────────────────────────────────────────────────────────────────────┐
│                      GOOGLE CLOUD AI LAYER                           │
│  ┌────────────────────┐  ┌───────────────────────────────────────┐   │
│  │ Vertex AI          │  │ MedGemma 1.5 (4B)                    │   │
│  │ Prediction         │  │ • Dermatology image classification    │   │
│  │ Endpoints          │  │ • Lesion assessment                   │   │
│  │                    │  │ • Multi-image longitudinal analysis   │   │
│  └────────────────────┘  └───────────────────────────────────────┘   │
│  ┌────────────────────┐  ┌───────────────────────────────────────┐   │
│  │ Custom AutoML      │  │ Gemini API (via Vertex AI)            │   │
│  │ Vision Models      │  │ • SkinShurpa conversational engine    │   │
│  │ • Acne grading     │  │ • Function calling for structured    │   │
│  │ • Wrinkle scoring  │  │   actions (schedule, analyze, etc.)   │   │
│  │ • Scar typing      │  │ • Vision-language for image Q&A      │   │
│  └────────────────────┘  └───────────────────────────────────────┘   │
│  ┌────────────────────┐  ┌───────────────────────────────────────┐   │
│  │ Cloud Vision API   │  │ BigQuery                              │   │
│  │ • Face detection   │  │ • Analytics warehouse                 │   │
│  │ • Safe search      │  │ • ML training data pipeline           │   │
│  │ • Label detection  │  │ • Telemetry aggregation               │   │
│  └────────────────────┘  └───────────────────────────────────────┘   │
└──────────────────────────────────────────────────────────────────────┘
```

### 5.2 Client Architecture (Flutter)

```
lib/
├── main.dart                          # App entry, Firebase init, provider scope
├── app/
│   ├── app.dart                       # MaterialApp with router
│   ├── router.dart                    # GoRouter configuration
│   └── theme/
│       ├── dermal_theme.dart          # Material 3 theme with custom color scheme
│       ├── color_tokens.dart          # Design token definitions
│       └── shader_theme.dart          # Shader configuration tokens
├── core/
│   ├── constants/                     # App-wide constants
│   ├── extensions/                    # Dart extensions
│   ├── utils/                         # Pure utility functions
│   ├── errors/                        # Error types and handlers
│   └── services/
│       ├── ml_service.dart            # On-device ML inference (TFLite)
│       ├── camera_service.dart        # Camera lifecycle management
│       ├── notification_service.dart  # Local + push notification handler
│       └── analytics_service.dart     # Telemetry event dispatcher
├── features/
│   ├── auth/
│   │   ├── data/                      # Auth repository, Firebase auth datasource
│   │   ├── domain/                    # Auth entities, use cases
│   │   └── presentation/             # Login, signup, onboarding screens
│   ├── camera/
│   │   ├── data/                      # Camera config, image processing
│   │   ├── domain/                    # Shot guidance logic, calibration
│   │   └── presentation/
│   │       ├── camera_screen.dart     # Main camera with AR overlay
│   │       ├── widgets/
│   │       │   ├── guide_overlay.dart         # Distance/angle/position guide
│   │       │   ├── ghost_image_overlay.dart   # Previous photo transparency
│   │       │   ├── lighting_indicator.dart    # Ambient light quality
│   │       │   └── zone_selector.dart         # Body zone picker
│   │       └── controllers/
│   │           └── camera_controller.dart     # Camera state + ML pipeline
│   ├── monitoring/
│   │   ├── data/                      # Monitoring session repository
│   │   ├── domain/                    # Session entities, scheduling logic
│   │   └── presentation/
│   │       ├── session_screen.dart    # Active monitoring session flow
│   │       ├── history_screen.dart    # Past sessions timeline
│   │       ├── comparison_screen.dart # Side-by-side / slider comparison
│   │       └── timelapse_screen.dart  # Generated time-lapse viewer
│   ├── analysis/
│   │   ├── data/                      # Analysis result repository, cloud API
│   │   ├── domain/                    # Analysis entities, scoring models
│   │   └── presentation/
│   │       ├── result_screen.dart     # Single analysis result detail
│   │       ├── trend_screen.dart      # Trend charts over time
│   │       └── widgets/
│   │           ├── skin_heatmap.dart   # Overlay heatmap on photo
│   │           ├── metric_card.dart    # Individual metric display
│   │           └── severity_gauge.dart # Visual severity indicator
│   ├── skin_shurpa/
│   │   ├── data/                      # Chat repository, Gemini API client
│   │   ├── domain/                    # Chat entities, function schemas
│   │   └── presentation/
│   │       ├── chat_screen.dart       # SkinShurpa chat interface
│   │       └── widgets/
│   │           ├── message_bubble.dart
│   │           ├── image_reference.dart    # In-chat image reference cards
│   │           └── action_card.dart        # Structured action suggestions
│   ├── profile/
│   │   ├── data/                      # User profile repository
│   │   ├── domain/                    # Profile entities, skin type
│   │   └── presentation/             # Profile, settings, skin type quiz
│   ├── subscription/
│   │   ├── data/                      # RevenueCat integration
│   │   ├── domain/                    # Subscription tiers, feature gates
│   │   └── presentation/             # Paywall, plan comparison
│   └── body_map/
│       ├── data/                      # Body zone definitions, mappings
│       ├── domain/                    # Zone entities, monitoring links
│       └── presentation/
│           ├── body_map_screen.dart   # Interactive body map
│           └── zone_detail_screen.dart # All monitoring for one zone
├── shared/
│   ├── widgets/
│   │   ├── depth_scroll_view.dart     # Z-axis depth scrolling widget
│   │   ├── shader_card.dart           # Card with reactive shader effect
│   │   ├── orbital_layout.dart        # Water-around-sphere card layout
│   │   ├── glass_morph_container.dart # Glassmorphism container
│   │   └── parallax_background.dart   # Background depth layer
│   └── shaders/
│       ├── iridescent.frag            # Holographic/iridescent effect
│       ├── liquid_glass.frag          # Liquid glass morphism
│       ├── reactive_touch.frag        # Touch-responsive ripple
│       ├── depth_blur.frag            # Depth-of-field blur
│       └── heat_overlay.frag          # Skin heatmap overlay shader
└── l10n/                              # Localization files
```

### 5.3 State Management — Riverpod Architecture

```
Provider Hierarchy:
├── authStateProvider (StreamProvider)        → Firebase auth state
├── userProfileProvider (AsyncNotifier)       → User profile + skin type
├── subscriptionProvider (AsyncNotifier)      → Current subscription tier
├── cameraControllerProvider (Notifier)       → Camera state + ML pipeline
├── activeSessionProvider (AsyncNotifier)     → Current monitoring session
├── analysisResultsProvider (AsyncNotifier)   → Analysis results cache
├── skinShurpaProvider (AsyncNotifier)        → Chat state + context
├── notificationScheduleProvider (Notifier)   → Scheduled reminders
├── bodyMapProvider (AsyncNotifier)           → Body zones + monitoring links
├── depthScrollProvider (Notifier)            → Z-axis scroll state
└── themeProvider (Notifier)                  → Dynamic theme state
```

---

## 6. AI/ML Pipeline Architecture

### 6.1 On-Device ML (Fast, Privacy-Preserving)

**Framework**: TensorFlow Lite via `tflite_flutter` + MediaPipe via `google_ml_kit`

| Task | Model | Size | Latency Target | Purpose |
|------|-------|------|----------------|---------|
| Face Detection | MediaPipe BlazeFace | ~1MB | <50ms | Camera guide — ensure face is in frame |
| Face Mesh (468 points) | MediaPipe FaceMesh | ~2MB | <80ms | Distance estimation, angle calculation, position matching |
| Skin Segmentation | Custom TFLite (UNet-MobileNetV3) | ~8MB | <150ms | Isolate skin regions for analysis |
| Lighting Assessment | Custom TFLite classifier | ~2MB | <30ms | Evaluate ambient light quality, recommend adjustments |
| Quick Anomaly Screen | Custom TFLite (EfficientNet-Lite) | ~15MB | <200ms | Fast pre-screen for concerning features before cloud analysis |

**On-Device ML Responsibilities**:
- Real-time camera guidance (distance, angle, position)
- Lighting quality assessment
- Skin region segmentation for ROI extraction
- Quick anomaly pre-screening (prioritizes cloud analysis queue)
- Offline basic analysis when no connectivity

### 6.2 Cloud ML Pipeline (Comprehensive Analysis)

```
Image Upload → Cloud Function Trigger
         │
         ▼
┌─────────────────────────────┐
│  PREPROCESSING PIPELINE     │
│  1. Validate image quality  │
│  2. EXIF extraction         │
│  3. Color normalization     │
│     (white balance, L*a*b*  │
│      standardization)       │
│  4. Skin region extraction  │
│  5. Thumbnail generation    │
│     (128px, 512px, 1024px)  │
│  6. Encryption at rest      │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────────────────────────────┐
│  ANALYSIS ORCHESTRATOR (Cloud Function)             │
│                                                      │
│  Parallel dispatch based on monitoring type:         │
│  ┌──────────────────────────────────────────────┐   │
│  │ MedGemma 1.5 (Vertex AI Endpoint)            │   │
│  │ • Lesion classification                       │   │
│  │ • ABCDE mole scoring                         │   │
│  │ • Dermatology-grade image interpretation      │   │
│  │ • Longitudinal change assessment              │   │
│  └──────────────────────────────────────────────┘   │
│  ┌──────────────────────────────────────────────┐   │
│  │ Custom AutoML Models (Vertex AI Endpoints)    │   │
│  │ • Acne severity grading (trained on ISIC +    │   │
│  │   custom dataset)                             │   │
│  │ • Wrinkle depth/density scoring               │   │
│  │ • Scar type classification                    │   │
│  │ • Pore density analysis                       │   │
│  │ • Skin age regression                         │   │
│  └──────────────────────────────────────────────┘   │
│  ┌──────────────────────────────────────────────┐   │
│  │ Image Comparison Engine (Cloud Run)           │   │
│  │ • Image registration / alignment              │   │
│  │ • Pixel-level delta computation               │   │
│  │ • Metric extraction (area, color, count)      │   │
│  │ • Change significance scoring                 │   │
│  │ • Time-series trend computation               │   │
│  └──────────────────────────────────────────────┘   │
└──────────────────────┬──────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────┐
│  RESULT AGGREGATOR                                   │
│  • Combine all model outputs                         │
│  • Compute composite scores                          │
│  • Determine referral triggers                       │
│  • Generate natural language summary                 │
│  • Store to Firestore (analysis_results collection)  │
│  • Trigger push notification with summary            │
└─────────────────────────────────────────────────────┘
```

### 6.3 Training Data Sources

| Source | Description | Size | Use |
|--------|------------|------|-----|
| **ISIC Archive** | International Skin Imaging Collaboration dermoscopy images | 400K+ images | Lesion classification, mole analysis |
| **SLICE-3D** | 3D total body photography crops (smartphone-comparable resolution) | 400K lesion crops | Primary training for mobile-captured images |
| **DERM12345** | Multi-source dermatoscopic dataset with 40 subclasses | Large-scale | Fine-grained classification |
| **HAM10000** | 10015 dermatoscopic images, 7 diagnostic categories | 10K images | Baseline benchmarking |
| **Fitzpatrick17k** | 16,577 clinical images with Fitzpatrick skin type labels | 17K images | Skin-tone fairness validation |
| **DermNet** | Clinical dermatology images, 600+ conditions | 23K+ images | Broad condition recognition |
| **MedGemma Foundation** | Google's medical foundation model pretrained on dermatology | N/A | Transfer learning base |
| **Custom Collected** | User-submitted (consented) real-world mobile photos | Growing | Domain adaptation fine-tuning |

### 6.4 Model Fairness & Bias Mitigation

- All models validated across **Fitzpatrick skin types I–VI**
- Separate performance metrics reported per skin tone bracket
- Training data balanced using stratified sampling + synthetic augmentation for underrepresented skin tones
- Ongoing fairness audits with diverse dermatologist panel review
- Transparent per-skin-tone accuracy disclosures in app settings

---

## 7. Camera & Guided Photography System

### 7.1 Shot Guidance Architecture

The camera system is the core technical differentiator. Consistent photos produce meaningful comparisons. The system uses multiple sensor inputs to guide the user:

```
┌─────────────────────────────────────────────────────────┐
│                  CAMERA GUIDANCE SYSTEM                   │
│                                                           │
│  Inputs:                                                  │
│  ├── Camera feed → MediaPipe FaceMesh (468 landmarks)    │
│  │   └── Distance estimation (inter-pupillary distance)  │
│  │   └── Head pose (pitch, yaw, roll)                    │
│  │   └── Face region center offset                       │
│  ├── Accelerometer → Device tilt angle                   │
│  ├── Gyroscope → Device rotation stability               │
│  ├── Ambient light sensor → Lighting quality             │
│  └── Previous session data → Target parameters           │
│                                                           │
│  Processing:                                              │
│  ├── Compare current parameters to target parameters     │
│  ├── Calculate correction vectors:                       │
│  │   ├── Distance delta (cm) → "move closer/farther"    │
│  │   ├── Angle delta (degrees) → "tilt left/right/up"   │
│  │   ├── Position offset (px) → "move device left/down" │
│  │   └── Light quality score → "improve lighting"        │
│  └── Determine readiness score (0–100%)                  │
│                                                           │
│  AR Overlay Outputs:                                      │
│  ├── Guide frame (shrinks green when position matches)   │
│  ├── Distance indicator bar (with target marker)         │
│  ├── Angle indicator (gimbal-style 3D rotation guide)    │
│  ├── Ghost image (previous photo at 30% opacity)         │
│  ├── Lighting quality badge (red/yellow/green)           │
│  ├── Readiness ring (fills to 100% = auto-capture)       │
│  └── Auto-capture when readiness > 95% for 1.5 seconds  │
└─────────────────────────────────────────────────────────┘
```

### 7.2 Lighting Normalization Pipeline

1. **Pre-Capture**: Ambient light sensor reading → categorize as (harsh, good, dim, mixed)
2. **Flash Decision**: If dim → enable soft flash; if harsh → suggest shade; if mixed → suggest repositioning
3. **Color Card Option**: Advanced users can include a mini color calibration card (physical accessory, future product)
4. **Post-Capture Normalization**:
   - White balance correction using skin tone reference (from user's first calibration session)
   - L*a*b* color space normalization to remove lighting-induced color shifts
   - Histogram equalization for exposure consistency
   - All normalizations are reversible — original image always preserved

### 7.3 Body Zone Mapping System

```
Zone Categories:
├── Face
│   ├── Forehead
│   ├── Left Cheek / Right Cheek
│   ├── Nose
│   ├── Chin
│   ├── Jaw Line
│   ├── Under-Eye Left / Right
│   ├── Lips/Perioral
│   └── Temples
├── Neck
│   ├── Front
│   ├── Left Side / Right Side
│   └── Back (Nape)
├── Arms
│   ├── Upper Arm Inner/Outer (L/R)
│   ├── Forearm Inner/Outer (L/R)
│   ├── Elbow (L/R)
│   └── Hands Dorsal/Palmar (L/R)
├── Torso
│   ├── Chest
│   ├── Abdomen
│   ├── Upper Back
│   └── Lower Back
├── Legs
│   ├── Thigh Front/Back (L/R)
│   ├── Knee (L/R)
│   ├── Shin/Calf (L/R)
│   └── Feet Dorsal/Plantar (L/R)
└── Scalp (limited, for visible hairline issues)
```

Each zone stores:
- **Reference photo** (first guided photo = calibration target)
- **Monitoring targets** (what conditions being tracked in this zone)
- **Schedule** (how often to capture)
- **Guided parameters** (exact distance, angle, position for this zone)

---

## 8. SkinShurpa — AI Assistant Architecture

### 8.1 Conversational Engine

**Backend**: Gemini 2.0 Flash (cost-efficient) or Gemini 2.0 Pro (premium tier) via Vertex AI

**System Prompt Architecture**:
```
SkinShurpa is a knowledgeable, supportive skin health companion. It:
- Guides users through monitoring sessions step by step
- Explains analysis results in clear, non-alarming language
- Answers general skin health questions with evidence-based info
- Recommends professional attention when patterns warrant it
- NEVER diagnoses, NEVER prescribes, NEVER replaces medical advice
- Uses the user's monitoring history as conversational context
- Can trigger structured actions via function calling
```

### 8.2 Function Calling Schema

SkinShurpa has access to structured actions via Gemini function calling:

```json
{
  "functions": [
    {
      "name": "start_monitoring_session",
      "description": "Start a new photo monitoring session for a specific body zone",
      "parameters": {
        "zone_id": "string",
        "monitoring_targets": ["string"]
      }
    },
    {
      "name": "show_comparison",
      "description": "Show comparison between two dates for a zone",
      "parameters": {
        "zone_id": "string",
        "date_a": "ISO8601",
        "date_b": "ISO8601"
      }
    },
    {
      "name": "show_trend",
      "description": "Show trend chart for a specific metric",
      "parameters": {
        "zone_id": "string",
        "metric": "string",
        "time_range": "string"
      }
    },
    {
      "name": "schedule_reminder",
      "description": "Schedule a monitoring reminder",
      "parameters": {
        "zone_id": "string",
        "frequency": "string",
        "preferred_time": "string"
      }
    },
    {
      "name": "suggest_professional",
      "description": "Recommend user seek professional dermatology consultation",
      "parameters": {
        "reason": "string",
        "urgency": "low|medium|high",
        "relevant_images": ["string"]
      }
    },
    {
      "name": "analyze_product",
      "description": "Analyze a skincare product's ingredients",
      "parameters": {
        "product_image_url": "string"
      }
    }
  ]
}
```

### 8.3 Context Window Management

```
Context injection per conversation turn:
├── System prompt (static) ........... ~500 tokens
├── User profile summary ............. ~200 tokens
│   (skin type, age, goals, conditions)
├── Recent monitoring summary ........ ~300 tokens
│   (last 5 sessions: zone, findings, dates)
├── Active concern context ........... ~200 tokens
│   (flagged items, trend alerts)
├── Conversation history ............. ~2000 tokens
│   (last 10 turns, summarized beyond that)
└── Total per turn ................... ~3200 tokens
    Estimated cost: ~$0.002/turn (Flash) or ~$0.01/turn (Pro)
```

### 8.4 SkinShurpa Interaction Modes

1. **Session Guide** — Activated when starting a monitoring session; walks through photo capture, provides real-time coaching
2. **Results Reviewer** — Activated after analysis completes; explains findings, highlights changes, contextualizes
3. **Open Chat** — Free-form Q&A about skin health, products, routines
4. **Emergency Advisor** — Triggered by high-concern analysis results; calm, clear guidance on seeking professional help
5. **Education Explorer** — Interactive lessons about skin biology, condition management, prevention

---

## 9. UI/UX Architecture — Z-Axis Depth System

### 9.1 Core Concept: The Depth Scroll

The app's primary navigation is a **Z-axis depth scroll** — instead of a traditional vertical list, the user scrolls to bring background content forward while current foreground content moves to the sides and shrinks into the background. Think of it as looking down at a vertical conveyor belt that moves toward you.

**The "Water Around a Sphere" Metaphor**: Cards and UI elements flow around a central invisible sphere. As they approach the equator (screen center), they are front-and-center, full-size, and in focus. As the user scrolls, the current center card drifts to one side and curves backward (shrinking, blurring slightly), while the next card emerges from the depths behind, growing larger and moving to center stage.

### 9.2 Implementation Architecture

```dart
// Core Z-Axis Depth Scroll Implementation Strategy

class DepthScrollView extends StatefulWidget {
  // Custom scroll view that maps scroll offset to Z-axis transforms
  // Uses ScrollController to drive AnimationController
  // Each child gets a Matrix4 transform based on its position relative to scroll center

  // Key calculations per item:
  // 1. normalizedPosition = (itemCenter - scrollCenter) / viewportExtent
  //    → Range: -1.0 (far past) to 0.0 (center) to 1.0 (far future)
  //
  // 2. zDepth = curve.transform(normalizedPosition.abs())
  //    → 0.0 at center, 1.0 at edges
  //
  // 3. transform = Matrix4.identity()
  //    ..setEntry(3, 2, 0.001)           // perspective
  //    ..translate(xOffset, 0, -zDepth * maxDepth)  // push back
  //    ..scale(1.0 - zDepth * 0.4)       // shrink with depth
  //    ..rotateY(xOffset > 0 ? -0.15 : 0.15)  // slight rotation
  //
  // 4. xOffset = sin(normalizedPosition * pi/2) * maxHorizontalOffset
  //    → Cards curve to sides following sinusoidal path
  //
  // 5. opacity = 1.0 - (zDepth * 0.6)   // fade with depth
  //
  // The water-around-sphere effect comes from the sinusoidal x-offset
  // combined with z-depth scaling — items trace an elliptical path
  // as if flowing around a sphere's meridian
}
```

### 9.3 Screen Layout Hierarchy

```
Z-Axis Depth Layers:
├── Layer 0 (Background) — Subtle gradient + ambient particles
│   └── Moves FORWARD when user scrolls down (parallax)
├── Layer 1 (Deep Background) — Blurred summary cards, future content
│   └── Scale: 0.6x, opacity: 40%, blur: 8px
├── Layer 2 (Mid Background) — Approaching cards
│   └── Scale: 0.8x, opacity: 70%, blur: 3px
├── Layer 3 (Foreground / Focus) — Active card, full size
│   └── Scale: 1.0x, opacity: 100%, blur: 0px, shader active
├── Layer 4 (Passing) — Card sliding to side, receding
│   └── Scale: 0.85x, opacity: 80%, x-offset: ±120px, blur: 2px
└── Layer 5 (Passed) — Card now in background
    └── Scale: 0.6x, opacity: 40%, x-offset: ±200px, blur: 8px
```

### 9.4 Key Screens Using Depth System

1. **Home Dashboard** — Monitoring zones as depth cards; scroll to browse zones, tap to enter
2. **Analysis Results** — Individual metrics as cards flowing through depth; current metric front-and-center
3. **History Timeline** — Past sessions as a depth tunnel; scroll through time
4. **SkinShurpa Chat** — Subtle depth on message history; newest messages in foreground focus
5. **Body Map** — 3D body silhouette with zone indicators at various depths

---

## 10. Shader & Motion Design System

### 10.1 Shader Architecture

Flutter supports custom GLSL fragment shaders via `FragmentProgram`. Each shader receives:
- `uniforms`: time, resolution, touch position, scroll offset, card bounds
- `sampler`: source texture (card content rendered to texture)

**Shader Effects Catalog**:

| Shader | File | Trigger | Description |
|--------|------|---------|-------------|
| **Iridescent Glass** | `iridescent.frag` | Card in focus (foreground) | Subtle holographic shimmer that shifts with device gyroscope; rainbow edge refraction |
| **Liquid Surface** | `liquid_glass.frag` | Scroll/touch motion | Card surface ripples like viscous liquid when touched or during scroll motion |
| **Reactive Touch** | `reactive_touch.frag` | Touch down/drag | Radial distortion wave from touch point; color shift at touch epicenter |
| **Depth Blur** | `depth_blur.frag` | Z-position driven | Gaussian blur intensity tied to card's Z-depth position; simulates camera DOF |
| **Heat Overlay** | `heat_overlay.frag` | Analysis results | Skin analysis heatmap rendered as shader overlay on photo; color-coded severity |

### 10.2 Motion Design Principles

```
Response Curves:
├── Scroll → Card transforms: cubicBezier(0.25, 0.1, 0.25, 1.0) — smooth decel
├── Touch → Shader ripple: cubicBezier(0.0, 0.0, 0.2, 1.0) — fast attack, slow decay
├── Tap → Card expand: cubicBezier(0.34, 1.56, 0.64, 1.0) — slight overshoot bounce
├── Screen transition: cubicBezier(0.4, 0.0, 0.2, 1.0) — Material 3 standard
└── Shader time uniform: continuous sine wave at 0.5Hz for ambient shimmer

Performance Budget:
├── Shader complexity: Max 50 GPU instructions per fragment
├── Concurrent animated cards: Max 5 visible at any time
├── Shader texture resolution: Render cards at 0.75x for shader input, upscale
├── Target frame rate: 60fps minimum, 120fps on ProMotion devices
└── Battery: Shader effects disable after 30s of inactivity, re-enable on touch
```

### 10.3 Interaction → Shader Mapping

```
User Action          → Visual Response
─────────────────────────────────────────────────
Scroll down          → Cards flow upward and away, new card emerges from depth
                       Liquid shader ripples in scroll direction on all visible cards
                       Background gradient shifts subtly

Touch card           → Reactive touch shader: radial ripple from touch point
                       Card lifts slightly (scale 1.0 → 1.02, shadow increases)
                       Iridescent effect intensifies at touch point

Hold card            → Liquid effect amplifies, card content beneath ripples
                       Haptic feedback pulse

Release card         → Ripple dissipates with exponential decay
                       Card settles back (spring physics)

Swipe card away      → Card flies off with velocity-matched curve
                       Neighboring cards rush to fill gap (spring physics)

Camera viewfinder    → Live camera feed with condition-specific overlay shader
  (acne mode)        → Highlight shader: subtle glow around detected features
  (mole mode)        → Border trace shader: ABCDE analysis overlay
  (wrinkle mode)     → Depth map shader: topology visualization
```

---

## 11. Color System & Visual Identity

### 11.1 Color Palette

The palette draws from a deep teal-to-warm amber spectrum with iridescent accent capability — sophisticated, clinical yet inviting, gender-neutral, and distinctive. Inspired by the deep, saturated stripe patterns seen in premium game cover art — vertical bars of color that blend from cool oceanic depths to warm amber highlights.

```
PRIMARY PALETTE:
┌──────────────────────────────────────────────────────────────────┐
│                                                                   │
│  Deep Ocean      Teal Core     Seafoam       Warm Sand   Amber  │
│  #0A1628         #0D3B4F       #1A6B5A       #C4956A     #D4894E│
│  ████████        ████████      ████████      ████████    ████████│
│                                                                   │
│  Background      Primary       Secondary     Accent      Highlight│
│  surfaces        actions       elements      warm touch  emphasis │
│                                                                   │
└──────────────────────────────────────────────────────────────────┘

SEMANTIC COLORS:
├── Safe/Good:        #2ECC71 (soft green)
├── Caution/Watch:    #F39C12 (warm amber)
├── Concern/Seek Pro: #E74C3C (soft red)
├── Neutral/Info:     #5DADE2 (sky blue)
├── AI/SkinShurpa:    #8E44AD → #3498DB (purple-to-blue gradient)
└── Premium/Gold:     #F4D03F → #D4894E (gold gradient)

SURFACE SYSTEM:
├── Surface 0 (deepest bg):  #060E18  — near-black with blue undertone
├── Surface 1 (card bg):     #0F1D2E  — dark navy
├── Surface 2 (elevated):    #162A3E  — lifted navy
├── Surface 3 (modal):       #1C3550  — modal/sheet background
├── Surface 4 (highlight):   #234060  — highlighted surface
└── Text on dark:            #E8E0D8  — warm off-white (not pure white)

IRIDESCENT SHADER PALETTE (for card effects):
├── Shift A: #0D3B4F → #1A6B5A → #C4956A  (teal to green to amber)
├── Shift B: #8E44AD → #3498DB → #1A6B5A  (purple to blue to green)
└── Intensity: 5-15% opacity overlay, increases on interaction
```

### 11.2 Typography

```
Font Stack:
├── Display/Hero:     "Space Grotesk" (variable weight) — geometric, modern
├── Body:             "Inter" (variable weight) — readable at all sizes
├── Mono/Data:        "JetBrains Mono" — metric values, percentages
└── SkinShurpa Chat:  "Inter" at slightly larger size with increased letter-spacing

Type Scale (Material 3 based):
├── Display Large:  36sp / 44sp line height / Space Grotesk 700
├── Display Medium: 28sp / 36sp / Space Grotesk 600
├── Title Large:    22sp / 28sp / Space Grotesk 600
├── Title Medium:   16sp / 24sp / Inter 600
├── Body Large:     16sp / 24sp / Inter 400
├── Body Medium:    14sp / 20sp / Inter 400
├── Label Large:    14sp / 20sp / Inter 500
└── Label Small:    11sp / 16sp / Inter 500
```

---

## 12. Push Notifications & Scheduling

### 12.1 Notification Architecture

```
Notification Types:
├── MONITORING_REMINDER
│   ├── "Time to check your [zone]! Your [condition] tracking is on day [N]."
│   ├── Scheduled via flutter_local_notifications
│   ├── User-configurable time of day, frequency per zone
│   └── Smart delay: if user opens app within 2hrs before scheduled time, skip
│
├── ANALYSIS_COMPLETE
│   ├── "Your analysis is ready! SkinShurpa has insights about your [zone]."
│   ├── Triggered by Cloud Function on analysis completion
│   ├── Delivered via Firebase Cloud Messaging (FCM)
│   └── Deep-links to analysis result screen
│
├── TREND_ALERT
│   ├── "Positive change! Your [metric] in [zone] improved [X]% this month."
│   ├── OR: "Heads up — your [metric] in [zone] has changed. SkinShurpa wants to chat."
│   ├── Triggered by weekly trend computation Cloud Function
│   └── Deep-links to trend view or SkinShurpa
│
├── CONCERN_FLAG
│   ├── "Important: SkinShurpa noticed something worth discussing about your [zone]."
│   ├── Triggered by high-concern analysis result
│   ├── Higher priority notification channel
│   └── Deep-links to SkinShurpa with concern context preloaded
│
├── STREAK_MOTIVATION
│   ├── "7-day monitoring streak! Your consistency is building great data."
│   ├── Triggered by streak counter
│   └── Gamification support
│
└── SUBSCRIPTION
    ├── Trial ending, feature limit approaching
    └── Standard marketing notification rules apply
```

### 12.2 Scheduling Implementation

```dart
// Notification scheduling uses workmanager for background reliability
// + flutter_local_notifications for precise local scheduling
// + FCM for server-triggered push

// User's schedule stored in Firestore:
// users/{uid}/schedules/{zoneId} → {
//   frequency: "daily" | "every_3_days" | "weekly" | "biweekly" | "monthly",
//   preferredTime: "08:30",
//   timezone: "America/New_York",
//   enabled: true,
//   lastCompleted: Timestamp,
//   nextDue: Timestamp
// }

// Cloud Function runs hourly:
// 1. Query all schedules where nextDue <= now AND enabled == true
// 2. For each, check if already completed today (lastCompleted)
// 3. If not completed, dispatch FCM push notification
// 4. Update nextDue based on frequency
```

---

## 13. Subscription & Monetization Model

### 13.1 Tier Structure

| Feature | Free | DermalVision+ ($7.99/mo) | DermalVision Pro ($14.99/mo) |
|---------|------|--------------------------|------------------------------|
| Monitoring zones | 2 | 10 | Unlimited |
| AI analyses per month | 5 | 50 | Unlimited |
| Photo storage | 90 days | 1 year | Unlimited |
| SkinShurpa chat turns/day | 10 | 50 | Unlimited |
| SkinShurpa model | Flash | Flash | Pro (higher quality) |
| Condition types | Tier 1 only | Tier 1 + 2 | All Tiers |
| Time-lapse export | No | Yes (watermarked) | Yes (clean) |
| Comparison tools | Side-by-side only | All comparison modes | All + PDF report export |
| Body map | Face only | Full body | Full body + custom zones |
| Product efficacy tracking | No | Basic | Advanced with A/B mode |
| Trend charts | Last 30 days | Full history | Full history + predictions |
| Skin age estimation | No | Annual | Monthly |
| API/Extension access | No | No | Yes |
| Ad-free | No | Yes | Yes |
| Priority analysis queue | No | No | Yes |
| Offline analysis (on-device) | Basic | Enhanced | Full |

### 13.2 Monetization Implementation

**Payment Platform**: RevenueCat (wraps StoreKit 2 + Google Play Billing)

```
Revenue Stack:
├── RevenueCat SDK (Flutter)
│   ├── Handles purchase flow, receipt validation, subscription management
│   ├── Webhook → Cloud Function → Update Firestore user.subscription
│   └── Entitlements checked client-side (Riverpod provider) and server-side
├── Server-Side Validation
│   ├── Cloud Function receives RevenueCat webhook
│   ├── Validates subscription status
│   ├── Updates users/{uid}/subscription document
│   └── Updates feature gate flags
└── Feature Gating
    ├── SubscriptionProvider (Riverpod) exposes currentTier
    ├── Feature access checked via: canAccess(Feature.skinAge)
    ├── UI shows locked state with upgrade prompt for gated features
    └── Cloud Functions also validate tier before expensive operations
```

### 13.3 Trial & Conversion Strategy
- **7-day free trial** of DermalVision+ on first install
- **First analysis free** — no signup required for one analysis (anonymous auth)
- **Progressive paywall** — show value before asking for payment
- **Annual pricing discount**: +$59.99/yr (~37% off monthly), Pro $119.99/yr (~33% off)

---

## 14. Data Model & Storage Architecture

### 14.1 Firestore Collections Schema

```
ROOT COLLECTIONS:

users/{uid}
├── displayName: string
├── email: string
├── skinType: string (fitzpatrick_1..6)
├── skinUndertone: string (cool|warm|neutral)
├── dateOfBirth: timestamp
├── gender: string (male|female|non_binary|prefer_not)
├── goals: string[] (anti_aging|acne_clear|mole_watch|...)
├── onboardingComplete: boolean
├── subscription: {
│   tier: "free"|"plus"|"pro",
│   expiresAt: timestamp,
│   platform: "ios"|"android",
│   revenuecatId: string
│ }
├── settings: {
│   notifications: boolean,
│   defaultLighting: string,
│   hapticFeedback: boolean,
│   privacyMode: boolean  // extra biometric lock
│ }
├── createdAt: timestamp
└── updatedAt: timestamp

users/{uid}/zones/{zoneId}
├── bodyZone: string (face_left_cheek, arm_left_upper_outer, ...)
├── customLabel: string? (user's name for this zone)
├── monitoringTargets: string[] (acne|wrinkles|moles|...)
├── referencePhotoUrl: string (first calibration photo)
├── guidanceParams: {
│   targetDistance: float (cm),
│   targetPitch: float (degrees),
│   targetYaw: float (degrees),
│   targetRoll: float (degrees)
│ }
├── schedule: {
│   frequency: string,
│   preferredTime: string,
│   timezone: string,
│   enabled: boolean,
│   nextDue: timestamp
│ }
├── createdAt: timestamp
└── lastSessionAt: timestamp

users/{uid}/sessions/{sessionId}
├── zoneId: string
├── capturedAt: timestamp
├── photoUrls: {
│   original: string,      // Full resolution in Firebase Storage
│   normalized: string,    // Color-normalized version
│   thumbnail_128: string,
│   thumbnail_512: string
│ }
├── captureMetadata: {
│   distance: float,
│   pitch: float,
│   yaw: float,
│   roll: float,
│   ambientLight: float (lux),
│   flashUsed: boolean,
│   deviceModel: string,
│   readinessScore: float
│ }
├── analysisStatus: "pending"|"processing"|"complete"|"failed"
├── analysisId: string? (reference to analysis result)
└── notes: string? (user's notes for this session)

users/{uid}/analyses/{analysisId}
├── sessionId: string
├── zoneId: string
├── analyzedAt: timestamp
├── modelVersions: {
│   medgemma: string,
│   acneGrader: string,
│   wrinkleScorer: string,
│   ...
│ }
├── results: {
│   [conditionType]: {
│     detected: boolean,
│     severity: float (0-1),
│     count: int?,
│     area: float? (percentage of ROI),
│     colorDelta: float? (L*a*b* delta from reference),
│     classification: string?,
│     boundingBoxes: [{x, y, w, h, confidence}]?,
│     segmentationMaskUrl: string?
│   }
│ }
├── compositeScores: {
│   overallHealth: float (0-100),
│   skinAge: int?,
│   hydrationIndex: float?,
│   barrierHealthIndex: float?
│ }
├── changeFromPrevious: {
│   [metric]: {
│     delta: float,
│     percentChange: float,
│     direction: "improving"|"worsening"|"stable",
│     significance: "low"|"medium"|"high"
│   }
│ }
├── referralTriggered: boolean
├── referralReason: string?
├── summary: string (natural language summary for SkinShurpa)
└── processingTimeMs: int

users/{uid}/conversations/{conversationId}
├── startedAt: timestamp
├── lastMessageAt: timestamp
├── mode: "session_guide"|"results_review"|"open_chat"|"concern"
├── contextZoneId: string?
├── contextAnalysisId: string?
└── messages: [{
      role: "user"|"assistant"|"system",
      content: string,
      functionCall: object?,
      functionResult: object?,
      timestamp: timestamp
    }]

users/{uid}/products/{productId}   // Product tracking (Tier 2+)
├── name: string
├── brand: string
├── ingredients: string[]
├── startedUsing: timestamp
├── appliedToZones: string[]
├── photoUrl: string?
└── notes: string?
```

### 14.2 Firebase Storage Structure

```
gs://dermalvision-prod/
├── users/{uid}/
│   ├── photos/
│   │   ├── originals/{sessionId}.jpg       (full res, encrypted)
│   │   ├── normalized/{sessionId}.jpg      (color-normalized)
│   │   ├── thumbnails/{sessionId}_128.jpg
│   │   ├── thumbnails/{sessionId}_512.jpg
│   │   └── thumbnails/{sessionId}_1024.jpg
│   ├── masks/
│   │   └── {analysisId}_{condition}.png    (segmentation masks)
│   ├── references/
│   │   └── {zoneId}_reference.jpg          (calibration reference)
│   ├── exports/
│   │   └── {zoneId}_timelapse_{date}.mp4   (generated time-lapses)
│   └── profile/
│       └── avatar.jpg
```

### 14.3 Storage Security Rules

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    // Users can only access their own photos
    match /users/{uid}/{allPaths=**} {
      allow read, write: if request.auth != null && request.auth.uid == uid;
    }
    // Cloud Functions service account has admin access for processing
  }
}
```

---

## 15. Security, Privacy & Regulatory Compliance

### 15.1 Data Protection

| Layer | Mechanism |
|-------|-----------|
| **In Transit** | TLS 1.3 for all API calls; certificate pinning in release builds |
| **At Rest (Client)** | Platform keychain for tokens; optional biometric lock for app access |
| **At Rest (Storage)** | Firebase Storage default encryption (AES-256); option for customer-managed encryption keys (Pro tier) |
| **At Rest (Firestore)** | Default Google-managed encryption |
| **Photo Privacy** | Photos never shared between users; no server-side human review without explicit consent |
| **Local Option** | Premium feature: "Privacy Mode" keeps photos only on-device, sends only extracted features to cloud for analysis |

### 15.2 Regulatory Stance

**FDA Classification**: DermalVision is classified as a **general wellness product**, not a medical device. It:
- Does NOT diagnose any disease
- Does NOT recommend specific treatments
- Does NOT replace professional medical advice
- DOES monitor user-defined skin features over time
- DOES provide educational information about skin health
- DOES recommend seeking professional attention based on pattern recognition

**Required Disclaimers** (shown prominently at onboarding, analysis results, and referral suggestions):
```
"DermalVision is not a medical device and does not diagnose, treat, or cure any
condition. Analysis results are for personal monitoring and educational purposes
only. Always consult a qualified dermatologist or healthcare professional for
medical advice, diagnosis, or treatment. If you notice sudden changes in a mole
or skin lesion, contact a healthcare provider promptly."
```

### 15.3 HIPAA Considerations

DermalVision is initially positioned as a **consumer wellness app**, not a covered entity under HIPAA. However, for future teledermatology partnerships:
- Architecture is designed to be **HIPAA-ready** (encryption, access controls, audit logging)
- Google Cloud BAA (Business Associate Agreement) available for GCP services
- Firebase can operate under BAA when configured correctly
- Data retention and deletion policies implement GDPR Article 17 (right to erasure)
- All user data exportable (GDPR Article 20 — data portability)

### 15.4 Content Safety

- All uploaded images pass through Cloud Vision API **SafeSearch** detection
- Images flagged for non-skin content are rejected with explanation
- SkinShurpa has content safety filters via Gemini's built-in safety settings
- User-generated content (notes, chat) monitored for crisis language → resource links provided

---

## 16. Agent, MCP & Extension Architecture

### 16.1 MCP (Model Context Protocol) Integration

DermalVision is designed to be both an MCP **client** (consuming external tools) and an MCP **server** (exposing skin data to external agents).

**As MCP Server** (exposing DermalVision data to external agents):
```json
{
  "server": "dermalvision",
  "version": "1.0.0",
  "tools": [
    {
      "name": "get_skin_summary",
      "description": "Get user's current skin health summary across all monitored zones",
      "inputSchema": { "type": "object", "properties": {} }
    },
    {
      "name": "get_zone_history",
      "description": "Get monitoring history for a specific body zone",
      "inputSchema": {
        "type": "object",
        "properties": {
          "zone_id": { "type": "string" },
          "days": { "type": "integer", "default": 30 }
        }
      }
    },
    {
      "name": "get_latest_analysis",
      "description": "Get the most recent analysis results for a zone",
      "inputSchema": {
        "type": "object",
        "properties": {
          "zone_id": { "type": "string" }
        }
      }
    },
    {
      "name": "trigger_monitoring_reminder",
      "description": "Send a monitoring reminder to the user",
      "inputSchema": {
        "type": "object",
        "properties": {
          "zone_id": { "type": "string" },
          "message": { "type": "string" }
        }
      }
    }
  ],
  "resources": [
    {
      "uri": "dermalvision://skin-profile",
      "name": "User Skin Profile",
      "description": "Current skin type, conditions, goals"
    },
    {
      "uri": "dermalvision://active-concerns",
      "name": "Active Concerns",
      "description": "Currently flagged skin concerns requiring attention"
    }
  ]
}
```

**As MCP Client** (consuming external tools):
- Weather/UV APIs for environmental correlation
- Product database APIs for ingredient analysis
- Calendar APIs for appointment scheduling
- Health platform APIs (Apple Health, Google Fit) for wellness context

### 16.2 Extension/Plugin Architecture

```
Extension Points:
├── Analysis Plugins
│   ├── Third-party AI models can register as analysis providers
│   ├── Plugin receives: normalized image, zone metadata
│   ├── Plugin returns: structured analysis result (schema validated)
│   └── Example: Skincare brand provides proprietary product-efficacy analyzer
│
├── Data Connectors
│   ├── Export skin data to external platforms
│   ├── Import data from other skin tracking apps
│   └── Example: Dermatologist EHR integration
│
├── UI Widgets
│   ├── Custom cards in the depth scroll
│   ├── Brand-sponsored educational content
│   └── Example: Sunscreen brand provides UV protection widget
│
└── SkinShurpa Skills
    ├── Third-party "skills" that SkinShurpa can invoke
    ├── Skill receives: user context, conversation history
    ├── Skill returns: structured response or action
    └── Example: Dermatology clinic provides appointment booking skill
```

### 16.3 Agent SDK

```
DermalVision Agent SDK:
├── dermalvision-agent-python (PyPI package)
│   ├── Client for DermalVision MCP server
│   ├── Helper functions for skin data analysis
│   └── Integration with LangChain, LlamaIndex, Claude SDK
├── dermalvision-agent-node (npm package)
│   ├── TypeScript client
│   └── Integration with Vercel AI SDK
└── CLI Tool
    ├── dermalvision-cli
    ├── Commands: status, analyze, export, schedule
    └── Used by external agents via subprocess
```

---

## 17. Telemetry & Observability

### 17.1 Telemetry Architecture

```
Telemetry Stack:
├── Client-Side
│   ├── Firebase Analytics → Standard user behavior events
│   ├── Firebase Crashlytics → Crash reporting + non-fatal errors
│   ├── Custom Events → DermalVision-specific events
│   └── Performance Monitoring → Screen load times, API latency
│
├── Server-Side
│   ├── Cloud Logging → Cloud Function execution logs
│   ├── Cloud Monitoring → Infrastructure metrics, alerts
│   ├── Custom Metrics → Analysis pipeline performance
│   └── BigQuery Export → Firebase Analytics → BigQuery for advanced queries
│
└── Developer Dashboard
    ├── Grafana (optional, for self-hosted metrics visualization)
    ├── Firebase Console (primary)
    └── BigQuery → Looker Studio (for product analytics)
```

### 17.2 Key Telemetry Events

```
Event Taxonomy:
├── SESSION
│   ├── session_start {zone_id, monitoring_targets[]}
│   ├── session_photo_captured {readiness_score, attempts, lighting_quality}
│   ├── session_complete {duration_seconds, photos_taken}
│   └── session_abandoned {stage, reason?}
│
├── ANALYSIS
│   ├── analysis_requested {zone_id, tier}
│   ├── analysis_complete {duration_ms, model_versions, result_summary}
│   ├── analysis_failed {error_type, retry_count}
│   └── analysis_viewed {time_spent_seconds}
│
├── SKINSHURPA
│   ├── chat_started {mode, context_zone?}
│   ├── chat_message_sent {token_count}
│   ├── chat_function_called {function_name}
│   ├── chat_referral_triggered {urgency, reason}
│   └── chat_satisfaction_rated {rating_1_5}
│
├── SUBSCRIPTION
│   ├── paywall_viewed {trigger_feature}
│   ├── trial_started
│   ├── subscription_purchased {tier, price, platform}
│   ├── subscription_renewed
│   └── subscription_cancelled {reason?}
│
├── UI
│   ├── depth_scroll_engaged {screen, depth_range}
│   ├── shader_interaction {shader_type, duration}
│   ├── comparison_used {comparison_mode}
│   └── timelapse_exported
│
└── SYSTEM
    ├── on_device_ml_inference {model, latency_ms, device_model}
    ├── photo_upload {size_bytes, duration_ms}
    └── notification_tapped {type, delay_from_send_minutes}
```

### 17.3 CLI Telemetry Access

```bash
# Developer CLI commands for telemetry access
dermalvision telemetry summary --last 7d
dermalvision telemetry events --type ANALYSIS --format json
dermalvision telemetry funnel --from session_start --to analysis_viewed
dermalvision telemetry errors --severity high --last 24h
dermalvision telemetry export --format csv --output ./telemetry_export.csv
```

---

## 18. CLI & Developer Tooling

### 18.1 DermalVision CLI

```bash
# Installation
dart pub global activate dermalvision_cli

# Commands
dermalvision init                    # Initialize local dev environment
dermalvision emulator start          # Start Firebase emulators
dermalvision deploy functions        # Deploy Cloud Functions
dermalvision deploy models           # Deploy ML models to Vertex AI
dermalvision test unit               # Run unit tests
dermalvision test integration        # Run integration tests
dermalvision test ml-pipeline        # Test ML pipeline end-to-end
dermalvision analyze --image <path>  # Run analysis on a local image
dermalvision export-schema           # Export Firestore schema docs
dermalvision telemetry <subcommand>  # Telemetry access (see above)
dermalvision mcp serve               # Start MCP server for agent integration
dermalvision agent test              # Test agent SDK integration
```

### 18.2 CI/CD Pipeline (GitHub Actions)

```yaml
# .github/workflows/ci.yml
name: DermalVision CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  analyze:
    # dart analyze, flutter analyze
  test:
    # flutter test --coverage
  build-android:
    # flutter build apk --release
  build-ios:
    # flutter build ipa --release
  deploy-functions:
    # firebase deploy --only functions (on main merge)
  deploy-models:
    # Vertex AI model deployment (manual trigger)
```

---

## 19. Phased Development Roadmap

### Phase 0 — Foundation (Weeks 1–4)

**Goal**: Project scaffolding, core infrastructure, basic camera

| Task | Priority | Dependencies |
|------|----------|-------------|
| Flutter project creation with folder structure | P0 | None |
| Firebase project setup (Auth, Firestore, Storage, FCM) | P0 | GCloud account |
| Authentication flows (email, Google, Apple) | P0 | Firebase Auth |
| Riverpod state management scaffolding | P0 | None |
| GoRouter navigation setup | P0 | None |
| Basic camera screen with preview | P0 | camera package |
| Material 3 theme with DermalVision color system | P0 | None |
| CI/CD pipeline (GitHub Actions) | P1 | Repo setup |
| Firebase Security Rules (initial) | P0 | Firestore setup |
| Onboarding flow (skin type quiz, goals) | P1 | Auth flows |

**Deliverable**: App launches, user can sign up, see camera preview, complete onboarding.

### Phase 1 — Core Camera & Photography System (Weeks 5–10)

**Goal**: Guided photography system with consistency enforcement

| Task | Priority | Dependencies |
|------|----------|-------------|
| MediaPipe FaceMesh integration for face distance/angle | P0 | camera screen |
| AR guide overlay (frame, distance bar, angle indicator) | P0 | FaceMesh |
| Ghost image overlay (previous photo transparency) | P0 | Photo storage |
| Lighting assessment (ambient light sensor + ML) | P0 | camera screen |
| Body zone selection UI | P0 | Zone data model |
| Photo capture with metadata recording | P0 | Camera + sensors |
| Firebase Storage upload pipeline | P0 | Firebase setup |
| Image normalization pipeline (Cloud Function) | P1 | Cloud Functions |
| Thumbnail generation pipeline | P1 | Cloud Functions |
| Basic monitoring session flow (capture → store → confirm) | P0 | All above |
| Zone reference photo calibration | P1 | Zone system |
| Auto-capture at readiness threshold | P1 | Guide overlay |

**Deliverable**: User can create monitoring zones, take guided photos with consistency enforcement, photos stored and organized.

### Phase 2 — AI Analysis Pipeline (Weeks 11–18)

**Goal**: Cloud-based skin analysis producing meaningful results

| Task | Priority | Dependencies |
|------|----------|-------------|
| Vertex AI project setup, model serving endpoints | P0 | GCloud |
| MedGemma 1.5 integration for lesion/mole analysis | P0 | Vertex AI |
| Custom acne severity grading model (train + deploy) | P0 | Training data |
| Custom wrinkle scoring model (train + deploy) | P1 | Training data |
| Scar classification model (train + deploy) | P1 | Training data |
| Analysis orchestrator Cloud Function | P0 | All models |
| Image comparison engine (registration, delta computation) | P0 | Photo pipeline |
| Result aggregator + composite scoring | P0 | Analysis orchestrator |
| Analysis result UI (metric cards, heatmaps, scores) | P0 | Results data |
| Trend charts (per-metric over time) | P1 | Multiple analyses |
| Comparison view (side-by-side, slider, overlay) | P1 | Photo pairs |
| On-device quick screening model (TFLite) | P1 | Model training |
| Referral trigger system | P0 | Analysis results |
| Hyperpigmentation/dark circle analysis | P1 | Custom model |
| Pore density / blackhead detection | P1 | Custom model |

**Deliverable**: Full analysis pipeline operational. User captures photo → gets detailed analysis results with change tracking.

### Phase 3 — SkinShurpa AI Assistant (Weeks 19–24)

**Goal**: Conversational AI assistant integrated throughout the app

| Task | Priority | Dependencies |
|------|----------|-------------|
| Gemini API integration (Vertex AI) | P0 | Vertex AI |
| SkinShurpa chat UI | P0 | Chat design |
| System prompt engineering + testing | P0 | Gemini API |
| Function calling implementation (all 6 functions) | P0 | Chat + actions |
| Context window management (profile + history injection) | P0 | Data access |
| Session guide mode (photo-taking walkthrough) | P0 | Camera + chat |
| Results review mode (post-analysis explanation) | P0 | Analysis + chat |
| Open chat mode (general Q&A) | P1 | Chat UI |
| Concern escalation mode | P0 | Referral system |
| Conversation persistence (Firestore) | P1 | Chat flow |
| SkinShurpa voice option (TTS) | P2 | Chat |

**Deliverable**: SkinShurpa guides users through sessions, explains results, answers questions, and appropriately flags concerns.

### Phase 4 — Premium UI: Depth Scroll & Shaders (Weeks 25–32)

**Goal**: Distinctive Z-axis depth UI with shader effects

| Task | Priority | Dependencies |
|------|----------|-------------|
| DepthScrollView widget implementation | P0 | Core UI |
| Matrix4 transform pipeline for cards | P0 | DepthScroll |
| Sinusoidal x-offset path (water-around-sphere) | P0 | DepthScroll |
| Scroll physics customization | P0 | DepthScroll |
| Fragment shader infrastructure (FragmentProgram loading) | P0 | Flutter shaders |
| Iridescent glass shader | P1 | Shader infra |
| Liquid surface shader | P1 | Shader infra |
| Reactive touch shader | P1 | Shader infra |
| Depth blur shader | P0 | Shader infra |
| Heat overlay shader (analysis heatmaps) | P0 | Shader infra |
| Home dashboard with depth scroll | P0 | DepthScroll |
| Performance optimization (texture caching, GPU budget) | P0 | All shaders |
| Battery-aware shader throttling | P1 | Shaders |
| Gyroscope-driven subtle parallax | P1 | Sensor access |
| Screen transitions with depth awareness | P1 | Router + depth |

**Deliverable**: Full premium UI with depth scrolling, shader effects, and fluid motion design.

### Phase 5 — Subscription & Monetization (Weeks 33–36)

**Goal**: Revenue infrastructure operational

| Task | Priority | Dependencies |
|------|----------|-------------|
| RevenueCat integration (Flutter) | P0 | None |
| Subscription tier definitions in RevenueCat | P0 | Business model |
| Paywall UI with plan comparison | P0 | RevenueCat |
| Feature gating system (client + server) | P0 | Subscription state |
| Server-side receipt validation (Cloud Function) | P0 | RevenueCat webhook |
| Trial flow implementation | P0 | RevenueCat |
| Restore purchases flow | P0 | RevenueCat |
| Free tier limits enforcement | P0 | Feature gates |
| Upgrade prompts at feature boundaries | P1 | Feature gates |
| Subscription analytics events | P1 | Analytics |

**Deliverable**: Users can subscribe, features are properly gated, payments are validated server-side.

### Phase 6 — Notifications, Scheduling & Engagement (Weeks 37–40)

**Goal**: Push notifications, reminders, and engagement features

| Task | Priority | Dependencies |
|------|----------|-------------|
| FCM setup and token management | P0 | Firebase |
| Local notification scheduling | P0 | flutter_local_notifications |
| Monitoring reminder system | P0 | Schedule data model |
| Analysis complete notifications | P0 | Cloud Functions |
| Trend alert notifications | P1 | Trend computation |
| Concern flag notifications | P0 | Analysis pipeline |
| Streak tracking and motivation notifications | P1 | Session data |
| Notification preferences UI | P0 | Settings |
| Smart scheduling (skip if recently opened) | P1 | Analytics |
| Deep-linking from notifications | P0 | GoRouter |

**Deliverable**: Users receive timely reminders, analysis results, and engagement nudges.

### Phase 7 — Advanced Features & Polish (Weeks 41–48)

**Goal**: Tier 2 & 3 features, platform extensions

| Task | Priority | Dependencies |
|------|----------|-------------|
| Time-lapse video generation | P1 | Photo series |
| Product efficacy tracking | P1 | Product data model |
| Skin age estimation model | P2 | Custom model |
| Skin barrier health index | P2 | Multi-feature model |
| Environmental correlation (weather API) | P2 | External API |
| MCP server implementation | P2 | Agent architecture |
| CLI tooling | P2 | Backend APIs |
| Extension/plugin architecture | P2 | Architecture |
| Telemetry dashboard | P1 | Analytics pipeline |
| Accessibility audit (WCAG 2.1 AA) | P0 | All UI |
| Localization (top 10 languages) | P1 | l10n setup |
| Performance profiling and optimization pass | P0 | All features |
| Security audit | P0 | All features |
| Beta testing program | P0 | All features |

**Deliverable**: Feature-complete application ready for public beta.

### Phase 8 — Launch Preparation (Weeks 49–52)

| Task | Priority |
|------|----------|
| App Store submission preparation (screenshots, descriptions, review guidelines compliance) | P0 |
| Play Store submission preparation | P0 |
| Privacy policy and terms of service (legal review) | P0 |
| Medical disclaimer review (health law attorney) | P0 |
| Load testing (concurrent analysis requests) | P0 |
| Disaster recovery testing | P1 |
| Launch marketing materials | P1 |
| Public beta → v1.0 release | P0 |

---

## 20. Testing Strategy

### 20.1 Testing Pyramid

```
Testing Layers:
├── Unit Tests (80% coverage target)
│   ├── Business logic (analysis scoring, comparison algorithms)
│   ├── State management (Riverpod providers)
│   ├── Data transformations (model serialization)
│   └── Utility functions
│
├── Widget Tests (Key UI components)
│   ├── DepthScrollView behavior
│   ├── Camera overlay rendering
│   ├── Analysis result cards
│   ├── SkinShurpa message rendering
│   └── Feature gate UI states
│
├── Integration Tests
│   ├── Full monitoring session flow (capture → analyze → view)
│   ├── SkinShurpa conversation flow
│   ├── Subscription purchase flow
│   ├── Notification delivery and deep-linking
│   └── Offline → online sync
│
├── ML Pipeline Tests
│   ├── Model inference accuracy on test sets (per skin tone)
│   ├── Image normalization correctness
│   ├── Analysis orchestrator end-to-end
│   ├── Comparison engine registration accuracy
│   └── Regression tests (new model versions don't degrade)
│
├── Performance Tests
│   ├── Camera viewfinder FPS under shader load
│   ├── Scroll smoothness with depth transforms
│   ├── Cold start time
│   ├── Memory usage during photo series loading
│   └── Battery drain during monitoring session
│
└── Security Tests
    ├── Firestore rules validation (cannot access other users' data)
    ├── Storage rules validation
    ├── API endpoint authentication
    ├── Input sanitization (SkinShurpa prompt injection)
    └── Data encryption verification
```

### 20.2 Test Infrastructure

```
Tools:
├── flutter test                    # Unit + widget tests
├── flutter test --integration      # Integration tests
├── Firebase Emulator Suite         # Local Firebase testing
├── Vertex AI test endpoints        # Staging model endpoints
├── GitHub Actions                  # CI/CD runner
├── Codecov                         # Coverage tracking
└── Firebase Test Lab               # Real device testing (Android)
```

---

## 21. Technology Stack Summary

### Client
| Category | Technology | Version | Purpose |
|----------|-----------|---------|---------|
| Framework | Flutter | 3.x (latest stable) | Cross-platform UI |
| Language | Dart | 3.x | Application logic |
| State Mgmt | Riverpod | ^2.0 | Reactive state management |
| Navigation | go_router | ^14.0 | Declarative routing |
| Camera | camera | ^0.11 | Camera access and control |
| ML (on-device) | tflite_flutter | ^0.11 | TFLite model inference |
| ML (face) | google_ml_kit | ^0.18 | Face detection, face mesh |
| Animations | flutter_animate | ^4.0 | Declarative animations |
| Shaders | Flutter FragmentProgram | Built-in | Custom GLSL shaders |
| HTTP | dio | ^5.0 | API client |
| Local Storage | hive | ^4.0 | Local key-value storage |
| Notifications | flutter_local_notifications | ^17.0 | Local scheduled notifications |
| IAP | purchases_flutter (RevenueCat) | ^8.0 | Subscription management |
| Charts | fl_chart | ^0.69 | Trend visualization |
| Image Processing | image | ^4.0 | Client-side image manipulation |

### Backend (Firebase + GCloud)
| Category | Technology | Purpose |
|----------|-----------|---------|
| Auth | Firebase Authentication | User identity management |
| Database | Cloud Firestore | Primary data store |
| File Storage | Firebase Storage | Photo storage |
| Push | Firebase Cloud Messaging | Push notifications |
| Functions | Cloud Functions (2nd gen) | Backend logic, triggers |
| Container | Cloud Run | Image processing pipeline |
| AI/ML | Vertex AI | Model hosting, prediction |
| Foundation Model | MedGemma 1.5 | Dermatology image analysis |
| LLM | Gemini 2.0 (Flash/Pro) | SkinShurpa conversational AI |
| Vision | Cloud Vision API | SafeSearch, face detection |
| Analytics | Firebase Analytics | User behavior tracking |
| Analytics DW | BigQuery | Advanced analytics queries |
| Crashes | Firebase Crashlytics | Crash reporting |
| Config | Firebase Remote Config | Feature flags |
| Monitoring | Cloud Monitoring | Infrastructure health |

### Development
| Category | Technology | Purpose |
|----------|-----------|---------|
| IDE | VS Code / Android Studio | Development |
| VCS | Git + GitHub | Version control |
| CI/CD | GitHub Actions | Automated testing, deployment |
| Package Mgmt | pub (Dart) + npm (Functions) | Dependencies |
| Emulation | Firebase Emulator Suite | Local development |
| Design | Figma | UI/UX design |
| API Docs | OpenAPI 3.0 | API documentation |

---

## 22. Risk Matrix & Mitigations

| Risk | Probability | Impact | Mitigation |
|------|------------|--------|------------|
| **AI false positive on concern** → user panic | Medium | High | Conservative thresholds, clear disclaimers, SkinShurpa explains uncertainty ranges, always frame as "monitor closely" not "you have X" |
| **AI false negative on real concern** → missed detection | Medium | Critical | Never claim comprehensive detection, prominent disclaimer that app is monitoring aid not diagnostic tool, encourage regular professional checkups |
| **Skin tone bias in models** | Medium | High | Fitzpatrick-stratified testing, ongoing bias audits, diverse training data, transparent per-tone accuracy metrics |
| **App Store rejection (medical claims)** | Medium | High | Legal review of all copy, strict "wellness not medical" positioning, no diagnostic language anywhere |
| **HIPAA/regulatory action** | Low | Critical | Stay in wellness lane, HIPAA-ready architecture for future partnerships, legal counsel for health claims |
| **Photo data breach** | Low | Critical | Encryption at rest + transit, minimal data retention, privacy-mode option, security audits |
| **Shader performance issues on low-end devices** | High | Medium | Device capability detection, graceful degradation (disable shaders on low-end), GPU budget enforcement |
| **Cloud ML costs exceeding budget** | Medium | Medium | On-device screening reduces cloud calls, subscription revenue funds analysis, usage limits on free tier |
| **LLM hallucination (SkinShurpa gives bad advice)** | Medium | High | Strict system prompt, function calling for structured actions, content safety filters, prominent disclaimers |
| **User photo consistency still poor despite guidance** | Medium | Medium | Readiness score threshold for auto-capture, reject low-quality captures, session quality score feedback |

---

*This document is the primary architectural reference for DermalVision. For implementation instructions, see `DERMALVISION_AGENT_PROMPT.md`. Both documents should be referenced together for complete project context.*
