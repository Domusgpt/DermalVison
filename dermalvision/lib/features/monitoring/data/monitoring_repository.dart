import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../domain/monitoring_session.dart';
import '../domain/monitoring_repository.dart';

class FirebaseMonitoringRepository implements MonitoringRepository {
  FirebaseMonitoringRepository(this._firestore, this._storage);
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  @override
  Future<void> saveSession(
      String uid, MonitoringSession session, File imageFile) async {
    // 1. Upload Image
    final ref =
        _storage.ref().child('users/$uid/photos/originals/${session.id}.jpg');
    await ref.putFile(imageFile);
    final url = await ref.getDownloadURL();

    // 2. Update session with URL
    final sessionWithUrl = session.copyWith(
      photoUrls: session.photoUrls.copyWith(original: url),
    );

    // 3. Save to Firestore
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('sessions')
        .doc(session.id)
        .set(sessionWithUrl.toJson());

    // 4. Update zone lastSessionAt
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('zones')
        .doc(session.zoneId)
        .update({'lastSessionAt': FieldValue.serverTimestamp()});
  }

  @override
  Stream<List<MonitoringSession>> watchSessions(String uid, String zoneId) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('sessions')
        .where('zoneId', isEqualTo: zoneId)
        .orderBy('capturedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MonitoringSession.fromJson(doc.data()))
            .toList());
  }

  @override
  Stream<MonitoringSession?> watchSession(String uid, String sessionId) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('sessions')
        .doc(sessionId)
        .snapshots()
        .map((doc) => doc.exists && doc.data() != null
            ? MonitoringSession.fromJson(doc.data()!)
            : null);
  }
}
