// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisResultImpl _$$AnalysisResultImplFromJson(Map<String, dynamic> json) =>
    _$AnalysisResultImpl(
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      zoneId: json['zoneId'] as String,
      analyzedAt: DateTime.parse(json['analyzedAt'] as String),
      results: (json['results'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, ConditionResult.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      compositeScores: CompositeScores.fromJson(
          json['compositeScores'] as Map<String, dynamic>),
      referralTriggered: json['referralTriggered'] as bool? ?? false,
      referralReason: json['referralReason'] as String?,
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$$AnalysisResultImplToJson(
        _$AnalysisResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'zoneId': instance.zoneId,
      'analyzedAt': instance.analyzedAt.toIso8601String(),
      'results': instance.results,
      'compositeScores': instance.compositeScores,
      'referralTriggered': instance.referralTriggered,
      'referralReason': instance.referralReason,
      'summary': instance.summary,
    };

_$ConditionResultImpl _$$ConditionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$ConditionResultImpl(
      detected: json['detected'] as bool,
      severity: (json['severity'] as num).toDouble(),
      count: (json['count'] as num?)?.toInt(),
      area: (json['area'] as num?)?.toDouble(),
      classification: json['classification'] as String?,
    );

Map<String, dynamic> _$$ConditionResultImplToJson(
        _$ConditionResultImpl instance) =>
    <String, dynamic>{
      'detected': instance.detected,
      'severity': instance.severity,
      'count': instance.count,
      'area': instance.area,
      'classification': instance.classification,
    };

_$CompositeScoresImpl _$$CompositeScoresImplFromJson(
        Map<String, dynamic> json) =>
    _$CompositeScoresImpl(
      overallHealth: (json['overallHealth'] as num).toDouble(),
      skinAge: (json['skinAge'] as num?)?.toInt(),
      hydrationIndex: (json['hydrationIndex'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CompositeScoresImplToJson(
        _$CompositeScoresImpl instance) =>
    <String, dynamic>{
      'overallHealth': instance.overallHealth,
      'skinAge': instance.skinAge,
      'hydrationIndex': instance.hydrationIndex,
    };
