// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisResultImpl _$$AnalysisResultImplFromJson(Map<String, dynamic> json) =>
    _$AnalysisResultImpl(
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      analyzedAt: DateTime.parse(json['analyzedAt'] as String),
      scores: json['scores'] as Map<String, dynamic>,
      summary: json['summary'] as String,
      referralTriggered: json['referralTriggered'] as bool? ?? false,
    );

Map<String, dynamic> _$$AnalysisResultImplToJson(
        _$AnalysisResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'analyzedAt': instance.analyzedAt.toIso8601String(),
      'scores': instance.scores,
      'summary': instance.summary,
      'referralTriggered': instance.referralTriggered,
    };
