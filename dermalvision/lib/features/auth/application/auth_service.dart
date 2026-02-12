import 'package:dermalvision/shared/models/user_state.dart';

abstract class AuthService {
  Future<UserState> signInAnonymously();
  Future<UserState> signOut();
}

class LocalAuthService implements AuthService {
  const LocalAuthService();

  @override
  Future<UserState> signInAnonymously() async {
    return const UserState(
      authStatus: AuthStatus.authenticated,
      onboardingComplete: false,
    );
  }

  @override
  Future<UserState> signOut() async {
    return const UserState(
      authStatus: AuthStatus.anonymous,
      onboardingComplete: false,
    );
  }
}
