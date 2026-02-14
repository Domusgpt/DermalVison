// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BodyZoneImpl _$$BodyZoneImplFromJson(Map<String, dynamic> json) =>
    _$BodyZoneImpl(
      id: json['id'] as String,
      bodyZone: json['bodyZone'] as String,
      customLabel: json['customLabel'] as String?,
      monitoringTargets: (json['monitoringTargets'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      referencePhotoUrl: json['referencePhotoUrl'] as String?,
      guidanceParams: json['guidanceParams'] == null
          ? null
          : GuidanceParams.fromJson(
              json['guidanceParams'] as Map<String, dynamic>),
      schedule: json['schedule'] == null
          ? null
          : MonitoringSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastSessionAt: json['lastSessionAt'] == null
          ? null
          : DateTime.parse(json['lastSessionAt'] as String),
    );

Map<String, dynamic> _$$BodyZoneImplToJson(_$BodyZoneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bodyZone': instance.bodyZone,
      'customLabel': instance.customLabel,
      'monitoringTargets': instance.monitoringTargets,
      'referencePhotoUrl': instance.referencePhotoUrl,
      'guidanceParams': instance.guidanceParams,
      'schedule': instance.schedule,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastSessionAt': instance.lastSessionAt?.toIso8601String(),
    };

_$GuidanceParamsImpl _$$GuidanceParamsImplFromJson(Map<String, dynamic> json) =>
    _$GuidanceParamsImpl(
      targetDistance: (json['targetDistance'] as num).toDouble(),
      targetPitch: (json['targetPitch'] as num).toDouble(),
      targetYaw: (json['targetYaw'] as num).toDouble(),
      targetRoll: (json['targetRoll'] as num).toDouble(),
    );

Map<String, dynamic> _$$GuidanceParamsImplToJson(
        _$GuidanceParamsImpl instance) =>
    <String, dynamic>{
      'targetDistance': instance.targetDistance,
      'targetPitch': instance.targetPitch,
      'targetYaw': instance.targetYaw,
      'targetRoll': instance.targetRoll,
    };

_$MonitoringScheduleImpl _$$MonitoringScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$MonitoringScheduleImpl(
      frequency: json['frequency'] as String,
      preferredTime: json['preferredTime'] as String?,
      timezone: json['timezone'] as String?,
      enabled: json['enabled'] as bool? ?? true,
      nextDue: json['nextDue'] == null
          ? null
          : DateTime.parse(json['nextDue'] as String),
    );

Map<String, dynamic> _$$MonitoringScheduleImplToJson(
        _$MonitoringScheduleImpl instance) =>
    <String, dynamic>{
      'frequency': instance.frequency,
      'preferredTime': instance.preferredTime,
      'timezone': instance.timezone,
      'enabled': instance.enabled,
      'nextDue': instance.nextDue?.toIso8601String(),
    };
