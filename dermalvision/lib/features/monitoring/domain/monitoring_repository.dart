import 'dart:io';
import '../domain/monitoring_session.dart';

abstract class MonitoringRepository {
  Future<void> saveSession(
      String uid, MonitoringSession session, File imageFile);
  Stream<List<MonitoringSession>> watchSessions(String uid, String zoneId);
  Stream<MonitoringSession?> watchSession(String uid, String sessionId);
}
