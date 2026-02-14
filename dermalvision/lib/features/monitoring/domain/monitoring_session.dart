import 'package:freezed_annotation/freezed_annotation.dart';

part 'monitoring_session.freezed.dart';
part 'monitoring_session.g.dart';

@freezed
class MonitoringSession with _$MonitoringSession {
  const factory MonitoringSession({
    required String id,
    required String zoneId,
    required DateTime capturedAt,
    required PhotoUrls photoUrls,
    required CaptureMetadata captureMetadata,
    @Default(AnalysisStatus.pending) AnalysisStatus analysisStatus,
    String? analysisId,
    String? notes,
  }) = _MonitoringSession;

  factory MonitoringSession.fromJson(Map<String, dynamic> json) =>
      _$MonitoringSessionFromJson(json);
}

@freezed
class PhotoUrls with _$PhotoUrls {
  const factory PhotoUrls({
    required String original,
    String? normalized,
    String? thumbnail128,
    String? thumbnail512,
  }) = _PhotoUrls;

  factory PhotoUrls.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlsFromJson(json);
}

@freezed
class CaptureMetadata with _$CaptureMetadata {
  const factory CaptureMetadata({
    double? distance,
    double? pitch,
    double? yaw,
    double? roll,
    double? ambientLight,
    @Default(false) bool flashUsed,
    String? deviceModel,
    double? readinessScore,
  }) = _CaptureMetadata;

  factory CaptureMetadata.fromJson(Map<String, dynamic> json) =>
      _$CaptureMetadataFromJson(json);
}

enum AnalysisStatus { pending, processing, complete, failed }
