import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_result.freezed.dart';
part 'analysis_result.g.dart';

@freezed
class AnalysisResult with _$AnalysisResult {
  const factory AnalysisResult({
    required String id,
    required String sessionId,
    required String zoneId,
    required DateTime analyzedAt,
    @Default({}) Map<String, ConditionResult> results,
    required CompositeScores compositeScores,
    @Default(false) bool referralTriggered,
    String? referralReason,
    required String summary,
  }) = _AnalysisResult;

  factory AnalysisResult.fromJson(Map<String, dynamic> json) =>
      _$AnalysisResultFromJson(json);
}

@freezed
class ConditionResult with _$ConditionResult {
  const factory ConditionResult({
    required bool detected,
    required double severity, // 0-1
    int? count,
    double? area,
    String? classification,
  }) = _ConditionResult;

  factory ConditionResult.fromJson(Map<String, dynamic> json) =>
      _$ConditionResultFromJson(json);
}

@freezed
class CompositeScores with _$CompositeScores {
  const factory CompositeScores({
    required double overallHealth, // 0-100
    int? skinAge,
    double? hydrationIndex,
  }) = _CompositeScores;

  factory CompositeScores.fromJson(Map<String, dynamic> json) =>
      _$CompositeScoresFromJson(json);
}
