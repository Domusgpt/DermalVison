import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../auth/domain/auth_provider.dart';
import 'body_zone.dart';
import 'body_zone_repository.dart';
import '../data/body_zone_repository.dart';

part 'body_zone_provider.g.dart';

@Riverpod(keepAlive: true)
BodyZoneRepository bodyZoneRepository(BodyZoneRepositoryRef ref) {
  return FirebaseBodyZoneRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<BodyZone>> bodyZones(BodyZonesRef ref) {
  final authState = ref.watch(authStateProvider);
  return authState.when(
    data: (user) {
      if (user == null) return const Stream.empty();
      return ref.watch(bodyZoneRepositoryProvider).watchZones(user.uid);
    },
    error: (_, __) => const Stream.empty(),
    loading: () => const Stream.empty(),
  );
}
