import 'package:dermalvision/features/analysis/presentation/analysis_screen.dart';
import 'package:dermalvision/features/auth/application/auth_controller.dart';
import 'package:dermalvision/features/auth/presentation/forgot_password_screen.dart';
import 'package:dermalvision/features/auth/presentation/login_screen.dart';
import 'package:dermalvision/features/auth/presentation/signup_screen.dart';
import 'package:dermalvision/features/camera/presentation/camera_screen.dart';
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
      GoRoute(path: '/signup', builder: (_, __) => const SignupScreen()),
      GoRoute(
        path: '/forgot-password',
        builder: (_, __) => const ForgotPasswordScreen(),
      ),
      GoRoute(
          path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
      GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
      GoRoute(path: '/camera', builder: (_, __) => const CameraScreen()),
      GoRoute(path: '/analysis', builder: (_, __) => const AnalysisScreen()),
    ],
    redirect: (_, state) {
      final location = state.matchedLocation;
      final isAuthRoute = location == '/login' ||
          location == '/signup' ||
          location == '/forgot-password';

      if (!userState.isAuthenticated && !isAuthRoute) {
        return '/login';
      }

      if (userState.isAuthenticated &&
          !userState.onboardingComplete &&
          location != '/onboarding') {
        return '/onboarding';
      }

      if (userState.isAuthenticated &&
          userState.onboardingComplete &&
          (location == '/login' ||
              location == '/onboarding' ||
              location == '/signup')) {
        return '/home';
      }

      return null;
    },
  );
});
