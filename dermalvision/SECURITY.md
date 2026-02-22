# Security Policy

## Supported Versions

Only the latest major version of DermalVision is supported with security updates.

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

We take security seriously. If you discover a vulnerability, please report it immediately.

**DO NOT** create a public GitHub issue for security vulnerabilities.

Please email **security@dermalvision.com** with the following details:
- Description of the vulnerability.
- Steps to reproduce.
- Potential impact.

We will acknowledge your report within 48 hours and provide a timeline for a fix.

## Data Privacy & Compliance

### HIPAA & GDPR
While DermalVision is designed for wellness, we adhere to HIPAA and GDPR principles:
- **Encryption:** All data is encrypted in transit (TLS 1.3) and at rest (AES-256).
- **Access Control:** Strict IAM policies and Firestore Security Rules ensure data isolation.
- **Redaction:** PII is stripped from logs and analytics.
- **Data Residency:** All data is stored in `us-central1` (USA) unless otherwise configured.

### AI Safety
- **SafeSearch:** All uploaded images are screened for inappropriate content before processing.
- **Disclaimer:** AI analysis is for informational purposes only and does not constitute a medical diagnosis. Users must agree to this before using the app.

## Infrastructure Security
- **Firebase:** We use Firebase App Check to prevent abuse.
- **Cloud Functions:** Deployed with minimal IAM permissions (Principle of Least Privilege).
- **Vertex AI:** Private endpoints are used where possible.

---

*Last Updated: 2026-02-22*
