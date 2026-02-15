import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'monitoring_repository.dart';
import '../data/monitoring_repository.dart';

part 'monitoring_provider.g.dart';

@Riverpod(keepAlive: true)
MonitoringRepository monitoringRepository(MonitoringRepositoryRef ref) {
  return FirebaseMonitoringRepository(
    FirebaseFirestore.instance,
    FirebaseStorage.instance,
  );
}
