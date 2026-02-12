# DermalVision: Comprehensive Firebase & Google Cloud Architecture Report

## Table of Contents

1. [Firebase Architecture for Image-Heavy Apps](#1-firebase-architecture-for-image-heavy-apps)
2. [Google Cloud AI/ML Pipeline](#2-google-cloud-aiml-pipeline)
3. [Image Processing Pipeline](#3-image-processing-pipeline)
4. [Subscription & Monetization Backend](#4-subscription--monetization-backend)
5. [LLM Integration for SkinShurpa AI Assistant](#5-llm-integration-for-skinshurpa-ai-assistant)
6. [Security & Compliance](#6-security--compliance)
7. [Telemetry & Analytics](#7-telemetry--analytics)
8. [CLI & Developer Tools](#8-cli--developer-tools)
9. [Pricing Estimates](#9-pricing-estimates)
10. [Recommended Architecture Diagram](#10-recommended-architecture-diagram)

---

## 1. Firebase Architecture for Image-Heavy Apps

### 1.1 Firebase Storage for High-Resolution Skin Photos

**Service:** Cloud Storage for Firebase (backed by Google Cloud Storage)

**Pricing (Blaze Plan, US regions):**

| Resource | Free Tier | Pay-as-you-go |
|----------|-----------|---------------|
| Storage | 5 GB | $0.026/GB/month |
| Download bandwidth | 1 GB/day | $0.12/GB |
| Upload operations | 20K/day | $0.05/10K operations |
| Download operations | 50K/day | $0.004/10K operations |

**Best Practices for Skin Photo Storage:**

1. **Client-side compression before upload** -- Resize photos to a maximum useful resolution (e.g., 2048x2048 pixels for analysis, approximately 1-2 MB per image in JPEG at 85% quality). Raw 12MP phone photos (5-8 MB each) waste storage and bandwidth.

2. **Use the Firebase Resize Images Extension** -- Configure it to generate multiple sizes automatically on upload:
   - `original/` -- Full resolution for AI analysis (2048x2048)
   - `display/` -- Medium resolution for in-app viewing (800x800)
   - `thumb/` -- Thumbnail for lists and grids (200x200)

3. **Structured bucket organization:**
   ```
   gs://dermalvision-photos/
     users/{userId}/
       sessions/{sessionId}/
         original/{photoId}.jpg
         display/{photoId}.jpg
         thumb/{photoId}.jpg
     processing/{jobId}/        # Temporary processing artifacts
     exports/{userId}/          # User data export requests
   ```

4. **Use a dedicated bucket** for photos (separate from the default `*.appspot.com` bucket) to isolate costs, apply distinct lifecycle policies, and configure CMEK independently.

5. **Lifecycle policies:** Move photos older than 12 months to Nearline storage ($0.01/GB/month) and photos older than 36 months to Coldline ($0.004/GB/month) for inactive users.

6. **Network resiliency:** Firebase SDKs support automatic retry and resumable uploads, critical for large photo uploads on mobile networks.

**Deadline Warning:** Projects with `*.appspot.com` default buckets must upgrade to the Blaze plan by **February 3, 2026** to maintain access.

---

### 1.2 Firestore Data Modeling

**Pricing (Blaze Plan, US regions):**

| Operation | Free Tier | Pay-as-you-go |
|-----------|-----------|---------------|
| Reads | 50K/day | $0.06/100K reads |
| Writes | 20K/day | $0.18/100K writes |
| Deletes | 20K/day | $0.02/100K deletes |
| Storage | 1 GiB | $0.18/GiB/month |

**Complete Data Model Schema:**

```
// ROOT COLLECTIONS

users/{userId}
├── displayName: string
├── email: string
├── photoURL: string
├── authProvider: string          // "google", "apple", "email", "anonymous"
├── subscriptionTier: string      // "free", "premium", "pro"
├── subscriptionExpiry: timestamp
├── onboardingComplete: boolean
├── skinType: string              // "I" through "VI" (Fitzpatrick scale)
├── dateOfBirth: timestamp
├── concerns: string[]            // ["acne", "aging", "pigmentation"]
├── analysisCredits: number       // Remaining free-tier credits
├── createdAt: timestamp
├── updatedAt: timestamp
├── lastActiveAt: timestamp
├── settings: map
│   ├── notifications: boolean
│   ├── darkMode: boolean
│   ├── measurementUnit: string
│   └── privacyLevel: string      // "standard", "enhanced"
└── fcmTokens: string[]           // Push notification tokens

users/{userId}/monitoringSessions/{sessionId}
├── title: string                 // "Left cheek mole", "Forehead spot"
├── bodyRegion: string            // "face_left", "arm_right", etc.
├── bodyRegionLabel: string       // Human-readable label
├── status: string                // "active", "archived", "flagged"
├── photoCount: number            // Denormalized count
├── latestPhotoURL: string        // Denormalized for list view
├── latestAnalysisScore: number   // Denormalized risk score
├── reminderFrequency: string     // "weekly", "biweekly", "monthly"
├── nextReminderDate: timestamp
├── notes: string
├── tags: string[]
├── createdAt: timestamp
└── updatedAt: timestamp

users/{userId}/monitoringSessions/{sessionId}/photos/{photoId}
├── storagePathOriginal: string   // Path in Cloud Storage
├── storagePathDisplay: string
├── storagePathThumb: string
├── downloadURLThumb: string      // Denormalized for fast loading
├── capturedAt: timestamp
├── uploadedAt: timestamp
├── deviceModel: string
├── cameraSettings: map
│   ├── iso: number
│   ├── exposureTime: number
│   ├── focalLength: number
│   └── flashUsed: boolean
├── imageDimensions: map
│   ├── width: number
│   ├── height: number
│   └── fileSize: number
├── qualityScore: number          // 0-100, computed on upload
├── lightingAssessment: string    // "good", "acceptable", "poor"
├── analysisStatus: string        // "pending", "processing", "complete", "failed"
├── analysisId: string            // Reference to analysis result
└── metadata: map                 // Extensible metadata

users/{userId}/analysisResults/{analysisId}
├── sessionId: string
├── photoId: string
├── modelVersion: string          // e.g., "dermalvision-v2.1"
├── inferenceSource: string       // "cloud", "on_device"
├── overallRiskScore: number      // 0.0-1.0
├── riskLevel: string             // "low", "moderate", "high", "urgent"
├── classifications: array
│   ├── condition: string         // "melanoma", "basal_cell", "benign_nevus"
│   ├── confidence: number        // 0.0-1.0
│   └── icd10Code: string        // Optional medical code
├── features: map
│   ├── asymmetry: number
│   ├── borderIrregularity: number
│   ├── colorVariation: number
│   ├── diameter: number
│   └── evolution: number         // ABCDE criteria scores
├── changeDetection: map          // Compared to previous photo
│   ├── sizeChange: number        // Percentage
│   ├── colorChange: number
│   ├── shapeChange: number
│   └── comparedToPhotoId: string
├── recommendation: string        // "monitor", "consult_dermatologist"
├── disclaimer: string
├── processingTimeMs: number
├── createdAt: timestamp
└── expiresAt: timestamp          // For data retention policy

users/{userId}/chatHistory/{chatId}
├── sessionType: string           // "general", "photo_analysis", "follow_up"
├── relatedSessionId: string      // Optional link to monitoring session
├── messages: array               // For small conversations (<20 messages)
│   ├── role: string              // "user", "assistant", "system"
│   ├── content: string
│   ├── attachments: array
│   │   ├── type: string          // "photo", "analysis_result"
│   │   └── referenceId: string
│   ├── functionCalls: array      // Structured actions taken
│   │   ├── name: string
│   │   ├── arguments: map
│   │   └── result: map
│   └── timestamp: timestamp
├── tokenCount: number            // Total tokens used
├── modelUsed: string
├── createdAt: timestamp
└── updatedAt: timestamp

// For long conversations, use subcollection instead:
users/{userId}/chatHistory/{chatId}/messages/{messageId}
├── role: string
├── content: string
├── attachments: array
├── timestamp: timestamp
└── tokenCount: number

// ROOT COLLECTION for cross-user queries (admin dashboard)
analysisAggregates/{dateKey}      // "2026-02-11"
├── totalAnalyses: number
├── cloudInferences: number
├── onDeviceInferences: number
├── averageProcessingTime: number
├── riskDistribution: map
│   ├── low: number
│   ├── moderate: number
│   ├── high: number
│   └── urgent: number
└── updatedAt: timestamp

subscriptionEvents/{eventId}      // For audit trail
├── userId: string
├── eventType: string             // "purchase", "renewal", "cancellation", "expiry"
├── tier: string
├── platform: string              // "ios", "android"
├── receiptId: string
├── amount: number
├── currency: string
├── createdAt: timestamp
└── metadata: map
```

**Key Modeling Decisions:**

- **Subcollections for sessions/photos:** Since queries are almost always scoped to a single user, subcollections under `users/{userId}` are ideal. Use Collection Group Queries for any cross-user admin queries.
- **Denormalization:** Store `latestPhotoURL`, `photoCount`, and `latestAnalysisScore` directly on the session document to avoid extra reads when rendering list views.
- **Chat messages:** For short chats (<20 messages), embed as an array in the chat document. For longer conversations, use a `messages` subcollection. Documents have a 1 MB limit.
- **Root-level aggregates:** Use a root collection for daily analytics aggregates to support admin dashboards without scanning user subcollections.

---

### 1.3 Firebase Auth Configuration

**Recommended Auth Providers:**

| Provider | Use Case | Notes |
|----------|----------|-------|
| **Anonymous** | First-time onboarding | Let users explore the app before committing. Enable automatic cleanup (30-day expiry) to manage costs. |
| **Email/Password** | Standard registration | Combine with email verification. Consider email-link (passwordless) for reduced friction. |
| **Google Sign-In** | Low-friction Android/cross-platform | Most Android users have a Google account. |
| **Apple Sign-In** | Required for iOS | Required by Apple if any other third-party auth is offered. Configure Apple Private Email Relay for Firebase email sending. |

**Recommended Onboarding Flow:**

```
1. App Launch
   └── Sign in anonymously (auto)
       └── User explores free features
           └── Trigger account upgrade at:
               ├── First photo analysis
               ├── Saving a monitoring session
               ├── Accessing SkinShurpa chat
               └── Any premium feature
                   └── Show sign-in sheet (Google / Apple / Email)
                       └── Link credentials to anonymous account
                           └── UID preserved, all data retained
```

**Pricing (Firebase Auth with Identity Platform):**

| Tier | Spark (Free) | Blaze |
|------|-------------|-------|
| Monthly Active Users (MAU) | 3,000 DAU limit | 50K MAU free, then per-MAU pricing |
| Anonymous users | Counted against limit | Auto-cleanup excludes from billing |
| Phone auth | 10 SMS/day | $0.01-0.06/SMS |

**Implementation Details:**

- Use `linkWithCredential()` to upgrade anonymous accounts to permanent accounts. The UID remains the same, preserving all user data.
- Store the user's display name on first Apple Sign-In, as Apple only shares it once.
- Implement Firebase App Check for attestation to prevent abuse.
- Set rate limits to prevent sign-up abuse from the same IP address.

---

### 1.4 Firebase Cloud Functions for Backend Processing

**Runtime:** Node.js 20 or 22 (recommended), Python 3.13 also supported.

**Key Triggers for DermalVision:**

```typescript
// 1. Image Upload Trigger -- Preprocessing pipeline
export const onImageUploaded = onObjectFinalized(
  { bucket: "dermalvision-photos" },
  async (event) => {
    const filePath = event.data.name;
    // Guard: exit if not an image or already processed
    if (!filePath.startsWith("users/") || filePath.includes("/thumb/")) return;

    // Generate thumbnails (200x200, 800x800)
    // Validate image quality (blur detection, lighting)
    // Update Firestore photo document with URLs and quality score
    // Trigger AI analysis if quality passes threshold
  }
);

// 2. Analysis Request Trigger -- AI Pipeline
export const onAnalysisRequested = onDocumentCreated(
  "users/{userId}/analysisResults/{analysisId}",
  async (event) => {
    // Download image from Cloud Storage
    // Send to Vertex AI endpoint for classification
    // Update analysis document with results
    // Send push notification with results
    // Decrement user's analysis credits (free tier)
  }
);

// 3. Subscription Webhook -- RevenueCat events
export const onSubscriptionEvent = onRequest(async (req, res) => {
  // Validate RevenueCat webhook signature
  // Update user's subscriptionTier and subscriptionExpiry
  // Update Firebase Auth custom claims for feature gating
  // Log to subscriptionEvents collection
});

// 4. Scheduled Cleanup -- Daily maintenance
export const dailyCleanup = onSchedule("every day 03:00", async () => {
  // Archive old anonymous user data
  // Clean up orphaned storage files
  // Aggregate daily analytics
  // Check for expired subscriptions
});

// 5. Monitoring Reminder -- Push notifications
export const sendReminders = onSchedule("every day 09:00", async () => {
  // Query sessions with nextReminderDate <= today
  // Send FCM notifications
  // Update nextReminderDate
});
```

**Best Practices:**

- Co-locate functions with the Cloud Storage bucket region to minimize latency.
- Use `onInit()` hook for initialization code to avoid running it during deployment.
- Always return Promises in async handlers.
- Add guard clauses to prevent infinite loops (e.g., when a function writes back to the same collection that triggered it).
- Increase concurrency settings to reduce cold starts during traffic spikes.
- Use Pub/Sub for complex multi-step workflows to decouple processing stages.

---

### 1.5 Firebase Remote Config for Feature Flags

**Cost:** Free (no cost for any usage level).

**Recommended Configuration:**

```json
{
  "feature_flags": {
    "premium_analysis_enabled": {
      "defaultValue": false,
      "conditions": {
        "premium_users": true,
        "pro_users": true
      }
    },
    "skinshurpa_chat_enabled": {
      "defaultValue": false,
      "conditions": {
        "premium_users": true,
        "pro_users": true,
        "beta_testers": true
      }
    },
    "max_free_analyses_per_month": {
      "defaultValue": 3
    },
    "max_free_monitoring_sessions": {
      "defaultValue": 2
    },
    "max_free_photos_per_session": {
      "defaultValue": 5
    },
    "ai_model_version": {
      "defaultValue": "v2.1"
    },
    "enable_on_device_inference": {
      "defaultValue": true
    },
    "show_upgrade_prompt_after_n_analyses": {
      "defaultValue": 2
    },
    "time_lapse_comparison_enabled": {
      "defaultValue": false,
      "conditions": {
        "premium_users": true,
        "pro_users": true
      }
    },
    "maintenance_mode": {
      "defaultValue": false
    }
  }
}
```

**Implementation Pattern:**

- Fetch Remote Config values on app launch and cache locally.
- Use real-time config updates (supported since 2023) for instant flag changes without app restart.
- Combine with Firebase A/B Testing to test different free-tier limits and conversion prompts.
- Limit: 2,000 parameters and 500 conditions maximum.
- Audit flags quarterly to remove stale entries.

---

### 1.6 Offline-First Architecture with Firestore

**How It Works:**

- Firestore caches every document the client accesses locally on the device.
- Offline persistence is **enabled by default** on Android and iOS.
- When offline, reads serve from cache and writes queue locally.
- When connectivity returns, Firestore syncs local changes to the backend automatically.
- Conflict resolution: Last Write Wins (LWW) by server timestamp.

**Configuration for DermalVision:**

```swift
// iOS/Swift
let settings = FirestoreSettings()
settings.cacheSettings = PersistentCacheSettings(
    sizeBytes: 200 * 1024 * 1024  // 200 MB cache for photo metadata
)
Firestore.firestore().settings = settings
```

```kotlin
// Android/Kotlin
val settings = firestoreSettings {
    setLocalCacheSettings(persistentCacheSettings {
        setSizeBytes(200 * 1024 * 1024) // 200 MB
    })
}
Firebase.firestore.firestoreSettings = settings
```

**Offline-First Design Patterns:**

1. **Repository pattern:** Create a repository layer that abstracts local vs. remote data access. The repository is the single source of truth.
2. **Use `fromCache` and `hasPendingWrites` metadata** to show users whether they are viewing cached or server-confirmed data (e.g., "Analysis results pending sync").
3. **Use atomic field operations** (`FieldValue.increment()`, `FieldValue.arrayUnion()`) instead of read-modify-write patterns to minimize LWW conflicts.
4. **Do not rely on transactions offline** -- transactions are not persisted across app restarts. Use batch writes for atomic multi-document updates that may happen offline.
5. **Queue photo uploads:** When offline, save photos locally and queue uploads. Use a local database (SQLite/Realm) to track upload status, and process the queue when connectivity returns.
6. **Auth token handling:** Firebase persists the auth token across restarts, but if it expires while offline, write operations pause until re-authentication.

---

## 2. Google Cloud AI/ML Pipeline

### 2.1 Vertex AI for Custom Model Training

**Approach:** Train a custom skin condition classification model using Vertex AI.

**Two Training Options:**

| Method | Cost | Best For |
|--------|------|----------|
| **AutoML Image Classification** | ~$3.47/node-hour | Quick iteration, smaller datasets (<100K images), non-ML teams |
| **Custom Training (PyTorch/TF)** | $0.22-$5.18/hour depending on hardware | Large datasets, specialized architectures, fine-tuning pretrained models |

**Recommended Architecture:**

1. **Phase 1 (MVP):** Use AutoML Vision to train an initial classifier with available dermatology datasets (e.g., ISIC Archive, HAM10000, Dermnet). Budget ~50 node-hours for initial training ($175).

2. **Phase 2 (Production):** Custom training with a fine-tuned model (e.g., EfficientNet-B4 or Vision Transformer pretrained on ImageNet, fine-tuned on dermatology data). Use a T4 GPU instance ($0.40/GPU-hour) for cost-effective training.

3. **Phase 3 (On-Device):** Export the model to TFLite format for on-device inference. Use quantization (INT8) to reduce model size to <20 MB for mobile deployment.

**GPU Pricing for Custom Training:**

| GPU | Cost/hour | Use Case |
|-----|-----------|----------|
| Tesla T4 | $0.40 | Cost-effective training and inference |
| Tesla P100 | $1.84 | Medium-scale training |
| A100 | $2.93 | Large-scale training, fastest iteration |

**Free Tier:** $300 in Google Cloud credits for new accounts (90-day validity).

---

### 2.2 Cloud Vision API -- Skin-Relevant Features

The Cloud Vision API provides general-purpose image analysis. For DermalVision, relevant built-in capabilities include:

| Feature | Relevance | Limitations |
|---------|-----------|-------------|
| **Label Detection** | Can identify general categories (skin, mole, rash) | Not medically specific |
| **Face Detection** | Identifies facial landmarks, skin regions | Oriented toward facial analysis, not dermatology |
| **SafeSearch / Medical Content** | Flags medical imagery | Binary flag, not diagnostic |
| **Object Localization** | Can bound specific regions | Not trained on lesions |
| **Image Properties** | Dominant colors, crop hints | Useful for quality assessment |

**Verdict:** Cloud Vision API is **not suitable as the primary diagnostic engine**. It lacks specialized dermatological classification. Use it for:
- Image quality pre-screening (blur detection, lighting assessment)
- Face region detection (to identify facial skin areas)
- Content filtering (ensuring uploaded images are appropriate)

For actual skin condition classification, use a **custom Vertex AI model**.

---

### 2.3 Cloud Healthcare API

**Relevance:** Provides DICOM and FHIR compliance for medical imaging workflows.

**DICOM Support:**
- DICOMweb-compliant REST API for storing and retrieving medical images.
- Supports all standard medical imaging modalities.
- De-identification capabilities for research data.

**FHIR Support:**
- FHIR R4, STU3, and DSTU2 standards.
- Can store patient records, observations, and diagnostic reports in FHIR format.

**When to Use:**
- Required if DermalVision integrates with healthcare systems (EHR/EMR).
- Required if storing images in DICOM format for clinical use.
- Required if interoperating with hospital PACS systems.
- **Not required for consumer-grade monitoring app** unless pursuing FDA clearance or clinical partnerships.

**Recommendation:** Start without Healthcare API for the consumer app. Add it as an integration layer if/when pursuing clinical partnerships or regulatory clearance. The API is covered under the Google Cloud HIPAA BAA.

---

### 2.4 Model Serving: Comparison

| Service | Scale to Zero | GPU Support | MLOps Features | Cost Model | Best For |
|---------|---------------|-------------|----------------|------------|----------|
| **Cloud Run** | Yes | Yes | Manual setup | Pay-per-use | Cost-sensitive, variable traffic |
| **Cloud Functions** | Yes | No | Manual setup | Per-invocation | Lightweight preprocessing only |
| **Vertex AI Endpoints** | No | Yes | Built-in (A/B, monitoring, registry) | Always-on ($0.22+/hr) | Production ML with managed ops |

**Recommended Strategy:**

1. **Primary inference (Cloud):** Use **Cloud Run** with a custom container for skin classification. Scale-to-zero saves costs during off-peak hours. Cloud Run offers 2 million free requests/month.

2. **Fallback / Premium inference:** Use **Vertex AI Endpoints** only for the highest-accuracy model (larger architecture) for premium users or flagged cases requiring re-analysis.

3. **On-device inference (TFLite):** Deploy a quantized TFLite model via **Firebase ML** for:
   - Real-time preliminary screening (instant feedback)
   - Offline capability
   - Privacy-sensitive users
   - Reducing cloud inference costs

**Cost Optimization Decision Tree:**

```
User takes photo
  └── On-device TFLite model runs (FREE, instant)
      ├── Low risk (confidence > 0.9) → Show result, no cloud call
      ├── Moderate risk OR low confidence → Send to Cloud Run ($)
      │   └── Full cloud model analysis
      └── High risk → Send to Vertex AI Endpoint ($$)
          └── Highest-accuracy model + change detection
```

---

## 3. Image Processing Pipeline

### 3.1 End-to-End Pipeline Architecture

```
[Mobile Client]
    │
    ├── 1. Capture photo (guided UI with lighting/framing overlay)
    ├── 2. Client-side preprocessing:
    │      ├── Auto white-balance correction
    │      ├── Resize to 2048x2048 max
    │      ├── Compress to JPEG 85%
    │      └── Extract EXIF metadata
    ├── 3. Upload to Cloud Storage (resumable upload)
    │
    ▼
[Cloud Storage Trigger: onObjectFinalized]
    │
    ├── 4. Server-side validation:
    │      ├── Verify file type (JPEG/PNG/HEIC only)
    │      ├── Check file size (<10 MB)
    │      ├── Scan for malicious content
    │      └── Validate image dimensions
    │
    ├── 5. Image normalization:
    │      ├── Color calibration (standardize to sRGB)
    │      ├── Exposure correction (histogram equalization)
    │      ├── White balance adjustment
    │      └── Skin tone normalization
    │
    ├── 6. Thumbnail generation (via sharp or Pillow):
    │      ├── 200x200 thumbnail
    │      ├── 800x800 display version
    │      └── Store all versions in Cloud Storage
    │
    ├── 7. Quality assessment:
    │      ├── Blur detection (Laplacian variance)
    │      ├── Lighting quality score
    │      ├── Focus assessment
    │      └── Write quality score to Firestore
    │
    ├── 8. Update Firestore document with URLs and metadata
    │
    ▼
[Pub/Sub: analysis-request topic]
    │
    ├── 9. AI Analysis (Cloud Run or Vertex AI):
    │      ├── Download normalized image
    │      ├── Run classification model
    │      ├── Generate ABCDE scores
    │      ├── If previous photos exist:
    │      │      ├── Image registration/alignment
    │      │      └── Change detection analysis
    │      └── Write results to Firestore
    │
    ├── 10. Post-processing:
    │      ├── Generate analysis summary text
    │      ├── Determine recommendation
    │      └── Send push notification
    │
    ▼
[Result Available in App]
```

### 3.2 Image Normalization Pipeline

**Client-Side (before upload):**

```swift
// iOS example using Core Image
func normalizeImage(_ image: UIImage) -> UIImage {
    let ciImage = CIImage(image: image)!

    // 1. Auto white balance
    let wbFilter = CIFilter(name: "CITemperatureAndTint")!
    wbFilter.setValue(ciImage, forKey: kCIInputImageKey)
    wbFilter.setValue(CIVector(x: 6500, y: 0), forKey: "inputNeutral") // Daylight

    // 2. Auto exposure adjustment
    let exposureFilter = CIFilter(name: "CIExposureAdjust")!
    exposureFilter.setValue(wbFilter.outputImage, forKey: kCIInputImageKey)

    // 3. Auto tone mapping
    let toneFilter = CIFilter(name: "CIToneCurve")!
    // ... configure for skin tone preservation

    return renderToUIImage(toneFilter.outputImage!)
}
```

**Server-Side (Cloud Function with sharp/Pillow):**

```python
# Python Cloud Function using Pillow
from PIL import Image, ImageEnhance, ImageFilter
import numpy as np

def normalize_skin_image(image_path):
    img = Image.open(image_path)

    # 1. Convert to sRGB color space
    if img.mode != 'RGB':
        img = img.convert('RGB')

    # 2. Histogram equalization for exposure correction
    img_array = np.array(img)
    for channel in range(3):
        hist, bins = np.histogram(img_array[:,:,channel], 256, [0,256])
        cdf = hist.cumsum()
        cdf_normalized = cdf * hist.max() / cdf.max()
        # Apply CLAHE (Contrast Limited Adaptive Histogram Equalization)
        # for localized correction without over-brightening

    # 3. White balance via gray world assumption
    avg_r = img_array[:,:,0].mean()
    avg_g = img_array[:,:,1].mean()
    avg_b = img_array[:,:,2].mean()
    avg_all = (avg_r + avg_g + avg_b) / 3
    img_array[:,:,0] = np.clip(img_array[:,:,0] * (avg_all / avg_r), 0, 255)
    img_array[:,:,1] = np.clip(img_array[:,:,1] * (avg_all / avg_g), 0, 255)
    img_array[:,:,2] = np.clip(img_array[:,:,2] * (avg_all / avg_b), 0, 255)

    # 4. Quality metrics
    blur_score = detect_blur(img_array)  # Laplacian variance
    lighting_score = assess_lighting(img_array)

    return Image.fromarray(img_array.astype('uint8')), {
        'blur_score': blur_score,
        'lighting_score': lighting_score
    }
```

### 3.3 Time-Series Photo Comparison (Image Registration)

**Algorithm Pipeline for Skin Monitoring:**

```
Photo at T1 (baseline)     Photo at T2 (follow-up)
        │                           │
        ▼                           ▼
   Detect skin region          Detect skin region
        │                           │
        ▼                           ▼
   Extract keypoints           Extract keypoints
   (ORB/SIFT features)        (ORB/SIFT features)
        │                           │
        └──────────┬────────────────┘
                   ▼
          Feature matching
          (FLANN/BFMatcher)
                   │
                   ▼
          Compute homography
          (RANSAC)
                   │
                   ▼
          Warp T2 to align with T1
                   │
                   ▼
          Pixel-wise comparison:
          ├── Size change (area in pixels)
          ├── Color change (delta E in CIELAB)
          ├── Shape change (contour comparison)
          ├── Texture change (GLCM features)
          └── Border regularity change
```

**Implementation Approach:**

1. **Two-stage registration:**
   - **Coarse alignment:** Affine transformation using detected landmarks (body part boundaries, reference markers)
   - **Fine alignment:** Non-rigid deformation to account for skin stretching, different camera angles

2. **Evaluation metrics:**
   - Dice Coefficient for overlap assessment (target > 0.95)
   - Hausdorff Distance for boundary alignment
   - Structural Similarity Index (SSIM) for overall image similarity

3. **Practical simplification for consumer app:**
   - Use a guided capture overlay (silhouette matching) to minimize misalignment
   - Have users place a reference sticker near the area of interest for scale calibration
   - Use template matching rather than full deformable registration for MVP

### 3.4 Privacy: Image Encryption

**Encryption at Rest:**
- **Default:** All data in Cloud Storage and Firestore is encrypted at rest using AES-256 (Google-managed keys) at no extra cost.
- **CMEK (Customer-Managed Encryption Keys):** For additional control, use Cloud KMS to manage your own encryption keys. You control rotation, revocation, and access. Available for both Cloud Storage and Firestore. Additional cost: Cloud KMS key operations pricing.
- **Client-Side Encryption (optional):** Encrypt images on the device before upload for an additional layer. Data is then encrypted twice (client keys + server keys). Increases complexity but maximizes privacy.

**Encryption in Transit:**
- All Firebase/Google Cloud services use TLS 1.2+ for data in transit by default.
- No additional configuration required.

---

## 4. Subscription & Monetization Backend

### 4.1 RevenueCat vs. Direct Implementation

**Recommendation: Use RevenueCat**

| Factor | RevenueCat | Direct (StoreKit 2 + Play Billing) |
|--------|------------|-------------------------------------|
| **Setup time** | ~1.5 hours | ~2-4 weeks |
| **Cross-platform** | Single API for iOS + Android | Separate implementations |
| **Receipt validation** | Server-side, automatic | Must build your own server |
| **Subscription lifecycle** | Managed (renewals, grace periods, billing retry) | Must handle every edge case |
| **Analytics** | Built-in dashboard, charts, cohort analysis | Must build from scratch |
| **A/B testing paywalls** | Native, no code changes | Requires app updates |
| **Cost** | Free up to $2,500 MTR, then 1% of revenue | Free (but engineering cost) |
| **Webhooks** | Pre-built Firebase integration | Must build webhook handler |

**RevenueCat + Firebase Integration:**

RevenueCat provides a Firebase extension that:
- Stores purchase lifecycle events in Firestore automatically
- Updates customer purchase info and entitlements
- Sets Firebase Auth Custom Claims for subscription tier
- Enables Cloud Functions triggers on purchase events

### 4.2 Subscription Tiers Architecture

```
Tier Definitions (in RevenueCat + Remote Config):

FREE TIER
├── 3 AI analyses per month
├── 2 monitoring sessions
├── 5 photos per session
├── Basic risk assessment (on-device only)
├── No SkinShurpa chat
├── No time-lapse comparison
├── Ads shown
└── Standard image quality

PREMIUM ($6.99/month or $49.99/year)
├── 30 AI analyses per month
├── Unlimited monitoring sessions
├── Unlimited photos per session
├── Full cloud AI analysis
├── SkinShurpa AI chat (50 messages/month)
├── Time-lapse comparison
├── No ads
├── Priority processing
└── PDF reports

PRO ($14.99/month or $99.99/year)
├── Unlimited AI analyses
├── Everything in Premium
├── SkinShurpa AI chat (unlimited)
├── Advanced change detection
├── Multi-person profiles (family plan)
├── API access
├── Priority support
└── Early access to new features
```

**Firestore Subscription Schema:**

```
users/{userId}
├── subscriptionTier: "free" | "premium" | "pro"
├── subscriptionExpiry: timestamp
├── subscriptionPlatform: "ios" | "android"
├── revenuecatAppUserId: string
└── entitlements: map
    ├── premium_analysis: boolean
    ├── skinshurpa_chat: boolean
    ├── unlimited_sessions: boolean
    ├── time_lapse: boolean
    └── no_ads: boolean
```

### 4.3 Feature Gating Implementation

```typescript
// Cloud Function: Validate analysis request against subscription
export const validateAnalysisRequest = onCall(async (request) => {
    const userId = request.auth?.uid;
    if (!userId) throw new HttpsError('unauthenticated', 'Must be logged in');

    const userDoc = await db.doc(`users/${userId}`).get();
    const userData = userDoc.data();

    // Check subscription via custom claims (set by RevenueCat webhook)
    const claims = request.auth?.token;

    if (claims?.subscriptionTier === 'free') {
        // Check monthly analysis count
        const thisMonth = getStartOfMonth();
        const analysisCount = await db
            .collection(`users/${userId}/analysisResults`)
            .where('createdAt', '>=', thisMonth)
            .count()
            .get();

        const maxFree = await remoteConfig.getNumber('max_free_analyses_per_month');

        if (analysisCount.data().count >= maxFree) {
            throw new HttpsError('resource-exhausted',
                'Monthly analysis limit reached. Upgrade to Premium for more.');
        }
    }

    return { authorized: true };
});
```

### 4.4 Server-Side Receipt Validation

RevenueCat handles this automatically. If implementing directly:

```typescript
// Cloud Function: Validate Apple receipt
import { verifyReceipt } from 'node-apple-receipt-verify';

export const validateAppleReceipt = onCall(async (request) => {
    const { receiptData } = request.data;

    const result = await verifyReceipt({
        receipt: receiptData,
        password: process.env.APPLE_SHARED_SECRET,
        environment: ['production', 'sandbox'],
        excludeOldTransactions: true
    });

    // Update user subscription in Firestore
    await db.doc(`users/${request.auth.uid}`).update({
        subscriptionTier: mapProductToTier(result.latest_receipt_info),
        subscriptionExpiry: extractExpiry(result.latest_receipt_info),
        updatedAt: FieldValue.serverTimestamp()
    });

    // Set custom claims for client-side feature gating
    await auth.setCustomUserClaims(request.auth.uid, {
        subscriptionTier: mapProductToTier(result.latest_receipt_info)
    });

    return { success: true };
});
```

---

## 5. LLM Integration for SkinShurpa AI Assistant

### 5.1 Gemini API / Vertex AI Gemini

**Recommended Model:** Gemini 2.5 Flash (best cost-performance ratio for chat)

**Pricing:**

| Model | Input/1M tokens | Output/1M tokens | Context Window |
|-------|----------------|-------------------|----------------|
| Gemini 2.5 Flash | $0.15 | $0.60 | 1M tokens |
| Gemini 2.5 Flash-Lite | $0.10 | $0.40 | 1M tokens |
| Gemini 2.5 Pro | $1.25 | $10.00 | 1M tokens |

**Free Tier:** 1,000 requests/day on Google AI Studio (development).

### 5.2 SkinShurpa Chat Architecture

```
[Mobile Client]
    │
    ├── User sends message + optional photo attachment
    │
    ▼
[Cloud Function: skinshurpa_chat]
    │
    ├── 1. Validate subscription (chat entitlement)
    ├── 2. Build context:
    │      ├── System prompt (medical disclaimer, persona, guardrails)
    │      ├── User profile summary (skin type, concerns, age)
    │      ├── Relevant analysis history (last 3-5 results)
    │      ├── Current conversation history (last N messages)
    │      └── Attached photo (if any, as inline image)
    │
    ├── 3. Call Gemini API with function declarations
    │
    ├── 4. Handle function calls (if model requests):
    │      ├── analyzePhoto({photoId}) → trigger analysis pipeline
    │      ├── getAnalysisHistory({sessionId}) → retrieve past results
    │      ├── scheduleReminder({sessionId, frequency}) → set reminder
    │      ├── comparePhotos({photoId1, photoId2}) → trigger comparison
    │      └── suggestDermatologist({location}) → search providers
    │
    ├── 5. Return response to client
    ├── 6. Store message in Firestore
    └── 7. Track token usage for billing
```

### 5.3 System Prompt Design

```
You are SkinShurpa, a knowledgeable and empathetic AI skin health
assistant within the DermalVision app. Your role is to help users
understand their skin health, interpret analysis results, and provide
general skincare guidance.

CRITICAL GUARDRAILS:
- You are NOT a doctor. ALWAYS remind users that your guidance is
  informational, not medical advice.
- NEVER provide a definitive diagnosis. Use language like "this may
  suggest", "it could be consistent with", "a dermatologist could
  evaluate this further."
- For ANY high-risk finding (suspected melanoma, rapidly changing
  lesion, bleeding, pain), IMMEDIATELY recommend professional
  medical consultation.
- Do not recommend specific prescription medications.
- Be culturally sensitive regarding skin tones and conditions across
  Fitzpatrick skin types I-VI.

CAPABILITIES:
- Explain analysis results in plain language
- Compare photos over time and explain changes
- Provide general skincare tips
- Help users understand the ABCDE criteria for mole assessment
- Schedule monitoring reminders
- Answer questions about skin conditions generally

USER CONTEXT:
- Skin Type: {user.skinType}
- Age: {user.ageRange}
- Concerns: {user.concerns}
- Recent Analysis Summary: {recentAnalysisSummary}
```

### 5.4 Function Calling Integration

```typescript
const functionDeclarations = [
    {
        name: "analyzePhoto",
        description: "Trigger AI analysis of a specific photo",
        parameters: {
            type: "object",
            properties: {
                photoId: { type: "string", description: "The photo ID to analyze" },
                priority: { type: "string", enum: ["standard", "urgent"] }
            },
            required: ["photoId"]
        }
    },
    {
        name: "getAnalysisHistory",
        description: "Retrieve analysis results for a monitoring session",
        parameters: {
            type: "object",
            properties: {
                sessionId: { type: "string" },
                limit: { type: "number", description: "Number of results to retrieve" }
            },
            required: ["sessionId"]
        }
    },
    {
        name: "scheduleReminder",
        description: "Set or update a monitoring reminder for a session",
        parameters: {
            type: "object",
            properties: {
                sessionId: { type: "string" },
                frequency: { type: "string", enum: ["weekly", "biweekly", "monthly"] }
            },
            required: ["sessionId", "frequency"]
        }
    },
    {
        name: "comparePhotos",
        description: "Compare two photos to detect changes over time",
        parameters: {
            type: "object",
            properties: {
                photoId1: { type: "string", description: "Earlier photo ID" },
                photoId2: { type: "string", description: "Later photo ID" }
            },
            required: ["photoId1", "photoId2"]
        }
    }
];
```

### 5.5 Context Management Strategy

**Problem:** LLMs are stateless. Sending full history every time is expensive.

**Solution -- Tiered Context Strategy:**

```
TIER 1: Always included (~500 tokens)
├── System prompt
├── User profile summary (name, skin type, age, concerns)
└── Current subscription tier

TIER 2: Session-specific (~1,000 tokens)
├── Current monitoring session summary
├── Latest analysis result
└── Last 3-5 chat messages

TIER 3: On-demand via RAG (~variable)
├── Historical analysis results (retrieved only when relevant)
├── Photo metadata and comparisons
├── Previous chat summaries (from older conversations)
└── Relevant skincare knowledge base entries

TIER 4: Cached (90% cost reduction)
├── System prompt (identical across all users)
├── Medical disclaimer text
└── Skincare knowledge base
```

**Implementation:**

1. **Prompt caching:** Cache the system prompt prefix (identical for all users). Gemini supports automatic caching for prompts >1,024 tokens. Cached content costs 10% of normal input tokens.

2. **Conversation summarization:** After 20 messages, summarize the conversation so far into a 200-token summary and start a new context window. Store the full history in Firestore but only send the summary + recent messages to the LLM.

3. **RAG for medical history:** Store user analysis results in a structured format. When the user asks about past results, use a Cloud Function to retrieve relevant records and inject them into the prompt, rather than including all history by default.

### 5.6 Cost Management for LLM API Calls

**Estimated per-user costs (Gemini 2.5 Flash, thinking mode off):**

| User Type | Messages/month | Avg tokens/message | Monthly Cost |
|-----------|---------------|---------------------|--------------|
| Light (free trial) | 5 | 2,000 in + 500 out | $0.003 |
| Premium | 50 | 3,000 in + 800 out | $0.047 |
| Pro (heavy) | 200 | 4,000 in + 1,000 out | $0.24 |

**Cost Controls:**

1. **Per-user rate limiting:** Enforce message limits per tier via Cloud Functions.
2. **Model routing:** Use Gemini 2.5 Flash-Lite ($0.10/$0.40) for simple queries (FAQ, general skincare tips) and Gemini 2.5 Flash ($0.15/$0.60) for complex queries (analysis interpretation, photo comparison).
3. **Response caching:** Cache responses to common questions (e.g., "What is the ABCDE rule?") and serve cached responses for semantically similar queries.
4. **Token budget:** Set a maximum input token limit per request (e.g., 8K tokens). Truncate or summarize context if it exceeds the budget.
5. **Observability:** Use OpenTelemetry or Traceloop to track per-user token usage. Set alerts for anomalous spending patterns.

### 5.7 MCP (Model Context Protocol) Integration

**Firebase MCP Server (GA as of October 2025):**

The Firebase CLI includes a built-in MCP server that allows AI agents to interact with Firebase resources through natural language. For DermalVision, this enables:

1. **Development-time tooling:** AI coding assistants (Cursor, Claude Code, Gemini CLI) can explore Firestore data, debug Cloud Functions, and manage Firebase resources via natural language.

2. **Agent Development Kit (ADK):** Google's ADK supports MCP natively, allowing you to build multi-agent workflows where SkinShurpa can interact with Firebase services through standardized MCP tools.

3. **Configuration:**
   ```json
   // .idx/mcp.json or claude_desktop_config.json
   {
       "mcpServers": {
           "firebase": {
               "command": "npx",
               "args": ["-y", "firebase-tools@latest", "experimental:mcp"],
               "env": {
                   "GOOGLE_APPLICATION_CREDENTIALS": "/path/to/service-account.json"
               }
           }
       }
   }
   ```

4. **Available MCP tools (30+):** Firestore CRUD, Cloud Functions deployment, Auth user management, Storage operations, Data Connect schema generation, and more.

---

## 6. Security & Compliance

### 6.1 HIPAA Compliance with Firebase/GCloud

**Critical Understanding:** Firebase is **not inherently HIPAA compliant**. However, it can be **configured for HIPAA compliance** when used with Google Cloud Platform under a BAA.

**Required Steps:**

1. **Sign a BAA with Google Cloud.** The BAA covers Google Cloud's entire infrastructure. It is not subject to modification.

2. **Use only BAA-covered services:**

   | Service | Covered by BAA | Can Handle PHI |
   |---------|---------------|----------------|
   | Cloud Firestore | Yes | Yes |
   | Cloud Storage | Yes | Yes |
   | Cloud Functions | Yes | Yes |
   | Cloud Run | Yes | Yes |
   | Vertex AI | Yes | Yes |
   | BigQuery | Yes | Yes |
   | Firebase Authentication | Yes (limited) | Yes (UIDs, emails) |
   | Firebase Analytics | **No** | **No -- do not send PHI** |
   | Firebase Crashlytics | **No** | **No -- do not include PHI in logs** |
   | Firebase Remote Config | **No** | **No -- feature flags only, no PHI** |
   | Firebase Performance Monitoring | **No** | **No** |

3. **Do not send PHI to non-covered services.** This means:
   - Do NOT log PHI in Crashlytics reports
   - Do NOT include PHI in Analytics events
   - Do NOT store PHI in Remote Config parameters

4. **Configure encryption:**
   - Enable CMEK (Customer-Managed Encryption Keys) for Firestore and Cloud Storage
   - Use Cloud KMS for key management with automatic rotation

5. **Implement access controls:**
   - Use IAM with least-privilege principles
   - Restrict service account access
   - Enable VPC Service Controls for network-level isolation

6. **Enable audit logging:**
   - Turn on Cloud Audit Logs (Admin Activity, Data Access, System Event)
   - Export audit logs to Cloud Logging and BigQuery for retention

### 6.2 Firebase Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    // Helper functions
    function isAuthenticated() {
      return request.auth != null;
    }

    function isOwner(userId) {
      return request.auth.uid == userId;
    }

    function isPremiumOrPro() {
      return request.auth.token.subscriptionTier in ['premium', 'pro'];
    }

    function isValidAnalysisResult() {
      return request.resource.data.keys().hasAll([
        'sessionId', 'photoId', 'modelVersion',
        'overallRiskScore', 'riskLevel', 'createdAt'
      ]) &&
      request.resource.data.overallRiskScore >= 0 &&
      request.resource.data.overallRiskScore <= 1;
    }

    // User profiles -- users can only read/write their own
    match /users/{userId} {
      allow read: if isOwner(userId);
      allow create: if isOwner(userId);
      allow update: if isOwner(userId)
        && !request.resource.data.diff(resource.data).affectedKeys()
            .hasAny(['subscriptionTier', 'subscriptionExpiry', 'entitlements']);
        // Prevent client-side subscription manipulation

      // Monitoring sessions
      match /monitoringSessions/{sessionId} {
        allow read, create: if isOwner(userId);
        allow update: if isOwner(userId);
        allow delete: if isOwner(userId);

        // Photos within sessions
        match /photos/{photoId} {
          allow read: if isOwner(userId);
          allow create: if isOwner(userId);
          allow update: if false; // Photos are immutable after upload
          allow delete: if isOwner(userId);
        }
      }

      // Analysis results -- created by server only, read by user
      match /analysisResults/{analysisId} {
        allow read: if isOwner(userId);
        allow create: if false; // Server-side only via Admin SDK
        allow update: if false;
        allow delete: if false; // Retention policy handled server-side
      }

      // Chat history
      match /chatHistory/{chatId} {
        allow read: if isOwner(userId);
        allow create: if isOwner(userId) && isPremiumOrPro();
        allow update: if false; // Messages are append-only via server
        allow delete: if isOwner(userId);

        match /messages/{messageId} {
          allow read: if isOwner(userId);
          allow create: if false; // Server-side only
        }
      }
    }

    // Subscription events -- server-side only
    match /subscriptionEvents/{eventId} {
      allow read, write: if false;
    }

    // Analysis aggregates -- server-side only
    match /analysisAggregates/{dateKey} {
      allow read: if false; // Admin dashboard via Admin SDK
      allow write: if false;
    }
  }
}
```

```javascript
// Cloud Storage Security Rules
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /users/{userId}/{allPaths=**} {
      allow read: if request.auth != null && request.auth.uid == userId;
      allow write: if request.auth != null && request.auth.uid == userId
        && request.resource.size < 10 * 1024 * 1024  // 10 MB max
        && request.resource.contentType.matches('image/.*');
    }

    // Processing bucket -- server-side only
    match /processing/{allPaths=**} {
      allow read, write: if false;
    }
  }
}
```

### 6.3 Data Retention & GDPR Compliance

**Data Retention Policies:**

| Data Type | Retention Period | Deletion Method |
|-----------|-----------------|-----------------|
| User profile | Until account deletion | Firestore delete + Auth delete |
| Photos | Until session deletion or account deletion | Cloud Storage delete + Firestore cleanup |
| Analysis results | 24 months (auto-archive) | Cloud Function scheduled job |
| Chat history | 12 months | Cloud Function scheduled job |
| Subscription events | 7 years (financial records) | Anonymize after 2 years, delete after 7 |
| Audit logs | 12 months minimum | Cloud Logging retention policy |
| Analytics data | 14 months (Google default) | GA4 retention settings |

**Right to Deletion (GDPR Article 17) Implementation:**

```typescript
// Cloud Function: Handle user data deletion request
export const deleteUserData = onCall(async (request) => {
    const userId = request.auth?.uid;
    if (!userId) throw new HttpsError('unauthenticated', 'Must be logged in');

    // 1. Delete all photos from Cloud Storage
    const bucket = admin.storage().bucket('dermalvision-photos');
    await bucket.deleteFiles({ prefix: `users/${userId}/` });

    // 2. Delete all Firestore subcollections
    const userRef = db.doc(`users/${userId}`);
    await deleteSubcollections(userRef, [
        'monitoringSessions', 'analysisResults', 'chatHistory'
    ]);

    // 3. Delete user document
    await userRef.delete();

    // 4. Delete Firebase Auth account
    await auth.deleteUser(userId);

    // 5. Revoke RevenueCat access
    await revokeRevenueCatSubscription(userId);

    // 6. Log deletion event (anonymized)
    await db.collection('auditLog').add({
        action: 'user_data_deleted',
        anonymizedId: hashUserId(userId),
        timestamp: FieldValue.serverTimestamp(),
        // Do NOT log the actual userId -- it is deleted
    });

    // Google Cloud deletion commitment: complete within 180 days
    return { success: true, note: 'Data deletion initiated. Full purge within 180 days.' };
});
```

**Audit Logging:**

- Enable **Cloud Audit Logs** for all HIPAA-covered services (Admin Activity logs are always on; Data Access logs must be explicitly enabled).
- Export to BigQuery for long-term retention and querying.
- Use Cloud Logging's log-based metrics to create alerts for unusual access patterns.
- Maintain an application-level audit log in Firestore for user-facing actions (data access, exports, deletions).

---

## 7. Telemetry & Analytics

### 7.1 Firebase Analytics Custom Events

**Core Events for DermalVision:**

```typescript
// Analysis events
analytics.logEvent('analysis_started', {
    source: 'camera' | 'gallery',
    session_id: sessionId,
    subscription_tier: tier,
    inference_type: 'cloud' | 'on_device'
});

analytics.logEvent('analysis_completed', {
    risk_level: 'low' | 'moderate' | 'high' | 'urgent',
    processing_time_ms: duration,
    model_version: version,
    inference_type: 'cloud' | 'on_device'
});

analytics.logEvent('analysis_limit_reached', {
    subscription_tier: 'free',
    analyses_this_month: count
});

// Monitoring events
analytics.logEvent('session_created', {
    body_region: region,
    subscription_tier: tier
});

analytics.logEvent('photo_captured', {
    quality_score: score,
    lighting_assessment: assessment,
    session_photo_count: count
});

analytics.logEvent('time_lapse_compared', {
    days_between_photos: daysDiff,
    change_detected: boolean
});

// SkinShurpa events
analytics.logEvent('chat_message_sent', {
    message_type: 'text' | 'photo',
    conversation_length: messageCount,
    // Do NOT log message content (PHI risk)
});

analytics.logEvent('function_call_triggered', {
    function_name: name,
    // e.g., 'analyzePhoto', 'scheduleReminder'
});

// Conversion events
analytics.logEvent('upgrade_prompt_shown', {
    trigger: 'analysis_limit' | 'chat_limit' | 'feature_gate',
    subscription_tier: 'free'
});

analytics.logEvent('subscription_started', {
    tier: 'premium' | 'pro',
    trial: boolean,
    source: 'upgrade_prompt' | 'settings' | 'onboarding'
});
```

**Important HIPAA Note:** Do NOT log any PHI (protected health information) in analytics events. Do not log analysis results, condition names, risk scores, or any health-related content as event parameters. Log only behavioral metadata (counts, durations, tiers, categories).

### 7.2 Firebase Crashlytics

**Setup:**
- Enable Crashlytics for both iOS and Android builds.
- **Do NOT include PHI** in custom keys, logs, or user identifiers sent to Crashlytics (not covered by BAA).
- Use anonymized user identifiers (hashed UIDs) rather than real UIDs.

**Custom Keys for DermalVision:**

```swift
// iOS
Crashlytics.crashlytics().setCustomValue(subscriptionTier, forKey: "subscription_tier")
Crashlytics.crashlytics().setCustomValue(modelVersion, forKey: "ai_model_version")
Crashlytics.crashlytics().setCustomValue(inferenceType, forKey: "inference_type")
// DO NOT: Crashlytics.crashlytics().setCustomValue(riskLevel, forKey: "risk_level")
```

### 7.3 BigQuery Export for Advanced Analytics

**Setup:** Link Firebase project to BigQuery (free sandbox available).

**Exported Data:**
- Google Analytics events (all custom events with parameters)
- Crashlytics crash data and session data
- Performance Monitoring traces
- A/B Testing experiment results

**Streaming Export:** Available for Analytics and Crashlytics -- provides near-real-time data via intraday tables updated throughout the day.

**Daily Export Limit:** 1 million events/day for standard Google Analytics properties. Upgrade to GA 360 for higher limits.

**Sample BigQuery Queries for DermalVision:**

```sql
-- Daily analysis volume by subscription tier
SELECT
    DATE(TIMESTAMP_MICROS(event_timestamp)) AS date,
    (SELECT value.string_value FROM UNNEST(event_params)
     WHERE key = 'subscription_tier') AS tier,
    COUNT(*) AS analysis_count
FROM `project.analytics_123456789.events_*`
WHERE event_name = 'analysis_completed'
    AND _TABLE_SUFFIX BETWEEN '20260101' AND '20260131'
GROUP BY date, tier
ORDER BY date;

-- Conversion funnel: upgrade prompt to subscription
SELECT
    (SELECT value.string_value FROM UNNEST(event_params)
     WHERE key = 'trigger') AS upgrade_trigger,
    COUNT(DISTINCT user_pseudo_id) AS users_shown_prompt,
    COUNTIF(event_name = 'subscription_started') AS conversions
FROM `project.analytics_123456789.events_*`
WHERE event_name IN ('upgrade_prompt_shown', 'subscription_started')
    AND _TABLE_SUFFIX BETWEEN '20260101' AND '20260131'
GROUP BY upgrade_trigger;

-- Average analysis quality by device model
SELECT
    device.mobile_model_name,
    AVG(CAST((SELECT value.string_value FROM UNNEST(event_params)
         WHERE key = 'quality_score') AS FLOAT64)) AS avg_quality,
    COUNT(*) AS photo_count
FROM `project.analytics_123456789.events_*`
WHERE event_name = 'photo_captured'
GROUP BY device.mobile_model_name
HAVING photo_count > 100
ORDER BY avg_quality DESC;
```

### 7.4 Developer & Product Team Dashboards

**Recommended Stack:**

1. **Looker Studio (free):** Connect to BigQuery exports for custom dashboards. Firebase provides pre-built Crashlytics templates. Build additional dashboards for:
   - AI analysis volume and processing times
   - Subscription conversion funnels
   - Feature usage by tier
   - SkinShurpa chat engagement metrics

2. **Firebase Console:** Built-in dashboards for:
   - Crashlytics (crash-free rate, trends, top issues)
   - Analytics (event counts, user engagement, retention)
   - Performance Monitoring (app startup time, network latency)

3. **Custom Admin Dashboard (optional):** Build a simple web dashboard using Firebase Hosting + Firestore queries for:
   - Real-time analysis queue depth
   - Model accuracy metrics
   - Per-user LLM cost tracking
   - Subscription revenue overview

**Making Telemetry Digestible:**

- **Weekly automated email:** Use a Cloud Function to query BigQuery weekly and send a summary email to the team with key metrics (analyses performed, crash-free rate, subscription conversions, LLM costs).
- **Slack/Discord alerts:** Use Cloud Monitoring alerts for anomalies (crash spike, analysis failures, cost overruns).
- **Standardized event naming:** Use a consistent `category_action` naming convention (e.g., `analysis_completed`, `chat_message_sent`) so dashboards can easily group and filter.

---

## 8. CLI & Developer Tools

### 8.1 Firebase CLI

**Installation and Core Commands:**

```bash
# Install
npm install -g firebase-tools

# Login and initialize
firebase login
firebase init

# Key commands for DermalVision
firebase init firestore         # Initialize Firestore rules and indexes
firebase init storage           # Initialize Storage rules
firebase init functions         # Initialize Cloud Functions (Node.js 22)
firebase init hosting           # Initialize Hosting (admin dashboard)
firebase init emulators         # Initialize local emulators

# Deployment
firebase deploy --only firestore:rules
firebase deploy --only storage
firebase deploy --only functions
firebase deploy --only functions:onImageUploaded  # Deploy single function
firebase deploy                 # Deploy everything

# Emulators
firebase emulators:start        # Start all emulators
firebase emulators:start --only firestore,functions,storage,auth
firebase emulators:exec "npm test"  # Run tests against emulators
```

### 8.2 Local Emulator Suite

**Available Emulators:**
- Firestore, Auth, Cloud Storage, Cloud Functions, Pub/Sub, Hosting, Eventarc

**Emulator configuration (`firebase.json`):**

```json
{
    "emulators": {
        "auth": { "port": 9099 },
        "functions": { "port": 5001 },
        "firestore": { "port": 8080 },
        "storage": { "port": 9199 },
        "pubsub": { "port": 8085 },
        "ui": { "enabled": true, "port": 4000 }
    },
    "firestore": {
        "rules": "firestore.rules",
        "indexes": "firestore.indexes.json"
    },
    "storage": {
        "rules": "storage.rules"
    },
    "functions": [
        {
            "source": "functions",
            "codebase": "default",
            "runtime": "nodejs22"
        }
    ]
}
```

**Benefits for DermalVision Development:**
- Test image upload triggers without incurring Cloud Storage costs
- Test Firestore security rules locally before deploying
- Debug Cloud Functions with hot reloading
- Run integration tests against emulators in CI

### 8.3 Agentic CLI Tools with Firebase MCP Server

**Firebase MCP Server (GA, October 2025):**

The Firebase CLI includes a built-in MCP server with 30+ tools for interacting with Firebase resources via AI agents.

**Setup for Various AI IDEs:**

```json
// For Claude Desktop / Claude Code
// claude_desktop_config.json
{
    "mcpServers": {
        "firebase": {
            "command": "npx",
            "args": ["-y", "firebase-tools@latest", "experimental:mcp"],
            "env": {
                "GOOGLE_APPLICATION_CREDENTIALS": "./service-account.json"
            }
        }
    }
}
```

```json
// For Cursor / VS Code
// .cursor/mcp.json or .vscode/mcp.json
{
    "mcpServers": {
        "firebase": {
            "command": "npx",
            "args": ["-y", "firebase-tools@latest", "experimental:mcp"]
        }
    }
}
```

**What You Can Do with Firebase MCP:**

- Query Firestore collections in natural language ("Show me all users with premium subscriptions")
- Debug Cloud Functions by inspecting logs
- Manage Firebase Auth users
- Deploy and manage Cloud Functions
- Generate Data Connect schemas
- Explore Cloud Storage contents

**Gemini CLI Extension:**

```bash
# Install Gemini CLI
npm install -g @anthropic-ai/gemini-cli  # or equivalent

# Use Firebase extension
gemini --extension firebase

# Example: interact with your DermalVision backend
> "How many analysis results were created today?"
> "Show me the latest monitoring session for user X"
> "Deploy the onImageUploaded function"
```

### 8.4 CI/CD with GitHub Actions

**Authentication:** Use a Google Cloud service account (not the deprecated `FIREBASE_TOKEN`).

**Complete GitHub Actions Workflow:**

```yaml
# .github/workflows/deploy.yml
name: Deploy DermalVision Backend

on:
  push:
    branches: [main]
    paths:
      - 'functions/**'
      - 'firestore.rules'
      - 'storage.rules'
      - 'firestore.indexes.json'
  pull_request:
    branches: [main]
    paths:
      - 'functions/**'

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'npm'
          cache-dependency-path: functions/package-lock.json

      - name: Install dependencies
        run: cd functions && npm ci

      - name: Lint
        run: cd functions && npm run lint

      - name: Run unit tests
        run: cd functions && npm test

      - name: Install Firebase CLI
        run: npm install -g firebase-tools

      - name: Start emulators and run integration tests
        run: |
          firebase emulators:exec "cd functions && npm run test:integration" \
            --project demo-dermalvision

  deploy-preview:
    if: github.event_name == 'pull_request'
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: google-github-actions/auth@v2
        with:
          credentials_json: ${{ secrets.GCP_SA_KEY_STAGING }}

      - name: Deploy to staging
        run: |
          npm install -g firebase-tools
          firebase deploy --only functions,firestore:rules,storage \
            --project dermalvision-staging

  deploy-production:
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    needs: test
    runs-on: ubuntu-latest
    environment: production
    steps:
      - uses: actions/checkout@v4
      - uses: google-github-actions/auth@v2
        with:
          credentials_json: ${{ secrets.GCP_SA_KEY_PRODUCTION }}

      - name: Deploy to production
        run: |
          npm install -g firebase-tools
          firebase deploy --only functions,firestore:rules,storage \
            --project dermalvision-prod

      - name: Verify deployment
        run: |
          firebase functions:list --project dermalvision-prod
```

**Multi-Environment Strategy:**

| Branch | Environment | Firebase Project |
|--------|-------------|-----------------|
| `main` | Production | `dermalvision-prod` |
| `develop` | Staging | `dermalvision-staging` |
| Feature branches | PR Preview | `dermalvision-dev` (shared) |
| Local | Development | Emulators (no cloud project) |

---

## 9. Pricing Estimates

### Monthly Cost Estimates by Scale

#### Early Stage (1,000 MAU, 200 DAU)

| Service | Estimated Cost |
|---------|---------------|
| Firebase Auth | Free (under 50K MAU) |
| Firestore | Free tier covers most usage |
| Cloud Storage (5 GB) | Free tier |
| Cloud Functions | Free tier (2M invocations) |
| Vertex AI (AutoML training) | ~$175 one-time |
| Cloud Run (inference) | Free tier (2M requests) |
| Gemini API (SkinShurpa) | ~$5/month |
| RevenueCat | Free (under $2,500 MTR) |
| Firebase Analytics | Free |
| Crashlytics | Free |
| **Total** | **~$5-10/month** |

#### Growth Stage (10,000 MAU, 2,000 DAU)

| Service | Estimated Cost |
|---------|---------------|
| Firebase Auth | Free (under 50K MAU) |
| Firestore (50K reads/day, 10K writes/day) | ~$15/month |
| Cloud Storage (50 GB, 100 GB bandwidth) | ~$15/month |
| Cloud Functions (500K invocations) | ~$10/month |
| Cloud Run (skin analysis, 50K requests) | ~$20/month |
| Gemini API (SkinShurpa, ~2,000 active chatters) | ~$50/month |
| RevenueCat | Free or 1% of MTR |
| BigQuery export | Free sandbox |
| **Total** | **~$110-150/month** |

#### Scale Stage (100,000 MAU, 20,000 DAU)

| Service | Estimated Cost |
|---------|---------------|
| Firebase Auth | ~$50/month (over 50K MAU) |
| Firestore | ~$100-200/month |
| Cloud Storage (500 GB, 1 TB bandwidth) | ~$130/month |
| Cloud Functions | ~$100/month |
| Cloud Run (GPU, 500K analysis requests) | ~$200-400/month |
| Gemini API (SkinShurpa) | ~$300-500/month |
| RevenueCat | 1% of MTR |
| BigQuery | ~$50/month |
| Cloud KMS (CMEK) | ~$10/month |
| **Total** | **~$1,000-1,500/month** |

### Key Cost Optimization Levers

1. **On-device inference for 80%+ of analyses** -- eliminates cloud inference cost for low-risk, high-confidence results.
2. **Model routing for LLM** -- use Flash-Lite for simple queries, Flash for complex ones.
3. **Prompt caching** -- 90% reduction on repeated system prompts.
4. **Cloud Storage lifecycle policies** -- auto-tier to Nearline/Coldline for inactive users.
5. **Cloud Run scale-to-zero** -- no cost when no analyses are running.
6. **Denormalized Firestore documents** -- fewer reads per screen render.
7. **RevenueCat free tier** -- no cost until $2,500 monthly tracked revenue.

---

## 10. Recommended Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                        MOBILE CLIENT                            │
│  ┌──────────┐  ┌──────────┐  ┌───────────┐  ┌───────────────┐ │
│  │  Camera   │  │  Photo   │  │ SkinShurpa│  │  Monitoring   │ │
│  │  Capture  │  │  Gallery │  │   Chat    │  │   Sessions    │ │
│  └────┬─────┘  └────┬─────┘  └─────┬─────┘  └───────┬───────┘ │
│       │              │              │                │         │
│  ┌────┴──────────────┴──────────────┴────────────────┴───────┐ │
│  │              Firebase SDK Layer                            │ │
│  │  Auth | Firestore (offline) | Storage | Analytics | ML Kit│ │
│  └───────────────────────┬───────────────────────────────────┘ │
│                          │  TFLite Model (on-device inference) │
└──────────────────────────┼─────────────────────────────────────┘
                           │
                    ┌──────┴──────┐
                    │   Firebase   │
                    │   Services   │
                    └──────┬──────┘
                           │
          ┌────────────────┼────────────────┐
          │                │                │
   ┌──────┴──────┐ ┌──────┴──────┐ ┌───────┴───────┐
   │  Firestore   │ │   Cloud     │ │   Firebase    │
   │  (user data, │ │   Storage   │ │   Auth        │
   │   analyses,  │ │   (photos)  │ │  (email,      │
   │   chat)      │ │             │ │   Google,     │
   └──────┬──────┘ └──────┬──────┘ │   Apple)      │
          │                │        └───────────────┘
          │         ┌──────┴──────┐
          │         │  Storage    │
          │         │  Trigger    │
          │         └──────┬──────┘
          │                │
   ┌──────┴────────────────┴──────────────────────┐
   │            Cloud Functions                     │
   │  ┌──────────┐ ┌──────────┐ ┌───────────────┐ │
   │  │  Image    │ │ Analysis │ │  SkinShurpa   │ │
   │  │  Pipeline │ │ Trigger  │ │  Chat Handler │ │
   │  └────┬─────┘ └────┬─────┘ └───────┬───────┘ │
   │       │             │               │         │
   └───────┼─────────────┼───────────────┼─────────┘
           │             │               │
    ┌──────┴──────┐ ┌────┴────┐ ┌────────┴────────┐
    │   sharp /   │ │  Cloud  │ │   Vertex AI     │
    │   Pillow    │ │   Run   │ │   Gemini API    │
    │  (resize,   │ │ (custom │ │  (2.5 Flash)    │
    │  normalize) │ │  model) │ │                 │
    └─────────────┘ └────┬────┘ └─────────────────┘
                         │
                  ┌──────┴──────┐
                  │  Vertex AI  │
                  │  (training, │
                  │   model     │
                  │   registry) │
                  └─────────────┘

   ┌──────────────────────────────────────────────┐
   │          Supporting Services                   │
   │  ┌──────────┐ ┌──────────┐ ┌───────────────┐ │
   │  │ Revenue  │ │ Firebase │ │   BigQuery    │ │
   │  │   Cat    │ │ Remote   │ │   (analytics  │ │
   │  │(subscr.) │ │ Config   │ │    export)    │ │
   │  └──────────┘ └──────────┘ └───────┬───────┘ │
   │  ┌──────────┐ ┌──────────┐ ┌───────┴───────┐ │
   │  │  Cloud   │ │Crashlytics│ │ Looker Studio │ │
   │  │   KMS    │ │          │ │  (dashboards) │ │
   │  │ (CMEK)   │ │          │ │               │ │
   │  └──────────┘ └──────────┘ └───────────────┘ │
   └──────────────────────────────────────────────┘
```

---

## Sources

### Firebase Architecture
- [Firebase Pricing](https://firebase.google.com/pricing)
- [Cloud Storage for Firebase](https://firebase.google.com/docs/storage)
- [Firebase Resize Images Extension](https://extensions.dev/extensions/firebase/storage-resize-images)
- [Cloud Firestore Data Model](https://firebase.google.com/docs/firestore/data-model)
- [Choose a Data Structure](https://firebase.google.com/docs/firestore/manage-data/structure-data)
- [Firestore NoSQL Data Modeling](https://fireship.io/lessons/firestore-nosql-data-modeling-by-example/)
- [Firebase Authentication](https://firebase.google.com/docs/auth)
- [Best Practices for Anonymous Auth](https://firebase.blog/posts/2023/07/best-practices-for-anonymous-authentication/)
- [Cloud Functions for Firebase](https://firebase.google.com/docs/functions)
- [Cloud Storage Triggers](https://firebase.google.com/docs/storage/extend-with-functions)
- [Firebase Remote Config](https://firebase.google.com/docs/remote-config)
- [Access Data Offline](https://firebase.google.com/docs/firestore/manage-data/enable-offline)

### AI/ML Pipeline
- [Vertex AI Pricing](https://cloud.google.com/vertex-ai/pricing)
- [AutoML Image Classification Training](https://cloud.google.com/vertex-ai/docs/image-data/classification/train-model)
- [Cloud Vision API Features](https://cloud.google.com/vision/docs/features-list)
- [Cloud Healthcare API](https://cloud.google.com/healthcare-api)
- [Custom Models with ML Kit](https://developers.google.com/ml-kit/custom-models)
- [Cloud Run vs Cloud Functions](https://towardsdatascience.com/understand-and-compare-cloud-functions-vs-cloud-run-5afc2beb2fb/)
- [Reducing ML Inference Costs](https://medium.com/google-cloud/how-to-reduce-your-ml-model-inference-costs-on-google-cloud-e3d5e043980f)

### Image Processing
- [Auto White Balance for Skin Color](https://onlinelibrary.wiley.com/doi/full/10.1002/col.22970)
- [Medical Image Registration Review](https://pmc.ncbi.nlm.nih.gov/articles/PMC11351674/)
- [Deep Learning in Medical Image Registration](https://pmc.ncbi.nlm.nih.gov/articles/PMC7759388/)
- [Multimodal Skin Lesion Detection](https://www.frontiersin.org/journals/artificial-intelligence/articles/10.3389/frai.2025.1608837/full)

### Subscription & Monetization
- [RevenueCat](https://www.revenuecat.com/)
- [RevenueCat Firebase Integration](https://www.revenuecat.com/firebase/)
- [StoreKit 2 Overview](https://www.revenuecat.com/blog/engineering/storekit-2-overview/)
- [State of Subscription Apps 2025](https://www.revenuecat.com/state-of-subscription-apps-2025/)

### LLM Integration
- [Gemini API Pricing](https://ai.google.dev/gemini-api/docs/pricing)
- [Vertex AI Gemini Pricing](https://cloud.google.com/vertex-ai/generative-ai/pricing)
- [Introduction to Function Calling](https://cloud.google.com/vertex-ai/generative-ai/docs/multimodal/function-calling)
- [Gemini Live API](https://cloud.google.com/blog/products/ai-machine-learning/gemini-live-api-available-on-vertex-ai)
- [LLM Context Management Guide](https://eval.16x.engineer/blog/llm-context-management-guide)
- [Tracking LLM Token Usage Per User](https://www.traceloop.com/blog/from-bills-to-budgets-how-to-track-llm-token-usage-and-cost-per-user)

### MCP & Agent Tools
- [Firebase MCP Server GA](https://firebase.blog/posts/2025/10/firebase-mcp-server-ga/)
- [Firebase MCP Server Docs](https://firebase.google.com/docs/ai-assistance/mcp-server)
- [Agent Development Kit MCP](https://google.github.io/adk-docs/mcp/)
- [MCP Toolbox for Databases](https://cloud.google.com/blog/products/ai-machine-learning/mcp-toolbox-for-databases-now-supports-model-context-protocol)
- [Firebase Studio MCP](https://firebase.blog/posts/2025/07/supercharge-firebase-studio-with-mcp)

### Security & Compliance
- [HIPAA Compliance on Google Cloud](https://cloud.google.com/security/compliance/hipaa)
- [Firebase HIPAA Analysis](https://impanix.com/hipaa/is-firebase-hipaa-compliant/)
- [Firebase Security Rules](https://firebase.google.com/docs/rules)
- [Firestore Security Rules Conditions](https://firebase.google.com/docs/firestore/security/rules-conditions)
- [CMEK for Firestore](https://firebase.google.com/docs/firestore/cmek)
- [CMEK for Cloud Storage](https://cloud.google.com/storage/docs/encryption/customer-managed-keys)
- [Firebase Privacy and Security](https://firebase.google.com/support/privacy)
- [GDPR and Google Cloud](https://cloud.google.com/privacy/gdpr)

### Telemetry & Analytics
- [Export Data to BigQuery](https://firebase.google.com/docs/projects/bigquery-export)
- [Crashlytics BigQuery Export](https://firebase.google.com/docs/crashlytics/bigquery-export)
- [Custom BigQuery Dashboards](https://firebase.google.com/docs/crashlytics/bigquery-custom-dashboards)
- [Firebase Analytics Events](https://firebase.google.com/docs/analytics/events)

### CLI & Developer Tools
- [Firebase CLI Tools](https://github.com/firebase/firebase-tools)
- [Firebase CLI Release Notes](https://firebase.google.com/support/release-notes/cli)
- [Deploy via GitHub Actions](https://firebase.google.com/docs/hosting/github-integration)
- [GitHub Action for Firebase](https://github.com/marketplace/actions/github-action-for-firebase)
- [Firebase Cloud Functions Getting Started](https://firebase.google.com/docs/functions/get-started)
