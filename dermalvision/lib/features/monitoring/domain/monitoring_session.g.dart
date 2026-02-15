// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonitoringSessionImpl _$$MonitoringSessionImplFromJson(
        Map<String, dynamic> json) =>
    _$MonitoringSessionImpl(
      id: json['id'] as String,
      zoneId: json['zoneId'] as String,
      capturedAt: DateTime.parse(json['capturedAt'] as String),
      photoUrls: PhotoUrls.fromJson(json['photoUrls'] as Map<String, dynamic>),
      captureMetadata: CaptureMetadata.fromJson(
          json['captureMetadata'] as Map<String, dynamic>),
      analysisStatus: $enumDecodeNullable(
              _$AnalysisStatusEnumMap, json['analysisStatus']) ??
          AnalysisStatus.pending,
      analysisId: json['analysisId'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$MonitoringSessionImplToJson(
        _$MonitoringSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'zoneId': instance.zoneId,
      'capturedAt': instance.capturedAt.toIso8601String(),
      'photoUrls': instance.photoUrls,
      'captureMetadata': instance.captureMetadata,
      'analysisStatus': _$AnalysisStatusEnumMap[instance.analysisStatus]!,
      'analysisId': instance.analysisId,
      'notes': instance.notes,
    };

const _$AnalysisStatusEnumMap = {
  AnalysisStatus.pending: 'pending',
  AnalysisStatus.processing: 'processing',
  AnalysisStatus.complete: 'complete',
  AnalysisStatus.failed: 'failed',
};

_$PhotoUrlsImpl _$$PhotoUrlsImplFromJson(Map<String, dynamic> json) =>
    _$PhotoUrlsImpl(
      original: json['original'] as String,
      normalized: json['normalized'] as String?,
      thumbnail128: json['thumbnail128'] as String?,
      thumbnail512: json['thumbnail512'] as String?,
    );

Map<String, dynamic> _$$PhotoUrlsImplToJson(_$PhotoUrlsImpl instance) =>
    <String, dynamic>{
      'original': instance.original,
      'normalized': instance.normalized,
      'thumbnail128': instance.thumbnail128,
      'thumbnail512': instance.thumbnail512,
    };

_$CaptureMetadataImpl _$$CaptureMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$CaptureMetadataImpl(
      distance: (json['distance'] as num?)?.toDouble(),
      pitch: (json['pitch'] as num?)?.toDouble(),
      yaw: (json['yaw'] as num?)?.toDouble(),
      roll: (json['roll'] as num?)?.toDouble(),
      ambientLight: (json['ambientLight'] as num?)?.toDouble(),
      flashUsed: json['flashUsed'] as bool? ?? false,
      deviceModel: json['deviceModel'] as String?,
      readinessScore: (json['readinessScore'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CaptureMetadataImplToJson(
        _$CaptureMetadataImpl instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'pitch': instance.pitch,
      'yaw': instance.yaw,
      'roll': instance.roll,
      'ambientLight': instance.ambientLight,
      'flashUsed': instance.flashUsed,
      'deviceModel': instance.deviceModel,
      'readinessScore': instance.readinessScore,
    };
