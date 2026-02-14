import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../monitoring/domain/monitoring_provider.dart';
import '../../auth/domain/auth_provider.dart';
import '../../monitoring/domain/monitoring_session.dart';

// Provider to watch specific session
final sessionProvider = StreamProvider.family<MonitoringSession?, String>((ref, sessionId) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return const Stream.empty();
  return ref.watch(monitoringRepositoryProvider).watchSession(user.uid, sessionId);
});

class AnalysisWaitingScreen extends ConsumerWidget {
  const AnalysisWaitingScreen({super.key, required this.sessionId});
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(sessionProvider(sessionId));

    // Listen to changes to navigate
    ref.listen(sessionProvider(sessionId), (previous, next) {
      next.whenData((session) {
        if (session != null && (session.analysisStatus == AnalysisStatus.complete || session.analysisId != null)) {
          if (session.analysisId != null) {
             context.go('/analysis/${session.analysisId}');
          }
        }
      });
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Processing Analysis')),
      body: Center(
        child: sessionAsync.when(
          data: (session) {
            if (session == null) return const Text('Session not found');
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
                const Text('Analyzing photo...'),
                const SizedBox(height: 10),
                Text('Status: ${session.analysisStatus.name}'),
              ],
            );
          },
          error: (e, s) => Text('Error: $e'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
