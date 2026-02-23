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

## Compliance Mapping (HIPAA Technical Safeguards)

DermalVision implements the following technical safeguards as defined by the HIPAA Security Rule (45 CFR Part 164, Subpart C):

| HIPAA Rule | Requirement | DermalVision Implementation |
| :--- | :--- | :--- |
| **§164.312(a)(1)** | Access Control | Unique User Identification (Firebase Auth), IAM Roles, RBAC in Firestore. |
| **§164.312(a)(2)(iv)** | Encryption | Data encrypted in transit (TLS 1.3) and at rest (AES-256). |
| **§164.312(b)** | Audit Controls | Cloud Audit Logs enabled for all Admin SDK operations. Firestore access logged. |
| **§164.312(c)(1)** | Integrity | SHA-256 checksums on all uploaded images to detect tampering. |
| **§164.312(d)** | Person Authentication | MFA supported via Google Identity Platform (optional for users). |
| **§164.312(e)(1)** | Transmission Security | Certificate Pinning in mobile app to prevent MITM attacks. |

## Data Privacy & Governance

### Audit Logging
- **What is logged:** Login attempts (success/fail), Data Export requests, Account Deletion requests, Admin access to user data.
- **Retention:** Audit logs are retained in Google Cloud Logging for 1 year.
- **Alerting:** Suspicious activity (e.g., mass exports) triggers alerts to the Security Operations team.

### Supply Chain Security
- **SCA (Software Composition Analysis):** We use GitHub Dependabot and Snyk to scan dependencies for known vulnerabilities.
- **SBOM:** A Software Bill of Materials is generated for every release artifact.
- **Signing:** Release binaries (APK/IPA) are signed with hardware-backed keys (Cloud KMS).

## Infrastructure Security
- **Firebase:** We use Firebase App Check to verify app attestation and prevent abuse.
- **Cloud Functions:** Deployed with minimal IAM permissions (Principle of Least Privilege).
- **Vertex AI:** Private endpoints (VPC Service Controls) are used to isolate model access.

---

*Last Updated: 2026-02-22*
