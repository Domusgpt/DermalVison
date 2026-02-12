import 'package:dermalvision/features/auth/application/auth_service.dart';
import 'package:dermalvision/shared/models/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return const LocalAuthService();
});

class AuthController extends StateNotifier<UserState> {
  AuthController(this._authService)
      : super(
          const UserState(
            authStatus: AuthStatus.anonymous,
            onboardingComplete: false,
          ),
        );

  final AuthService _authService;

  Future<void> signInAnonymously() async {
    state = await _authService.signInAnonymously();
  }

  Future<void> signOut() async {
    state = await _authService.signOut();
  }

  void completeOnboarding() {
    state = state.copyWith(onboardingComplete: true);
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, UserState>(
  (ref) => AuthController(ref.watch(authServiceProvider)),
);
