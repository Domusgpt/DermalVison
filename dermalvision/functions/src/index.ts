import { onObjectFinalized } from "firebase-functions/v2/storage";
import { getFirestore } from "firebase-admin/firestore";
import { initializeApp } from "firebase-admin/app";
import * as logger from "firebase-functions/logger";

initializeApp();
const db = getFirestore();

export const processUploadedImage = onObjectFinalized(
  {
    region: "us-central1",
    memory: "1GiB",
    timeoutSeconds: 300,
  },
  async (event) => {
    const filePath = event.data.name;
    if (!filePath || !filePath.includes("originals")) return;

    const parts = filePath.split('/');
    if (parts.length < 5) return;
    const uid = parts[1];
    const fileName = parts[4];
    const sessionId = fileName.split('.')[0];

    // Mock processing & Analysis
    const mediaLink = event.data.mediaLink;

    // Simulate latency
    await new Promise(resolve => setTimeout(resolve, 2000));

    // Create Analysis Result
    const analysisId = db.collection(`users/${uid}/analyses`).doc().id;
    const analysisData: any = {
        id: analysisId,
        sessionId: sessionId,
        zoneId: "unknown",
        analyzedAt: new Date().toISOString(),
        results: {
            acne: {
                detected: true,
                severity: 0.3,
                classification: "Mild"
            },
            wrinkles: {
                detected: false,
                severity: 0.1
            }
        },
        compositeScores: {
            overallHealth: 88.5,
            skinAge: 28
        },
        summary: "Skin looks healthy with mild acne indications.",
        referralTriggered: false
    };

    // Transaction to update session and create analysis
    try {
        await db.runTransaction(async (t) => {
            const sessionRef = db.collection(`users/${uid}/sessions`).doc(sessionId);
            const sessionDoc = await t.get(sessionRef);
            if (!sessionDoc.exists) return;

            const zoneId = sessionDoc.data()?.zoneId;
            analysisData.zoneId = zoneId;

            const analysisRef = db.collection(`users/${uid}/analyses`).doc(analysisId);

            t.set(analysisRef, analysisData);
            t.update(sessionRef, {
                analysisStatus: 'complete',
                analysisId: analysisId,
                'photoUrls.normalized': mediaLink,
                'photoUrls.thumbnail128': mediaLink
            });
        });
        logger.info(`Analysis ${analysisId} created for session ${sessionId}`);
    } catch (e) {
        logger.error("Error running analysis transaction", e);
    }
  }
);
