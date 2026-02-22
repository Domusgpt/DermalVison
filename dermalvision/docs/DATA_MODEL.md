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

## Data Governance & Compliance

### 1. Indexing Strategy
To support complex queries, the following **Composite Indexes** are required:

| Collection | Fields (Asc/Desc) | Query Purpose |
| :--- | :--- | :--- |
| `sessions` | `userId` (Asc), `timestamp` (Desc) | List user sessions by date |
| `sessions` | `userId` (Asc), `zoneId` (Asc), `timestamp` (Desc) | Filter sessions by body zone |
| `conversations` | `userId` (Asc), `lastMessageAt` (Desc) | Recent chats list |

### 2. Data Retention & Lifecycle
- **Raw Images:** Stored in Google Cloud Storage.
  - **Retention:** 3 Years (active users), 30 Days (deleted accounts).
  - **Cold Storage:** Moved to Nearline after 90 days.
- **Analysis Data:** Stored in Firestore indefinitely for longitudinal tracking unless deleted by user.
- **Chat Logs:** Retained for 1 year for context, then anonymized or deleted.

### 3. Backup & Disaster Recovery
- **Firestore:** Automated daily backups via Google Cloud Backup/Restore (PITR enabled, 7-day window).
- **Storage:** Object Versioning enabled for raw image buckets.
- **RTO (Recovery Time Objective):** 4 hours.
- **RPO (Recovery Point Objective):** 1 hour.

### 4. GDPR/CCPA Compliance
- **Right to Access:** Use `exportUserData(uid)` Cloud Function to generate a JSON dump.
- **Right to be Forgotten:** Use `deleteUserAccount(uid)` to:
  - Recursively delete Firestore docs.
  - Delete Storage bucket folder `uploads/{uid}`.
  - Remove Auth record.
