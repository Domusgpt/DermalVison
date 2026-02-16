// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitoring_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MonitoringSession _$MonitoringSessionFromJson(Map<String, dynamic> json) {
  return _MonitoringSession.fromJson(json);
}

/// @nodoc
mixin _$MonitoringSession {
  String get id => throw _privateConstructorUsedError;
  String get zoneId => throw _privateConstructorUsedError;
  DateTime get capturedAt => throw _privateConstructorUsedError;
  PhotoUrls get photoUrls => throw _privateConstructorUsedError;
  CaptureMetadata get captureMetadata => throw _privateConstructorUsedError;
  AnalysisStatus get analysisStatus => throw _privateConstructorUsedError;
  String? get analysisId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonitoringSessionCopyWith<MonitoringSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonitoringSessionCopyWith<$Res> {
  factory $MonitoringSessionCopyWith(
          MonitoringSession value, $Res Function(MonitoringSession) then) =
      _$MonitoringSessionCopyWithImpl<$Res, MonitoringSession>;
  @useResult
  $Res call(
      {String id,
      String zoneId,
      DateTime capturedAt,
      PhotoUrls photoUrls,
      CaptureMetadata captureMetadata,
      AnalysisStatus analysisStatus,
      String? analysisId,
      String? notes});

  $PhotoUrlsCopyWith<$Res> get photoUrls;
  $CaptureMetadataCopyWith<$Res> get captureMetadata;
}

/// @nodoc
class _$MonitoringSessionCopyWithImpl<$Res, $Val extends MonitoringSession>
    implements $MonitoringSessionCopyWith<$Res> {
  _$MonitoringSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? zoneId = null,
    Object? capturedAt = null,
    Object? photoUrls = null,
    Object? captureMetadata = null,
    Object? analysisStatus = null,
    Object? analysisId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      capturedAt: null == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      photoUrls: null == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as PhotoUrls,
      captureMetadata: null == captureMetadata
          ? _value.captureMetadata
          : captureMetadata // ignore: cast_nullable_to_non_nullable
              as CaptureMetadata,
      analysisStatus: null == analysisStatus
          ? _value.analysisStatus
          : analysisStatus // ignore: cast_nullable_to_non_nullable
              as AnalysisStatus,
      analysisId: freezed == analysisId
          ? _value.analysisId
          : analysisId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PhotoUrlsCopyWith<$Res> get photoUrls {
    return $PhotoUrlsCopyWith<$Res>(_value.photoUrls, (value) {
      return _then(_value.copyWith(photoUrls: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CaptureMetadataCopyWith<$Res> get captureMetadata {
    return $CaptureMetadataCopyWith<$Res>(_value.captureMetadata, (value) {
      return _then(_value.copyWith(captureMetadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonitoringSessionImplCopyWith<$Res>
    implements $MonitoringSessionCopyWith<$Res> {
  factory _$$MonitoringSessionImplCopyWith(_$MonitoringSessionImpl value,
          $Res Function(_$MonitoringSessionImpl) then) =
      __$$MonitoringSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String zoneId,
      DateTime capturedAt,
      PhotoUrls photoUrls,
      CaptureMetadata captureMetadata,
      AnalysisStatus analysisStatus,
      String? analysisId,
      String? notes});

  @override
  $PhotoUrlsCopyWith<$Res> get photoUrls;
  @override
  $CaptureMetadataCopyWith<$Res> get captureMetadata;
}

/// @nodoc
class __$$MonitoringSessionImplCopyWithImpl<$Res>
    extends _$MonitoringSessionCopyWithImpl<$Res, _$MonitoringSessionImpl>
    implements _$$MonitoringSessionImplCopyWith<$Res> {
  __$$MonitoringSessionImplCopyWithImpl(_$MonitoringSessionImpl _value,
      $Res Function(_$MonitoringSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? zoneId = null,
    Object? capturedAt = null,
    Object? photoUrls = null,
    Object? captureMetadata = null,
    Object? analysisStatus = null,
    Object? analysisId = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$MonitoringSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      capturedAt: null == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      photoUrls: null == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as PhotoUrls,
      captureMetadata: null == captureMetadata
          ? _value.captureMetadata
          : captureMetadata // ignore: cast_nullable_to_non_nullable
              as CaptureMetadata,
      analysisStatus: null == analysisStatus
          ? _value.analysisStatus
          : analysisStatus // ignore: cast_nullable_to_non_nullable
              as AnalysisStatus,
      analysisId: freezed == analysisId
          ? _value.analysisId
          : analysisId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonitoringSessionImpl implements _MonitoringSession {
  const _$MonitoringSessionImpl(
      {required this.id,
      required this.zoneId,
      required this.capturedAt,
      required this.photoUrls,
      required this.captureMetadata,
      this.analysisStatus = AnalysisStatus.pending,
      this.analysisId,
      this.notes});

  factory _$MonitoringSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonitoringSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String zoneId;
  @override
  final DateTime capturedAt;
  @override
  final PhotoUrls photoUrls;
  @override
  final CaptureMetadata captureMetadata;
  @override
  @JsonKey()
  final AnalysisStatus analysisStatus;
  @override
  final String? analysisId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'MonitoringSession(id: $id, zoneId: $zoneId, capturedAt: $capturedAt, photoUrls: $photoUrls, captureMetadata: $captureMetadata, analysisStatus: $analysisStatus, analysisId: $analysisId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonitoringSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            (identical(other.photoUrls, photoUrls) ||
                other.photoUrls == photoUrls) &&
            (identical(other.captureMetadata, captureMetadata) ||
                other.captureMetadata == captureMetadata) &&
            (identical(other.analysisStatus, analysisStatus) ||
                other.analysisStatus == analysisStatus) &&
            (identical(other.analysisId, analysisId) ||
                other.analysisId == analysisId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, zoneId, capturedAt,
      photoUrls, captureMetadata, analysisStatus, analysisId, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonitoringSessionImplCopyWith<_$MonitoringSessionImpl> get copyWith =>
      __$$MonitoringSessionImplCopyWithImpl<_$MonitoringSessionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonitoringSessionImplToJson(
      this,
    );
  }
}

abstract class _MonitoringSession implements MonitoringSession {
  const factory _MonitoringSession(
      {required final String id,
      required final String zoneId,
      required final DateTime capturedAt,
      required final PhotoUrls photoUrls,
      required final CaptureMetadata captureMetadata,
      final AnalysisStatus analysisStatus,
      final String? analysisId,
      final String? notes}) = _$MonitoringSessionImpl;

  factory _MonitoringSession.fromJson(Map<String, dynamic> json) =
      _$MonitoringSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get zoneId;
  @override
  DateTime get capturedAt;
  @override
  PhotoUrls get photoUrls;
  @override
  CaptureMetadata get captureMetadata;
  @override
  AnalysisStatus get analysisStatus;
  @override
  String? get analysisId;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$MonitoringSessionImplCopyWith<_$MonitoringSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhotoUrls _$PhotoUrlsFromJson(Map<String, dynamic> json) {
  return _PhotoUrls.fromJson(json);
}

/// @nodoc
mixin _$PhotoUrls {
  String get original => throw _privateConstructorUsedError;
  String? get normalized => throw _privateConstructorUsedError;
  String? get thumbnail128 => throw _privateConstructorUsedError;
  String? get thumbnail512 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoUrlsCopyWith<PhotoUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoUrlsCopyWith<$Res> {
  factory $PhotoUrlsCopyWith(PhotoUrls value, $Res Function(PhotoUrls) then) =
      _$PhotoUrlsCopyWithImpl<$Res, PhotoUrls>;
  @useResult
  $Res call(
      {String original,
      String? normalized,
      String? thumbnail128,
      String? thumbnail512});
}

/// @nodoc
class _$PhotoUrlsCopyWithImpl<$Res, $Val extends PhotoUrls>
    implements $PhotoUrlsCopyWith<$Res> {
  _$PhotoUrlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? normalized = freezed,
    Object? thumbnail128 = freezed,
    Object? thumbnail512 = freezed,
  }) {
    return _then(_value.copyWith(
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      normalized: freezed == normalized
          ? _value.normalized
          : normalized // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail128: freezed == thumbnail128
          ? _value.thumbnail128
          : thumbnail128 // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail512: freezed == thumbnail512
          ? _value.thumbnail512
          : thumbnail512 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoUrlsImplCopyWith<$Res>
    implements $PhotoUrlsCopyWith<$Res> {
  factory _$$PhotoUrlsImplCopyWith(
          _$PhotoUrlsImpl value, $Res Function(_$PhotoUrlsImpl) then) =
      __$$PhotoUrlsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String original,
      String? normalized,
      String? thumbnail128,
      String? thumbnail512});
}

/// @nodoc
class __$$PhotoUrlsImplCopyWithImpl<$Res>
    extends _$PhotoUrlsCopyWithImpl<$Res, _$PhotoUrlsImpl>
    implements _$$PhotoUrlsImplCopyWith<$Res> {
  __$$PhotoUrlsImplCopyWithImpl(
      _$PhotoUrlsImpl _value, $Res Function(_$PhotoUrlsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? normalized = freezed,
    Object? thumbnail128 = freezed,
    Object? thumbnail512 = freezed,
  }) {
    return _then(_$PhotoUrlsImpl(
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      normalized: freezed == normalized
          ? _value.normalized
          : normalized // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail128: freezed == thumbnail128
          ? _value.thumbnail128
          : thumbnail128 // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail512: freezed == thumbnail512
          ? _value.thumbnail512
          : thumbnail512 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoUrlsImpl implements _PhotoUrls {
  const _$PhotoUrlsImpl(
      {required this.original,
      this.normalized,
      this.thumbnail128,
      this.thumbnail512});

  factory _$PhotoUrlsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoUrlsImplFromJson(json);

  @override
  final String original;
  @override
  final String? normalized;
  @override
  final String? thumbnail128;
  @override
  final String? thumbnail512;

  @override
  String toString() {
    return 'PhotoUrls(original: $original, normalized: $normalized, thumbnail128: $thumbnail128, thumbnail512: $thumbnail512)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoUrlsImpl &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.normalized, normalized) ||
                other.normalized == normalized) &&
            (identical(other.thumbnail128, thumbnail128) ||
                other.thumbnail128 == thumbnail128) &&
            (identical(other.thumbnail512, thumbnail512) ||
                other.thumbnail512 == thumbnail512));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, original, normalized, thumbnail128, thumbnail512);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoUrlsImplCopyWith<_$PhotoUrlsImpl> get copyWith =>
      __$$PhotoUrlsImplCopyWithImpl<_$PhotoUrlsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoUrlsImplToJson(
      this,
    );
  }
}

abstract class _PhotoUrls implements PhotoUrls {
  const factory _PhotoUrls(
      {required final String original,
      final String? normalized,
      final String? thumbnail128,
      final String? thumbnail512}) = _$PhotoUrlsImpl;

  factory _PhotoUrls.fromJson(Map<String, dynamic> json) =
      _$PhotoUrlsImpl.fromJson;

  @override
  String get original;
  @override
  String? get normalized;
  @override
  String? get thumbnail128;
  @override
  String? get thumbnail512;
  @override
  @JsonKey(ignore: true)
  _$$PhotoUrlsImplCopyWith<_$PhotoUrlsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CaptureMetadata _$CaptureMetadataFromJson(Map<String, dynamic> json) {
  return _CaptureMetadata.fromJson(json);
}

/// @nodoc
mixin _$CaptureMetadata {
  double? get distance => throw _privateConstructorUsedError;
  double? get pitch => throw _privateConstructorUsedError;
  double? get yaw => throw _privateConstructorUsedError;
  double? get roll => throw _privateConstructorUsedError;
  double? get ambientLight => throw _privateConstructorUsedError;
  bool get flashUsed => throw _privateConstructorUsedError;
  String? get deviceModel => throw _privateConstructorUsedError;
  double? get readinessScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaptureMetadataCopyWith<CaptureMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaptureMetadataCopyWith<$Res> {
  factory $CaptureMetadataCopyWith(
          CaptureMetadata value, $Res Function(CaptureMetadata) then) =
      _$CaptureMetadataCopyWithImpl<$Res, CaptureMetadata>;
  @useResult
  $Res call(
      {double? distance,
      double? pitch,
      double? yaw,
      double? roll,
      double? ambientLight,
      bool flashUsed,
      String? deviceModel,
      double? readinessScore});
}

/// @nodoc
class _$CaptureMetadataCopyWithImpl<$Res, $Val extends CaptureMetadata>
    implements $CaptureMetadataCopyWith<$Res> {
  _$CaptureMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = freezed,
    Object? pitch = freezed,
    Object? yaw = freezed,
    Object? roll = freezed,
    Object? ambientLight = freezed,
    Object? flashUsed = null,
    Object? deviceModel = freezed,
    Object? readinessScore = freezed,
  }) {
    return _then(_value.copyWith(
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      pitch: freezed == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as double?,
      yaw: freezed == yaw
          ? _value.yaw
          : yaw // ignore: cast_nullable_to_non_nullable
              as double?,
      roll: freezed == roll
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as double?,
      ambientLight: freezed == ambientLight
          ? _value.ambientLight
          : ambientLight // ignore: cast_nullable_to_non_nullable
              as double?,
      flashUsed: null == flashUsed
          ? _value.flashUsed
          : flashUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceModel: freezed == deviceModel
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String?,
      readinessScore: freezed == readinessScore
          ? _value.readinessScore
          : readinessScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaptureMetadataImplCopyWith<$Res>
    implements $CaptureMetadataCopyWith<$Res> {
  factory _$$CaptureMetadataImplCopyWith(_$CaptureMetadataImpl value,
          $Res Function(_$CaptureMetadataImpl) then) =
      __$$CaptureMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? distance,
      double? pitch,
      double? yaw,
      double? roll,
      double? ambientLight,
      bool flashUsed,
      String? deviceModel,
      double? readinessScore});
}

/// @nodoc
class __$$CaptureMetadataImplCopyWithImpl<$Res>
    extends _$CaptureMetadataCopyWithImpl<$Res, _$CaptureMetadataImpl>
    implements _$$CaptureMetadataImplCopyWith<$Res> {
  __$$CaptureMetadataImplCopyWithImpl(
      _$CaptureMetadataImpl _value, $Res Function(_$CaptureMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = freezed,
    Object? pitch = freezed,
    Object? yaw = freezed,
    Object? roll = freezed,
    Object? ambientLight = freezed,
    Object? flashUsed = null,
    Object? deviceModel = freezed,
    Object? readinessScore = freezed,
  }) {
    return _then(_$CaptureMetadataImpl(
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      pitch: freezed == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as double?,
      yaw: freezed == yaw
          ? _value.yaw
          : yaw // ignore: cast_nullable_to_non_nullable
              as double?,
      roll: freezed == roll
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as double?,
      ambientLight: freezed == ambientLight
          ? _value.ambientLight
          : ambientLight // ignore: cast_nullable_to_non_nullable
              as double?,
      flashUsed: null == flashUsed
          ? _value.flashUsed
          : flashUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceModel: freezed == deviceModel
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String?,
      readinessScore: freezed == readinessScore
          ? _value.readinessScore
          : readinessScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaptureMetadataImpl implements _CaptureMetadata {
  const _$CaptureMetadataImpl(
      {this.distance,
      this.pitch,
      this.yaw,
      this.roll,
      this.ambientLight,
      this.flashUsed = false,
      this.deviceModel,
      this.readinessScore});

  factory _$CaptureMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaptureMetadataImplFromJson(json);

  @override
  final double? distance;
  @override
  final double? pitch;
  @override
  final double? yaw;
  @override
  final double? roll;
  @override
  final double? ambientLight;
  @override
  @JsonKey()
  final bool flashUsed;
  @override
  final String? deviceModel;
  @override
  final double? readinessScore;

  @override
  String toString() {
    return 'CaptureMetadata(distance: $distance, pitch: $pitch, yaw: $yaw, roll: $roll, ambientLight: $ambientLight, flashUsed: $flashUsed, deviceModel: $deviceModel, readinessScore: $readinessScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaptureMetadataImpl &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.pitch, pitch) || other.pitch == pitch) &&
            (identical(other.yaw, yaw) || other.yaw == yaw) &&
            (identical(other.roll, roll) || other.roll == roll) &&
            (identical(other.ambientLight, ambientLight) ||
                other.ambientLight == ambientLight) &&
            (identical(other.flashUsed, flashUsed) ||
                other.flashUsed == flashUsed) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.readinessScore, readinessScore) ||
                other.readinessScore == readinessScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, distance, pitch, yaw, roll,
      ambientLight, flashUsed, deviceModel, readinessScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CaptureMetadataImplCopyWith<_$CaptureMetadataImpl> get copyWith =>
      __$$CaptureMetadataImplCopyWithImpl<_$CaptureMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaptureMetadataImplToJson(
      this,
    );
  }
}

abstract class _CaptureMetadata implements CaptureMetadata {
  const factory _CaptureMetadata(
      {final double? distance,
      final double? pitch,
      final double? yaw,
      final double? roll,
      final double? ambientLight,
      final bool flashUsed,
      final String? deviceModel,
      final double? readinessScore}) = _$CaptureMetadataImpl;

  factory _CaptureMetadata.fromJson(Map<String, dynamic> json) =
      _$CaptureMetadataImpl.fromJson;

  @override
  double? get distance;
  @override
  double? get pitch;
  @override
  double? get yaw;
  @override
  double? get roll;
  @override
  double? get ambientLight;
  @override
  bool get flashUsed;
  @override
  String? get deviceModel;
  @override
  double? get readinessScore;
  @override
  @JsonKey(ignore: true)
  _$$CaptureMetadataImplCopyWith<_$CaptureMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
