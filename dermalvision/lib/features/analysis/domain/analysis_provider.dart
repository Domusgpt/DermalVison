import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../auth/domain/auth_provider.dart';
import '../domain/analysis_result.dart';
import 'analysis_repository.dart';
import '../data/analysis_repository.dart';

part 'analysis_provider.g.dart';

@Riverpod(keepAlive: true)
AnalysisRepository analysisRepository(AnalysisRepositoryRef ref) {
  return FirebaseAnalysisRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<AnalysisResult?> analysis(AnalysisRef ref, String analysisId) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return const Stream.empty();
  return ref
      .watch(analysisRepositoryProvider)
      .watchAnalysis(user.uid, analysisId);
}
