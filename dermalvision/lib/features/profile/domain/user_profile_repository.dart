import 'user_profile.dart';

abstract class UserProfileRepository {
  Stream<UserProfile?> watchProfile(String uid);
  Future<void> createProfile(UserProfile profile);
  Future<void> updateProfile(UserProfile profile);
  Future<void> updateOnboardingStatus(String uid, bool isComplete);
}
