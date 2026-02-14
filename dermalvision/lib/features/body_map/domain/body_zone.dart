import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_zone.freezed.dart';
part 'body_zone.g.dart';

@freezed
class BodyZone with _$BodyZone {
  const factory BodyZone({
    required String id,
    required String bodyZone, // Enum or string key (e.g. face_left_cheek)
    String? customLabel,
    @Default([]) List<String> monitoringTargets,
    String? referencePhotoUrl,
    GuidanceParams? guidanceParams,
    MonitoringSchedule? schedule,
    DateTime? createdAt,
    DateTime? lastSessionAt,
  }) = _BodyZone;

  factory BodyZone.fromJson(Map<String, dynamic> json) =>
      _$BodyZoneFromJson(json);
}

@freezed
class GuidanceParams with _$GuidanceParams {
  const factory GuidanceParams({
    required double targetDistance, // cm
    required double targetPitch,
    required double targetYaw,
    required double targetRoll,
  }) = _GuidanceParams;

  factory GuidanceParams.fromJson(Map<String, dynamic> json) =>
      _$GuidanceParamsFromJson(json);
}

@freezed
class MonitoringSchedule with _$MonitoringSchedule {
  const factory MonitoringSchedule({
    required String frequency, // daily, weekly, etc.
    String? preferredTime,
    String? timezone,
    @Default(true) bool enabled,
    DateTime? nextDue,
  }) = _MonitoringSchedule;

  factory MonitoringSchedule.fromJson(Map<String, dynamic> json) =>
      _$MonitoringScheduleFromJson(json);
}
