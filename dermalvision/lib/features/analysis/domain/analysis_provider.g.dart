// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analysisRepositoryHash() =>
    r'3ef8df6e9874c871fc072c58bd24dc61a31561be';

/// See also [analysisRepository].
@ProviderFor(analysisRepository)
final analysisRepositoryProvider = Provider<AnalysisRepository>.internal(
  analysisRepository,
  name: r'analysisRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analysisRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnalysisRepositoryRef = ProviderRef<AnalysisRepository>;
String _$analysisHash() => r'ff8ca0c34fb7b0096355fa1da159fb38c217c33e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [analysis].
@ProviderFor(analysis)
const analysisProvider = AnalysisFamily();

/// See also [analysis].
class AnalysisFamily extends Family<AsyncValue<AnalysisResult?>> {
  /// See also [analysis].
  const AnalysisFamily();

  /// See also [analysis].
  AnalysisProvider call(
    String analysisId,
  ) {
    return AnalysisProvider(
      analysisId,
    );
  }

  @override
  AnalysisProvider getProviderOverride(
    covariant AnalysisProvider provider,
  ) {
    return call(
      provider.analysisId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'analysisProvider';
}

/// See also [analysis].
class AnalysisProvider extends AutoDisposeStreamProvider<AnalysisResult?> {
  /// See also [analysis].
  AnalysisProvider(
    String analysisId,
  ) : this._internal(
          (ref) => analysis(
            ref as AnalysisRef,
            analysisId,
          ),
          from: analysisProvider,
          name: r'analysisProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$analysisHash,
          dependencies: AnalysisFamily._dependencies,
          allTransitiveDependencies: AnalysisFamily._allTransitiveDependencies,
          analysisId: analysisId,
        );

  AnalysisProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.analysisId,
  }) : super.internal();

  final String analysisId;

  @override
  Override overrideWith(
    Stream<AnalysisResult?> Function(AnalysisRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnalysisProvider._internal(
        (ref) => create(ref as AnalysisRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        analysisId: analysisId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<AnalysisResult?> createElement() {
    return _AnalysisProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnalysisProvider && other.analysisId == analysisId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, analysisId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AnalysisRef on AutoDisposeStreamProviderRef<AnalysisResult?> {
  /// The parameter `analysisId` of this provider.
  String get analysisId;
}

class _AnalysisProviderElement
    extends AutoDisposeStreamProviderElement<AnalysisResult?> with AnalysisRef {
  _AnalysisProviderElement(super.provider);

  @override
  String get analysisId => (origin as AnalysisProvider).analysisId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
