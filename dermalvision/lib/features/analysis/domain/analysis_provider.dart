import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../analysis/data/analysis_repository.dart';
import 'analysis_result.dart';

part 'analysis_provider.g.dart';

@riverpod
AnalysisRepository analysisRepository(AnalysisRepositoryRef ref) {
  return AnalysisRepository(
    firestore: FirebaseFirestore.instance,
    functions: FirebaseFunctions.instance,
  );
}

@riverpod
Future<AnalysisResult?> analysisResult(AnalysisResultRef ref, String sessionId) {
  final repository = ref.watch(analysisRepositoryProvider);
  return repository.getAnalysisResult(sessionId);
}
