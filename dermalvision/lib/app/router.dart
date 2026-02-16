import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../features/auth/domain/auth_provider.dart';
import '../features/profile/domain/user_profile.dart';
import '../features/profile/domain/user_profile_provider.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/signup_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/camera/presentation/camera_screen.dart';
import '../features/analysis/presentation/analysis_result_container.dart';
import '../features/analysis/presentation/analysis_waiting_screen.dart';
import '../features/skin_shurpa/presentation/chat_screen.dart';
import '../features/subscription/presentation/paywall_screen.dart';

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
      GoRoute(
        path: '/camera/:zoneId',
        builder: (context, state) => CameraScreen(
          zoneId: state.pathParameters['zoneId']!,
        ),
      ),
      GoRoute(
        path: '/analysis/:analysisId',
        builder: (context, state) => AnalysisResultContainer(
          analysisId: state.pathParameters['analysisId']!,
        ),
      ),
      GoRoute(
        path: '/session/:sessionId/waiting',
        builder: (context, state) => AnalysisWaitingScreen(
          sessionId: state.pathParameters['sessionId']!,
        ),
      ),
      GoRoute(
        path: '/chat/:conversationId',
        builder: (context, state) => ChatScreen(
          conversationId: state.pathParameters['conversationId']!,
        ),
      ),
      GoRoute(
        path: '/paywall',
        builder: (context, state) => const PaywallScreen(),
      ),
    ],
  );
}
