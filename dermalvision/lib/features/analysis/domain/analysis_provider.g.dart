// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$analysisRepositoryHash() =>
    r'be638ab453bf2114a1f2719fd9e3a675f197b3f4';

/// See also [analysisRepository].
@ProviderFor(analysisRepository)
final analysisRepositoryProvider =
    AutoDisposeProvider<AnalysisRepository>.internal(
  analysisRepository,
  name: r'analysisRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$analysisRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AnalysisRepositoryRef = AutoDisposeProviderRef<AnalysisRepository>;
String _$analysisResultHash() => r'1d86b487e4635ce9fad2f0ea524a350d1c8a3917';

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

/// See also [analysisResult].
@ProviderFor(analysisResult)
const analysisResultProvider = AnalysisResultFamily();

/// See also [analysisResult].
class AnalysisResultFamily extends Family<AsyncValue<AnalysisResult?>> {
  /// See also [analysisResult].
  const AnalysisResultFamily();

  /// See also [analysisResult].
  AnalysisResultProvider call(
    String sessionId,
  ) {
    return AnalysisResultProvider(
      sessionId,
    );
  }

  @override
  AnalysisResultProvider getProviderOverride(
    covariant AnalysisResultProvider provider,
  ) {
    return call(
      provider.sessionId,
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
  String? get name => r'analysisResultProvider';
}

/// See also [analysisResult].
class AnalysisResultProvider
    extends AutoDisposeFutureProvider<AnalysisResult?> {
  /// See also [analysisResult].
  AnalysisResultProvider(
    String sessionId,
  ) : this._internal(
          (ref) => analysisResult(
            ref as AnalysisResultRef,
            sessionId,
          ),
          from: analysisResultProvider,
          name: r'analysisResultProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$analysisResultHash,
          dependencies: AnalysisResultFamily._dependencies,
          allTransitiveDependencies:
              AnalysisResultFamily._allTransitiveDependencies,
          sessionId: sessionId,
        );

  AnalysisResultProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<AnalysisResult?> Function(AnalysisResultRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnalysisResultProvider._internal(
        (ref) => create(ref as AnalysisResultRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AnalysisResult?> createElement() {
    return _AnalysisResultProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnalysisResultProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AnalysisResultRef on AutoDisposeFutureProviderRef<AnalysisResult?> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _AnalysisResultProviderElement
    extends AutoDisposeFutureProviderElement<AnalysisResult?>
    with AnalysisResultRef {
  _AnalysisResultProviderElement(super.provider);

  @override
  String get sessionId => (origin as AnalysisResultProvider).sessionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
