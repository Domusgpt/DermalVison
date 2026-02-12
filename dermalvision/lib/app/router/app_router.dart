import 'package:dermalvision/features/auth/application/auth_controller.dart';
import 'package:dermalvision/features/auth/presentation/login_screen.dart';
import 'package:dermalvision/features/home/presentation/home_screen.dart';
import 'package:dermalvision/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final userState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(
          path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
      GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
    ],
    redirect: (_, state) {
      final location = state.matchedLocation;
      if (!userState.isAuthenticated && location != '/login') {
        return '/login';
      }

      if (userState.isAuthenticated &&
          !userState.onboardingComplete &&
          location != '/onboarding') {
        return '/onboarding';
      }

      if (userState.isAuthenticated &&
          userState.onboardingComplete &&
          (location == '/login' || location == '/onboarding')) {
        return '/home';
      }

      return null;
    },
  );
});
