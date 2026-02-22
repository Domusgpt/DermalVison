# DermalVision Cloud API Documentation

## Overview
DermalVision utilizes Firebase Cloud Functions (v2) for backend logic, AI orchestration, and third-party integrations. All functions are deployed to the `us-central1` region.

## Authentication
All callable functions require a valid Firebase Auth ID token. HTTP triggers (if any) are secured via IAM or require an `Authorization` header with a valid ID token.

## Cloud Functions

### 1. Analysis Orchestrator
**Trigger:** Firestore `onCreate` (document: `analysis_requests/{requestId}`) or Storage `onFinalize` (bucket path: `uploads/{uid}/{sessionId}/raw.jpg`)
**Description:** Orchestrates the multi-model analysis pipeline.
- **Inputs:** `sessionId`, `imageUrl`, `zoneId`
- **Process:**
  1.  Validates request and user subscription tier.
  2.  Dispatches parallel calls to Vertex AI (MedGemma, Acne Model, Wrinkle Model).
  3.  Aggregates results into a unified `AnalysisResult` object.
  4.  Updates Firestore document `sessions/{sessionId}` with results.
  5.  Triggers push notification via FCM.

### 2. SkinShurpa AI Assistant
**Trigger:** HTTPS Callable `chatWithSkinShurpa`
**Description:** Handles conversational AI interactions with context awareness.
- **Request Body:**
  ```json
  {
    "message": "Is this spot normal?",
    "context": {
      "sessionId": "session_123",
      "zoneId": "face_left_cheek"
    }
  }
  ```
- **Response:** Streaming `text/event-stream` or JSON with Markdown-formatted response.

### 3. Subscription Management
**Trigger:** HTTPS Callable `handleRevenueCatWebhook`
**Description:** Processes subscription status updates from RevenueCat.
- **Events:** `INITIAL_PURCHASE`, `RENEWAL`, `CANCELLATION`, `EXPIRATION`.
- **Action:** Updates `users/{uid}` with `subscriptionStatus` and `tier`.

### 4. Notification Scheduler
**Trigger:** Pub/Sub Schedule (Daily/Weekly)
**Description:** Checks user preferences and scheduling rules to send reminder notifications.
- **Logic:**
  - Queries active schedules in `schedules/{scheduleId}`.
  - Checks if a scan was already performed today.
  - Sends FCM message if reminder is due.

## Vertex AI Endpoints

### MedGemma 1.5 (Skin Condition Classifier)
- **Endpoint ID:** `projects/dermalvision-prod/locations/us-central1/endpoints/MEDGEMMA_ID`
- **Input:** Base64 encoded image or GCS URI.
- **Output:** Probability distribution over 40+ dermatological conditions.

### Custom Acne Severity Model
- **Endpoint ID:** `projects/dermalvision-prod/locations/us-central1/endpoints/ACNE_ID`
- **Input:** Cropped face regions (forehead, cheeks, chin).
- **Output:** Severity Grade (0-4) and lesion count.

## Error Handling
All functions return standard HTTP error codes:
- `400 Bad Request`: Invalid input or missing parameters.
- `401 Unauthorized`: Missing or invalid auth token.
- `403 Forbidden`: Insufficient subscription tier.
- `500 Internal Server Error`: Analysis failure or timeout.
