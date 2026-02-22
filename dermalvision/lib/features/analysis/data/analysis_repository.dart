import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/analysis_result.dart';
import '../domain/analysis_repository.dart';

class FirebaseAnalysisRepository implements AnalysisRepository {
  FirebaseAnalysisRepository(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Stream<AnalysisResult?> watchAnalysis(String uid, String analysisId) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('analyses')
        .doc(analysisId)
        .snapshots()
        .map((doc) => doc.exists && doc.data() != null
            ? AnalysisResult.fromJson(doc.data()!)
            : null);
  }

  @override
  Stream<List<AnalysisResult>> watchAnalysisHistory(String uid, String zoneId) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('analyses')
        .where('zoneId', isEqualTo: zoneId)
        .orderBy('analyzedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => AnalysisResult.fromJson(doc.data()))
            .toList());
  }
}
