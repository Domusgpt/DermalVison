# DermalVision Firestore Data Model

## Root Collections

### `users`
- **Document ID:** `uid` (Firebase Auth UID)
- **Fields:**
  - `email`: string
  - `displayName`: string
  - `createdAt`: timestamp
  - `skinType`: number (Fitzpatrick scale 1-6)
  - `subscriptionStatus`: string ('active', 'expired', 'trial')
  - `tier`: string ('free', 'plus', 'pro')
  - `fcmTokens`: map<string, timestamp> (Device tokens)

### `zones`
- **Document ID:** Auto-generated
- **Fields:**
  - `userId`: string (Reference to users/{uid})
  - `name`: string (e.g., "Left Cheek", "Forehead")
  - `type`: string ('face', 'body_general', 'mole')
  - `createdAt`: timestamp
  - `lastScanDate`: timestamp

### `sessions`
- **Document ID:** Auto-generated (sessionId)
- **Fields:**
  - `userId`: string
  - `zoneId`: string
  - `timestamp`: timestamp
  - `status`: string ('pending', 'processing', 'completed', 'failed')
  - `imageStoragePath`: string (gs://dermalvision-prod.appspot.com/...)
  - `thumbnailUrl`: string
  - `analysisResults`: map (See below)
  - `metadata`: map
    - `lighting`: string ('good', 'poor')
    - `distance`: number (cm)
    - `device`: string

### `conversations` (Sub-collection of `users`)
- **Document ID:** Auto-generated (convId)
- **Fields:**
  - `startedAt`: timestamp
  - `lastMessageAt`: timestamp
  - `title`: string
  - `context`: map (sessionId, zoneId)

#### `messages` (Sub-collection of `conversations`)
- **Document ID:** Auto-generated
- **Fields:**
  - `role`: string ('user', 'model', 'system')
  - `content`: string
  - `timestamp`: timestamp
  - `attachments`: list<string> (URLs)

## Analysis Result Schema
Stored within the `sessions` document or as a sub-collection for detailed reports.

```json
{
  "acne": {
    "severity": 2, // Mild
    "lesionCount": 5,
    "grade": "Grade 2"
  },
  "wrinkles": {
    "score": 15, // Low
    "depthMapUrl": "gs://..."
  },
  "pigmentation": {
    "score": 30
  },
  "medgemma": {
    "topPrediction": "Benign Nevus",
    "confidence": 0.92,
    "referralRecommended": false
  }
}
```

## Security Rules (Summary)
- **Users:** Read/Write only own document ().
- **Sessions/Zones:** Read/Write only if  matches .
- **Public Data:** None.
- **Analysis Results:** Read-only for users (written by Admin SDK).
