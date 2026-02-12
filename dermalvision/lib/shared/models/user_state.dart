enum AuthStatus { anonymous, authenticated }

class UserState {
  const UserState({
    required this.authStatus,
    required this.onboardingComplete,
  });

  final AuthStatus authStatus;
  final bool onboardingComplete;

  UserState copyWith({
    AuthStatus? authStatus,
    bool? onboardingComplete,
  }) {
    return UserState(
      authStatus: authStatus ?? this.authStatus,
      onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    );
  }

  bool get isAuthenticated => authStatus == AuthStatus.authenticated;
}
