import 'body_zone.dart';

abstract class BodyZoneRepository {
  Stream<List<BodyZone>> watchZones(String uid);
  Future<void> addZone(String uid, BodyZone zone);
  Future<void> updateZone(String uid, BodyZone zone);
  Future<void> deleteZone(String uid, String zoneId);
  Future<BodyZone?> getZone(String uid, String zoneId);
}
