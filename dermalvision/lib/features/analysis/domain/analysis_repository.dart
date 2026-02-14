import '../domain/analysis_result.dart';

abstract class AnalysisRepository {
  Stream<AnalysisResult?> watchAnalysis(String uid, String analysisId);
  Stream<List<AnalysisResult>> watchAnalysisHistory(String uid, String zoneId);
}
