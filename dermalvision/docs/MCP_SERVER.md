# DermalVision MCP Server Documentation

## Overview
The DermalVision Model Context Protocol (MCP) server allows external AI agents (like Claude Desktop) to interact with the DermalVision ecosystem. It exposes tools to query analysis data, check user status, and export skin monitoring records.

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

## Tool Definitions (JSON Schema)

### 1. `get_user_status`
Retrieves a user's subscription tier, skin type, and recent activity.

**Schema:**
```json
{
  "name": "get_user_status",
  "description": "Get profile summary and subscription status.",
  "inputSchema": {
    "type": "object",
    "properties": {
      "uid": {
        "type": "string",
        "description": "Firebase Auth User ID"
      }
    },
    "required": ["uid"]
  }
}
```

### 2. `list_sessions`
List monitoring sessions for a specific user, sorted by date (descending).

**Schema:**
```json
{
  "name": "list_sessions",
  "description": "List recent analysis sessions.",
  "inputSchema": {
    "type": "object",
    "properties": {
      "uid": { "type": "string" },
      "limit": { "type": "integer", "default": 5, "maximum": 20 }
    },
    "required": ["uid"]
  }
}
```

### 3. `get_analysis_detail`
Fetch the full AI analysis report for a specific session.

**Schema:**
```json
{
  "name": "get_analysis_detail",
  "description": "Get detailed AI results (acne score, wrinkle depth, etc.).",
  "inputSchema": {
    "type": "object",
    "properties": {
      "sessionId": { "type": "string" }
    },
    "required": ["sessionId"]
  }
}
```

## Context & Error Handling

### Context Management
- The MCP server is stateless.
- It does not store conversation history. Agents must maintain their own context window.
- Large responses (e.g., `export_zone_history`) may be truncated if they exceed 100KB.

### Error Propagation
Errors are returned as standard MCP tool errors:
```json
{
  "isError": true,
  "content": [
    {
      "type": "text",
      "text": "Error: User not found (404)"
    }
  ]
}
```
