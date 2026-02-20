import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/body_zone.dart';
import '../domain/body_zone_repository.dart';

class FirebaseBodyZoneRepository implements BodyZoneRepository {
  FirebaseBodyZoneRepository(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Stream<List<BodyZone>> watchZones(String uid) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('zones')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => BodyZone.fromJson(doc.data())).toList();
    });
  }

  @override
  Future<void> addZone(String uid, BodyZone zone) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('zones')
        .doc(zone.id)
        .set(zone.toJson());
  }

  @override
  Future<void> updateZone(String uid, BodyZone zone) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('zones')
        .doc(zone.id)
        .update(zone.toJson());
  }

  @override
  Future<void> deleteZone(String uid, String zoneId) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('zones')
        .doc(zoneId)
        .delete();
  }

  @override
  Future<BodyZone?> getZone(String uid, String zoneId) async {
    final doc = await _firestore
        .collection('users')
        .doc(uid)
        .collection('zones')
        .doc(zoneId)
        .get();
    if (doc.exists && doc.data() != null) {
      return BodyZone.fromJson(doc.data()!);
    }
    return null;
  }
}
