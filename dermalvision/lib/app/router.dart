import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../features/auth/domain/auth_provider.dart';
import '../features/profile/domain/user_profile.dart';
import '../features/profile/domain/user_profile_provider.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/signup_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authState = ref.watch(authStateProvider);
  final userProfile = ref.watch(userProfileProvider);

  return GoRouter(
    initialLocation: '/home',
    redirect: (context, state) {
      final isLoggedIn = authState.value != null;
      final isLoggingIn = state.uri.path == '/login' || state.uri.path == '/signup';

      if (!isLoggedIn) {
        return isLoggingIn ? null : '/login';
      }

      // Check onboarding status
      final profile = userProfile.value;
      final onOnboarding = state.uri.path == '/onboarding';

      if (!userProfile.isLoading && (profile == null || !profile.onboardingComplete)) {
        return onOnboarding ? null : '/onboarding';
      }

      if (profile != null && profile.onboardingComplete && onOnboarding) {
        return '/home';
      }

      if (isLoggingIn) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
    ],
  );
}
