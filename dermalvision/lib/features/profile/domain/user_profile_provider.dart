import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../auth/domain/auth_provider.dart';
import 'user_profile.dart';
import 'user_profile_repository.dart';
import '../data/user_profile_repository.dart';

part 'user_profile_provider.g.dart';

@Riverpod(keepAlive: true)
UserProfileRepository userProfileRepository(UserProfileRepositoryRef ref) {
  return FirebaseUserProfileRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<UserProfile?> userProfile(UserProfileRef ref) {
  final authState = ref.watch(authStateProvider);
  return authState.when(
    data: (user) {
      if (user == null) return const Stream.empty();
      return ref.watch(userProfileRepositoryProvider).watchProfile(user.uid);
    },
    error: (_, __) => const Stream.empty(),
    loading: () => const Stream.empty(),
  );
}
