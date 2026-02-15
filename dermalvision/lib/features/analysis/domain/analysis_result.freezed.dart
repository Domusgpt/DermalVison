// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalysisResult _$AnalysisResultFromJson(Map<String, dynamic> json) {
  return _AnalysisResult.fromJson(json);
}

/// @nodoc
mixin _$AnalysisResult {
  String get id => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get zoneId => throw _privateConstructorUsedError;
  DateTime get analyzedAt => throw _privateConstructorUsedError;
  Map<String, ConditionResult> get results =>
      throw _privateConstructorUsedError;
  CompositeScores get compositeScores => throw _privateConstructorUsedError;
  bool get referralTriggered => throw _privateConstructorUsedError;
  String? get referralReason => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalysisResultCopyWith<AnalysisResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisResultCopyWith<$Res> {
  factory $AnalysisResultCopyWith(
          AnalysisResult value, $Res Function(AnalysisResult) then) =
      _$AnalysisResultCopyWithImpl<$Res, AnalysisResult>;
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String zoneId,
      DateTime analyzedAt,
      Map<String, ConditionResult> results,
      CompositeScores compositeScores,
      bool referralTriggered,
      String? referralReason,
      String summary});

  $CompositeScoresCopyWith<$Res> get compositeScores;
}

/// @nodoc
class _$AnalysisResultCopyWithImpl<$Res, $Val extends AnalysisResult>
    implements $AnalysisResultCopyWith<$Res> {
  _$AnalysisResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? zoneId = null,
    Object? analyzedAt = null,
    Object? results = null,
    Object? compositeScores = null,
    Object? referralTriggered = null,
    Object? referralReason = freezed,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      analyzedAt: null == analyzedAt
          ? _value.analyzedAt
          : analyzedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, ConditionResult>,
      compositeScores: null == compositeScores
          ? _value.compositeScores
          : compositeScores // ignore: cast_nullable_to_non_nullable
              as CompositeScores,
      referralTriggered: null == referralTriggered
          ? _value.referralTriggered
          : referralTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
      referralReason: freezed == referralReason
          ? _value.referralReason
          : referralReason // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompositeScoresCopyWith<$Res> get compositeScores {
    return $CompositeScoresCopyWith<$Res>(_value.compositeScores, (value) {
      return _then(_value.copyWith(compositeScores: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalysisResultImplCopyWith<$Res>
    implements $AnalysisResultCopyWith<$Res> {
  factory _$$AnalysisResultImplCopyWith(_$AnalysisResultImpl value,
          $Res Function(_$AnalysisResultImpl) then) =
      __$$AnalysisResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String zoneId,
      DateTime analyzedAt,
      Map<String, ConditionResult> results,
      CompositeScores compositeScores,
      bool referralTriggered,
      String? referralReason,
      String summary});

  @override
  $CompositeScoresCopyWith<$Res> get compositeScores;
}

/// @nodoc
class __$$AnalysisResultImplCopyWithImpl<$Res>
    extends _$AnalysisResultCopyWithImpl<$Res, _$AnalysisResultImpl>
    implements _$$AnalysisResultImplCopyWith<$Res> {
  __$$AnalysisResultImplCopyWithImpl(
      _$AnalysisResultImpl _value, $Res Function(_$AnalysisResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? zoneId = null,
    Object? analyzedAt = null,
    Object? results = null,
    Object? compositeScores = null,
    Object? referralTriggered = null,
    Object? referralReason = freezed,
    Object? summary = null,
  }) {
    return _then(_$AnalysisResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _value.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      analyzedAt: null == analyzedAt
          ? _value.analyzedAt
          : analyzedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, ConditionResult>,
      compositeScores: null == compositeScores
          ? _value.compositeScores
          : compositeScores // ignore: cast_nullable_to_non_nullable
              as CompositeScores,
      referralTriggered: null == referralTriggered
          ? _value.referralTriggered
          : referralTriggered // ignore: cast_nullable_to_non_nullable
              as bool,
      referralReason: freezed == referralReason
          ? _value.referralReason
          : referralReason // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisResultImpl implements _AnalysisResult {
  const _$AnalysisResultImpl(
      {required this.id,
      required this.sessionId,
      required this.zoneId,
      required this.analyzedAt,
      final Map<String, ConditionResult> results = const {},
      required this.compositeScores,
      this.referralTriggered = false,
      this.referralReason,
      required this.summary})
      : _results = results;

  factory _$AnalysisResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisResultImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionId;
  @override
  final String zoneId;
  @override
  final DateTime analyzedAt;
  final Map<String, ConditionResult> _results;
  @override
  @JsonKey()
  Map<String, ConditionResult> get results {
    if (_results is EqualUnmodifiableMapView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_results);
  }

  @override
  final CompositeScores compositeScores;
  @override
  @JsonKey()
  final bool referralTriggered;
  @override
  final String? referralReason;
  @override
  final String summary;

  @override
  String toString() {
    return 'AnalysisResult(id: $id, sessionId: $sessionId, zoneId: $zoneId, analyzedAt: $analyzedAt, results: $results, compositeScores: $compositeScores, referralTriggered: $referralTriggered, referralReason: $referralReason, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.analyzedAt, analyzedAt) ||
                other.analyzedAt == analyzedAt) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.compositeScores, compositeScores) ||
                other.compositeScores == compositeScores) &&
            (identical(other.referralTriggered, referralTriggered) ||
                other.referralTriggered == referralTriggered) &&
            (identical(other.referralReason, referralReason) ||
                other.referralReason == referralReason) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      zoneId,
      analyzedAt,
      const DeepCollectionEquality().hash(_results),
      compositeScores,
      referralTriggered,
      referralReason,
      summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisResultImplCopyWith<_$AnalysisResultImpl> get copyWith =>
      __$$AnalysisResultImplCopyWithImpl<_$AnalysisResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisResultImplToJson(
      this,
    );
  }
}

abstract class _AnalysisResult implements AnalysisResult {
  const factory _AnalysisResult(
      {required final String id,
      required final String sessionId,
      required final String zoneId,
      required final DateTime analyzedAt,
      final Map<String, ConditionResult> results,
      required final CompositeScores compositeScores,
      final bool referralTriggered,
      final String? referralReason,
      required final String summary}) = _$AnalysisResultImpl;

  factory _AnalysisResult.fromJson(Map<String, dynamic> json) =
      _$AnalysisResultImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionId;
  @override
  String get zoneId;
  @override
  DateTime get analyzedAt;
  @override
  Map<String, ConditionResult> get results;
  @override
  CompositeScores get compositeScores;
  @override
  bool get referralTriggered;
  @override
  String? get referralReason;
  @override
  String get summary;
  @override
  @JsonKey(ignore: true)
  _$$AnalysisResultImplCopyWith<_$AnalysisResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConditionResult _$ConditionResultFromJson(Map<String, dynamic> json) {
  return _ConditionResult.fromJson(json);
}

/// @nodoc
mixin _$ConditionResult {
  bool get detected => throw _privateConstructorUsedError;
  double get severity => throw _privateConstructorUsedError; // 0-1
  int? get count => throw _privateConstructorUsedError;
  double? get area => throw _privateConstructorUsedError;
  String? get classification => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConditionResultCopyWith<ConditionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionResultCopyWith<$Res> {
  factory $ConditionResultCopyWith(
          ConditionResult value, $Res Function(ConditionResult) then) =
      _$ConditionResultCopyWithImpl<$Res, ConditionResult>;
  @useResult
  $Res call(
      {bool detected,
      double severity,
      int? count,
      double? area,
      String? classification});
}

/// @nodoc
class _$ConditionResultCopyWithImpl<$Res, $Val extends ConditionResult>
    implements $ConditionResultCopyWith<$Res> {
  _$ConditionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detected = null,
    Object? severity = null,
    Object? count = freezed,
    Object? area = freezed,
    Object? classification = freezed,
  }) {
    return _then(_value.copyWith(
      detected: null == detected
          ? _value.detected
          : detected // ignore: cast_nullable_to_non_nullable
              as bool,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as double,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double?,
      classification: freezed == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConditionResultImplCopyWith<$Res>
    implements $ConditionResultCopyWith<$Res> {
  factory _$$ConditionResultImplCopyWith(_$ConditionResultImpl value,
          $Res Function(_$ConditionResultImpl) then) =
      __$$ConditionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool detected,
      double severity,
      int? count,
      double? area,
      String? classification});
}

/// @nodoc
class __$$ConditionResultImplCopyWithImpl<$Res>
    extends _$ConditionResultCopyWithImpl<$Res, _$ConditionResultImpl>
    implements _$$ConditionResultImplCopyWith<$Res> {
  __$$ConditionResultImplCopyWithImpl(
      _$ConditionResultImpl _value, $Res Function(_$ConditionResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detected = null,
    Object? severity = null,
    Object? count = freezed,
    Object? area = freezed,
    Object? classification = freezed,
  }) {
    return _then(_$ConditionResultImpl(
      detected: null == detected
          ? _value.detected
          : detected // ignore: cast_nullable_to_non_nullable
              as bool,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as double,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double?,
      classification: freezed == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionResultImpl implements _ConditionResult {
  const _$ConditionResultImpl(
      {required this.detected,
      required this.severity,
      this.count,
      this.area,
      this.classification});

  factory _$ConditionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionResultImplFromJson(json);

  @override
  final bool detected;
  @override
  final double severity;
// 0-1
  @override
  final int? count;
  @override
  final double? area;
  @override
  final String? classification;

  @override
  String toString() {
    return 'ConditionResult(detected: $detected, severity: $severity, count: $count, area: $area, classification: $classification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionResultImpl &&
            (identical(other.detected, detected) ||
                other.detected == detected) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.classification, classification) ||
                other.classification == classification));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, detected, severity, count, area, classification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionResultImplCopyWith<_$ConditionResultImpl> get copyWith =>
      __$$ConditionResultImplCopyWithImpl<_$ConditionResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionResultImplToJson(
      this,
    );
  }
}

abstract class _ConditionResult implements ConditionResult {
  const factory _ConditionResult(
      {required final bool detected,
      required final double severity,
      final int? count,
      final double? area,
      final String? classification}) = _$ConditionResultImpl;

  factory _ConditionResult.fromJson(Map<String, dynamic> json) =
      _$ConditionResultImpl.fromJson;

  @override
  bool get detected;
  @override
  double get severity;
  @override // 0-1
  int? get count;
  @override
  double? get area;
  @override
  String? get classification;
  @override
  @JsonKey(ignore: true)
  _$$ConditionResultImplCopyWith<_$ConditionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CompositeScores _$CompositeScoresFromJson(Map<String, dynamic> json) {
  return _CompositeScores.fromJson(json);
}

/// @nodoc
mixin _$CompositeScores {
  double get overallHealth => throw _privateConstructorUsedError; // 0-100
  int? get skinAge => throw _privateConstructorUsedError;
  double? get hydrationIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompositeScoresCopyWith<CompositeScores> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompositeScoresCopyWith<$Res> {
  factory $CompositeScoresCopyWith(
          CompositeScores value, $Res Function(CompositeScores) then) =
      _$CompositeScoresCopyWithImpl<$Res, CompositeScores>;
  @useResult
  $Res call({double overallHealth, int? skinAge, double? hydrationIndex});
}

/// @nodoc
class _$CompositeScoresCopyWithImpl<$Res, $Val extends CompositeScores>
    implements $CompositeScoresCopyWith<$Res> {
  _$CompositeScoresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallHealth = null,
    Object? skinAge = freezed,
    Object? hydrationIndex = freezed,
  }) {
    return _then(_value.copyWith(
      overallHealth: null == overallHealth
          ? _value.overallHealth
          : overallHealth // ignore: cast_nullable_to_non_nullable
              as double,
      skinAge: freezed == skinAge
          ? _value.skinAge
          : skinAge // ignore: cast_nullable_to_non_nullable
              as int?,
      hydrationIndex: freezed == hydrationIndex
          ? _value.hydrationIndex
          : hydrationIndex // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompositeScoresImplCopyWith<$Res>
    implements $CompositeScoresCopyWith<$Res> {
  factory _$$CompositeScoresImplCopyWith(_$CompositeScoresImpl value,
          $Res Function(_$CompositeScoresImpl) then) =
      __$$CompositeScoresImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double overallHealth, int? skinAge, double? hydrationIndex});
}

/// @nodoc
class __$$CompositeScoresImplCopyWithImpl<$Res>
    extends _$CompositeScoresCopyWithImpl<$Res, _$CompositeScoresImpl>
    implements _$$CompositeScoresImplCopyWith<$Res> {
  __$$CompositeScoresImplCopyWithImpl(
      _$CompositeScoresImpl _value, $Res Function(_$CompositeScoresImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallHealth = null,
    Object? skinAge = freezed,
    Object? hydrationIndex = freezed,
  }) {
    return _then(_$CompositeScoresImpl(
      overallHealth: null == overallHealth
          ? _value.overallHealth
          : overallHealth // ignore: cast_nullable_to_non_nullable
              as double,
      skinAge: freezed == skinAge
          ? _value.skinAge
          : skinAge // ignore: cast_nullable_to_non_nullable
              as int?,
      hydrationIndex: freezed == hydrationIndex
          ? _value.hydrationIndex
          : hydrationIndex // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompositeScoresImpl implements _CompositeScores {
  const _$CompositeScoresImpl(
      {required this.overallHealth, this.skinAge, this.hydrationIndex});

  factory _$CompositeScoresImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompositeScoresImplFromJson(json);

  @override
  final double overallHealth;
// 0-100
  @override
  final int? skinAge;
  @override
  final double? hydrationIndex;

  @override
  String toString() {
    return 'CompositeScores(overallHealth: $overallHealth, skinAge: $skinAge, hydrationIndex: $hydrationIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompositeScoresImpl &&
            (identical(other.overallHealth, overallHealth) ||
                other.overallHealth == overallHealth) &&
            (identical(other.skinAge, skinAge) || other.skinAge == skinAge) &&
            (identical(other.hydrationIndex, hydrationIndex) ||
                other.hydrationIndex == hydrationIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, overallHealth, skinAge, hydrationIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompositeScoresImplCopyWith<_$CompositeScoresImpl> get copyWith =>
      __$$CompositeScoresImplCopyWithImpl<_$CompositeScoresImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompositeScoresImplToJson(
      this,
    );
  }
}

abstract class _CompositeScores implements CompositeScores {
  const factory _CompositeScores(
      {required final double overallHealth,
      final int? skinAge,
      final double? hydrationIndex}) = _$CompositeScoresImpl;

  factory _CompositeScores.fromJson(Map<String, dynamic> json) =
      _$CompositeScoresImpl.fromJson;

  @override
  double get overallHealth;
  @override // 0-100
  int? get skinAge;
  @override
  double? get hydrationIndex;
  @override
  @JsonKey(ignore: true)
  _$$CompositeScoresImplCopyWith<_$CompositeScoresImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
