# DermalVision MCP Server Documentation

## Overview
The DermalVision Model Context Protocol (MCP) server allows external AI agents to interact with the DermalVision ecosystem. It exposes tools to query analysis data, check user status, and export skin monitoring records.

## Installation & Running

### Prerequisites
- Node.js 18+
- Valid Service Account Key with Firestore Read permissions.

### Local Development
```bash
cd functions/mcp-server
npm install
node index.js
# Server starts on stdio or SSE transport (default: port 3001)
```

### Production Deployment
Deployed as a Cloud Run service:
```bash
gcloud run deploy dermalvision-mcp --source . --region us-central1
```

## Available Tools

### `get_user_status`
- **Description:** Retrieve a user's subscription tier, skin type, and recent activity.
- **Parameters:**
  - `uid` (string): The Firebase Auth UID of the user.

### `list_sessions`
- **Description:** List monitoring sessions for a specific user.
- **Parameters:**
  - `uid` (string): User ID.
  - `limit` (number, optional): Max number of sessions (default 5).

### `get_analysis_detail`
- **Description:** Fetch the full AI analysis report for a specific session.
- **Parameters:**
  - `sessionId` (string): The session ID.

### `export_zone_history`
- **Description:** Export a CSV-formatted history of a specific body zone's analysis over time.
- **Parameters:**
  - `uid` (string): User ID.
  - `zoneId` (string): Body zone ID (e.g., "face_forehead").

## Security
- The MCP server operates with a dedicated Service Account.
- Access to the MCP endpoint should be restricted to authorized agent clients.
- PII (Personally Identifiable Information) is redacted from tool outputs where possible.
