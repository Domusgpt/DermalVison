import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/user_profile.dart';
import '../domain/user_profile_repository.dart';

class FirebaseUserProfileRepository implements UserProfileRepository {
  FirebaseUserProfileRepository(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Stream<UserProfile?> watchProfile(String uid) {
    return _firestore.collection('users').doc(uid).snapshots().map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        return UserProfile.fromJson(snapshot.data()!);
      }
      return null;
    });
  }

  @override
  Future<void> createProfile(UserProfile profile) {
    return _firestore.collection('users').doc(profile.uid).set(profile.toJson());
  }

  @override
  Future<void> updateProfile(UserProfile profile) {
    return _firestore.collection('users').doc(profile.uid).update(profile.toJson());
  }

  @override
  Future<void> updateOnboardingStatus(String uid, bool isComplete) {
     return _firestore.collection('users').doc(uid).update({'onboardingComplete': isComplete});
  }
}
