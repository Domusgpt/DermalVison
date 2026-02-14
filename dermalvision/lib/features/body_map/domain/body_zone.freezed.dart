// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'body_zone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BodyZone _$BodyZoneFromJson(Map<String, dynamic> json) {
  return _BodyZone.fromJson(json);
}

/// @nodoc
mixin _$BodyZone {
  String get id => throw _privateConstructorUsedError;
  String get bodyZone =>
      throw _privateConstructorUsedError; // Enum or string key (e.g. face_left_cheek)
  String? get customLabel => throw _privateConstructorUsedError;
  List<String> get monitoringTargets => throw _privateConstructorUsedError;
  String? get referencePhotoUrl => throw _privateConstructorUsedError;
  GuidanceParams? get guidanceParams => throw _privateConstructorUsedError;
  MonitoringSchedule? get schedule => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastSessionAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BodyZoneCopyWith<BodyZone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyZoneCopyWith<$Res> {
  factory $BodyZoneCopyWith(BodyZone value, $Res Function(BodyZone) then) =
      _$BodyZoneCopyWithImpl<$Res, BodyZone>;
  @useResult
  $Res call(
      {String id,
      String bodyZone,
      String? customLabel,
      List<String> monitoringTargets,
      String? referencePhotoUrl,
      GuidanceParams? guidanceParams,
      MonitoringSchedule? schedule,
      DateTime? createdAt,
      DateTime? lastSessionAt});

  $GuidanceParamsCopyWith<$Res>? get guidanceParams;
  $MonitoringScheduleCopyWith<$Res>? get schedule;
}

/// @nodoc
class _$BodyZoneCopyWithImpl<$Res, $Val extends BodyZone>
    implements $BodyZoneCopyWith<$Res> {
  _$BodyZoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bodyZone = null,
    Object? customLabel = freezed,
    Object? monitoringTargets = null,
    Object? referencePhotoUrl = freezed,
    Object? guidanceParams = freezed,
    Object? schedule = freezed,
    Object? createdAt = freezed,
    Object? lastSessionAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bodyZone: null == bodyZone
          ? _value.bodyZone
          : bodyZone // ignore: cast_nullable_to_non_nullable
              as String,
      customLabel: freezed == customLabel
          ? _value.customLabel
          : customLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      monitoringTargets: null == monitoringTargets
          ? _value.monitoringTargets
          : monitoringTargets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      referencePhotoUrl: freezed == referencePhotoUrl
          ? _value.referencePhotoUrl
          : referencePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      guidanceParams: freezed == guidanceParams
          ? _value.guidanceParams
          : guidanceParams // ignore: cast_nullable_to_non_nullable
              as GuidanceParams?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as MonitoringSchedule?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSessionAt: freezed == lastSessionAt
          ? _value.lastSessionAt
          : lastSessionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GuidanceParamsCopyWith<$Res>? get guidanceParams {
    if (_value.guidanceParams == null) {
      return null;
    }

    return $GuidanceParamsCopyWith<$Res>(_value.guidanceParams!, (value) {
      return _then(_value.copyWith(guidanceParams: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MonitoringScheduleCopyWith<$Res>? get schedule {
    if (_value.schedule == null) {
      return null;
    }

    return $MonitoringScheduleCopyWith<$Res>(_value.schedule!, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BodyZoneImplCopyWith<$Res>
    implements $BodyZoneCopyWith<$Res> {
  factory _$$BodyZoneImplCopyWith(
          _$BodyZoneImpl value, $Res Function(_$BodyZoneImpl) then) =
      __$$BodyZoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String bodyZone,
      String? customLabel,
      List<String> monitoringTargets,
      String? referencePhotoUrl,
      GuidanceParams? guidanceParams,
      MonitoringSchedule? schedule,
      DateTime? createdAt,
      DateTime? lastSessionAt});

  @override
  $GuidanceParamsCopyWith<$Res>? get guidanceParams;
  @override
  $MonitoringScheduleCopyWith<$Res>? get schedule;
}

/// @nodoc
class __$$BodyZoneImplCopyWithImpl<$Res>
    extends _$BodyZoneCopyWithImpl<$Res, _$BodyZoneImpl>
    implements _$$BodyZoneImplCopyWith<$Res> {
  __$$BodyZoneImplCopyWithImpl(
      _$BodyZoneImpl _value, $Res Function(_$BodyZoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bodyZone = null,
    Object? customLabel = freezed,
    Object? monitoringTargets = null,
    Object? referencePhotoUrl = freezed,
    Object? guidanceParams = freezed,
    Object? schedule = freezed,
    Object? createdAt = freezed,
    Object? lastSessionAt = freezed,
  }) {
    return _then(_$BodyZoneImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bodyZone: null == bodyZone
          ? _value.bodyZone
          : bodyZone // ignore: cast_nullable_to_non_nullable
              as String,
      customLabel: freezed == customLabel
          ? _value.customLabel
          : customLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      monitoringTargets: null == monitoringTargets
          ? _value._monitoringTargets
          : monitoringTargets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      referencePhotoUrl: freezed == referencePhotoUrl
          ? _value.referencePhotoUrl
          : referencePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      guidanceParams: freezed == guidanceParams
          ? _value.guidanceParams
          : guidanceParams // ignore: cast_nullable_to_non_nullable
              as GuidanceParams?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as MonitoringSchedule?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSessionAt: freezed == lastSessionAt
          ? _value.lastSessionAt
          : lastSessionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyZoneImpl implements _BodyZone {
  const _$BodyZoneImpl(
      {required this.id,
      required this.bodyZone,
      this.customLabel,
      final List<String> monitoringTargets = const [],
      this.referencePhotoUrl,
      this.guidanceParams,
      this.schedule,
      this.createdAt,
      this.lastSessionAt})
      : _monitoringTargets = monitoringTargets;

  factory _$BodyZoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyZoneImplFromJson(json);

  @override
  final String id;
  @override
  final String bodyZone;
// Enum or string key (e.g. face_left_cheek)
  @override
  final String? customLabel;
  final List<String> _monitoringTargets;
  @override
  @JsonKey()
  List<String> get monitoringTargets {
    if (_monitoringTargets is EqualUnmodifiableListView)
      return _monitoringTargets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monitoringTargets);
  }

  @override
  final String? referencePhotoUrl;
  @override
  final GuidanceParams? guidanceParams;
  @override
  final MonitoringSchedule? schedule;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? lastSessionAt;

  @override
  String toString() {
    return 'BodyZone(id: $id, bodyZone: $bodyZone, customLabel: $customLabel, monitoringTargets: $monitoringTargets, referencePhotoUrl: $referencePhotoUrl, guidanceParams: $guidanceParams, schedule: $schedule, createdAt: $createdAt, lastSessionAt: $lastSessionAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyZoneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bodyZone, bodyZone) ||
                other.bodyZone == bodyZone) &&
            (identical(other.customLabel, customLabel) ||
                other.customLabel == customLabel) &&
            const DeepCollectionEquality()
                .equals(other._monitoringTargets, _monitoringTargets) &&
            (identical(other.referencePhotoUrl, referencePhotoUrl) ||
                other.referencePhotoUrl == referencePhotoUrl) &&
            (identical(other.guidanceParams, guidanceParams) ||
                other.guidanceParams == guidanceParams) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastSessionAt, lastSessionAt) ||
                other.lastSessionAt == lastSessionAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bodyZone,
      customLabel,
      const DeepCollectionEquality().hash(_monitoringTargets),
      referencePhotoUrl,
      guidanceParams,
      schedule,
      createdAt,
      lastSessionAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyZoneImplCopyWith<_$BodyZoneImpl> get copyWith =>
      __$$BodyZoneImplCopyWithImpl<_$BodyZoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyZoneImplToJson(
      this,
    );
  }
}

abstract class _BodyZone implements BodyZone {
  const factory _BodyZone(
      {required final String id,
      required final String bodyZone,
      final String? customLabel,
      final List<String> monitoringTargets,
      final String? referencePhotoUrl,
      final GuidanceParams? guidanceParams,
      final MonitoringSchedule? schedule,
      final DateTime? createdAt,
      final DateTime? lastSessionAt}) = _$BodyZoneImpl;

  factory _BodyZone.fromJson(Map<String, dynamic> json) =
      _$BodyZoneImpl.fromJson;

  @override
  String get id;
  @override
  String get bodyZone;
  @override // Enum or string key (e.g. face_left_cheek)
  String? get customLabel;
  @override
  List<String> get monitoringTargets;
  @override
  String? get referencePhotoUrl;
  @override
  GuidanceParams? get guidanceParams;
  @override
  MonitoringSchedule? get schedule;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastSessionAt;
  @override
  @JsonKey(ignore: true)
  _$$BodyZoneImplCopyWith<_$BodyZoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuidanceParams _$GuidanceParamsFromJson(Map<String, dynamic> json) {
  return _GuidanceParams.fromJson(json);
}

/// @nodoc
mixin _$GuidanceParams {
  double get targetDistance => throw _privateConstructorUsedError; // cm
  double get targetPitch => throw _privateConstructorUsedError;
  double get targetYaw => throw _privateConstructorUsedError;
  double get targetRoll => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuidanceParamsCopyWith<GuidanceParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuidanceParamsCopyWith<$Res> {
  factory $GuidanceParamsCopyWith(
          GuidanceParams value, $Res Function(GuidanceParams) then) =
      _$GuidanceParamsCopyWithImpl<$Res, GuidanceParams>;
  @useResult
  $Res call(
      {double targetDistance,
      double targetPitch,
      double targetYaw,
      double targetRoll});
}

/// @nodoc
class _$GuidanceParamsCopyWithImpl<$Res, $Val extends GuidanceParams>
    implements $GuidanceParamsCopyWith<$Res> {
  _$GuidanceParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetDistance = null,
    Object? targetPitch = null,
    Object? targetYaw = null,
    Object? targetRoll = null,
  }) {
    return _then(_value.copyWith(
      targetDistance: null == targetDistance
          ? _value.targetDistance
          : targetDistance // ignore: cast_nullable_to_non_nullable
              as double,
      targetPitch: null == targetPitch
          ? _value.targetPitch
          : targetPitch // ignore: cast_nullable_to_non_nullable
              as double,
      targetYaw: null == targetYaw
          ? _value.targetYaw
          : targetYaw // ignore: cast_nullable_to_non_nullable
              as double,
      targetRoll: null == targetRoll
          ? _value.targetRoll
          : targetRoll // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuidanceParamsImplCopyWith<$Res>
    implements $GuidanceParamsCopyWith<$Res> {
  factory _$$GuidanceParamsImplCopyWith(_$GuidanceParamsImpl value,
          $Res Function(_$GuidanceParamsImpl) then) =
      __$$GuidanceParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double targetDistance,
      double targetPitch,
      double targetYaw,
      double targetRoll});
}

/// @nodoc
class __$$GuidanceParamsImplCopyWithImpl<$Res>
    extends _$GuidanceParamsCopyWithImpl<$Res, _$GuidanceParamsImpl>
    implements _$$GuidanceParamsImplCopyWith<$Res> {
  __$$GuidanceParamsImplCopyWithImpl(
      _$GuidanceParamsImpl _value, $Res Function(_$GuidanceParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetDistance = null,
    Object? targetPitch = null,
    Object? targetYaw = null,
    Object? targetRoll = null,
  }) {
    return _then(_$GuidanceParamsImpl(
      targetDistance: null == targetDistance
          ? _value.targetDistance
          : targetDistance // ignore: cast_nullable_to_non_nullable
              as double,
      targetPitch: null == targetPitch
          ? _value.targetPitch
          : targetPitch // ignore: cast_nullable_to_non_nullable
              as double,
      targetYaw: null == targetYaw
          ? _value.targetYaw
          : targetYaw // ignore: cast_nullable_to_non_nullable
              as double,
      targetRoll: null == targetRoll
          ? _value.targetRoll
          : targetRoll // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuidanceParamsImpl implements _GuidanceParams {
  const _$GuidanceParamsImpl(
      {required this.targetDistance,
      required this.targetPitch,
      required this.targetYaw,
      required this.targetRoll});

  factory _$GuidanceParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuidanceParamsImplFromJson(json);

  @override
  final double targetDistance;
// cm
  @override
  final double targetPitch;
  @override
  final double targetYaw;
  @override
  final double targetRoll;

  @override
  String toString() {
    return 'GuidanceParams(targetDistance: $targetDistance, targetPitch: $targetPitch, targetYaw: $targetYaw, targetRoll: $targetRoll)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuidanceParamsImpl &&
            (identical(other.targetDistance, targetDistance) ||
                other.targetDistance == targetDistance) &&
            (identical(other.targetPitch, targetPitch) ||
                other.targetPitch == targetPitch) &&
            (identical(other.targetYaw, targetYaw) ||
                other.targetYaw == targetYaw) &&
            (identical(other.targetRoll, targetRoll) ||
                other.targetRoll == targetRoll));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, targetDistance, targetPitch, targetYaw, targetRoll);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GuidanceParamsImplCopyWith<_$GuidanceParamsImpl> get copyWith =>
      __$$GuidanceParamsImplCopyWithImpl<_$GuidanceParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuidanceParamsImplToJson(
      this,
    );
  }
}

abstract class _GuidanceParams implements GuidanceParams {
  const factory _GuidanceParams(
      {required final double targetDistance,
      required final double targetPitch,
      required final double targetYaw,
      required final double targetRoll}) = _$GuidanceParamsImpl;

  factory _GuidanceParams.fromJson(Map<String, dynamic> json) =
      _$GuidanceParamsImpl.fromJson;

  @override
  double get targetDistance;
  @override // cm
  double get targetPitch;
  @override
  double get targetYaw;
  @override
  double get targetRoll;
  @override
  @JsonKey(ignore: true)
  _$$GuidanceParamsImplCopyWith<_$GuidanceParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonitoringSchedule _$MonitoringScheduleFromJson(Map<String, dynamic> json) {
  return _MonitoringSchedule.fromJson(json);
}

/// @nodoc
mixin _$MonitoringSchedule {
  String get frequency =>
      throw _privateConstructorUsedError; // daily, weekly, etc.
  String? get preferredTime => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  DateTime? get nextDue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonitoringScheduleCopyWith<MonitoringSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringScheduleCopyWith<$Res> {
  factory $MonitoringScheduleCopyWith(
          MonitoringSchedule value, $Res Function(MonitoringSchedule) then) =
      _$MonitoringScheduleCopyWithImpl<$Res, MonitoringSchedule>;
  @useResult
  $Res call(
      {String frequency,
      String? preferredTime,
      String? timezone,
      bool enabled,
      DateTime? nextDue});
}

/// @nodoc
class _$MonitoringScheduleCopyWithImpl<$Res, $Val extends MonitoringSchedule>
    implements $MonitoringScheduleCopyWith<$Res> {
  _$MonitoringScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? preferredTime = freezed,
    Object? timezone = freezed,
    Object? enabled = null,
    Object? nextDue = freezed,
  }) {
    return _then(_value.copyWith(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      preferredTime: freezed == preferredTime
          ? _value.preferredTime
          : preferredTime // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      nextDue: freezed == nextDue
          ? _value.nextDue
          : nextDue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonitoringScheduleImplCopyWith<$Res>
    implements $MonitoringScheduleCopyWith<$Res> {
  factory _$$MonitoringScheduleImplCopyWith(_$MonitoringScheduleImpl value,
          $Res Function(_$MonitoringScheduleImpl) then) =
      __$$MonitoringScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String frequency,
      String? preferredTime,
      String? timezone,
      bool enabled,
      DateTime? nextDue});
}

/// @nodoc
class __$$MonitoringScheduleImplCopyWithImpl<$Res>
    extends _$MonitoringScheduleCopyWithImpl<$Res, _$MonitoringScheduleImpl>
    implements _$$MonitoringScheduleImplCopyWith<$Res> {
  __$$MonitoringScheduleImplCopyWithImpl(_$MonitoringScheduleImpl _value,
      $Res Function(_$MonitoringScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frequency = null,
    Object? preferredTime = freezed,
    Object? timezone = freezed,
    Object? enabled = null,
    Object? nextDue = freezed,
  }) {
    return _then(_$MonitoringScheduleImpl(
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      preferredTime: freezed == preferredTime
          ? _value.preferredTime
          : preferredTime // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      nextDue: freezed == nextDue
          ? _value.nextDue
          : nextDue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonitoringScheduleImpl implements _MonitoringSchedule {
  const _$MonitoringScheduleImpl(
      {required this.frequency,
      this.preferredTime,
      this.timezone,
      this.enabled = true,
      this.nextDue});

  factory _$MonitoringScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitoringScheduleImplFromJson(json);

  @override
  final String frequency;
// daily, weekly, etc.
  @override
  final String? preferredTime;
  @override
  final String? timezone;
  @override
  @JsonKey()
  final bool enabled;
  @override
  final DateTime? nextDue;

  @override
  String toString() {
    return 'MonitoringSchedule(frequency: $frequency, preferredTime: $preferredTime, timezone: $timezone, enabled: $enabled, nextDue: $nextDue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoringScheduleImpl &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.preferredTime, preferredTime) ||
                other.preferredTime == preferredTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.nextDue, nextDue) || other.nextDue == nextDue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, frequency, preferredTime, timezone, enabled, nextDue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringScheduleImplCopyWith<_$MonitoringScheduleImpl> get copyWith =>
      __$$MonitoringScheduleImplCopyWithImpl<_$MonitoringScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitoringScheduleImplToJson(
      this,
    );
  }
}

abstract class _MonitoringSchedule implements MonitoringSchedule {
  const factory _MonitoringSchedule(
      {required final String frequency,
      final String? preferredTime,
      final String? timezone,
      final bool enabled,
      final DateTime? nextDue}) = _$MonitoringScheduleImpl;

  factory _MonitoringSchedule.fromJson(Map<String, dynamic> json) =
      _$MonitoringScheduleImpl.fromJson;

  @override
  String get frequency;
  @override // daily, weekly, etc.
  String? get preferredTime;
  @override
  String? get timezone;
  @override
  bool get enabled;
  @override
  DateTime? get nextDue;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringScheduleImplCopyWith<_$MonitoringScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
