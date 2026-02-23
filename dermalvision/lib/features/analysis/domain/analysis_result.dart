import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_result.freezed.dart';
part 'analysis_result.g.dart';

@freezed
class AnalysisResult with _ {
  const factory AnalysisResult({
    required String id,
    required String sessionId,
    required DateTime analyzedAt,
    required Map<String, dynamic> scores, // Simplified for now
    required String summary,
    @Default(false) bool referralTriggered,
  }) = _AnalysisResult;

  factory AnalysisResult.fromJson(Map<String, dynamic> json) =>
      _(json);
}
