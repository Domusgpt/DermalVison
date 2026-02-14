// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_zone_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bodyZoneRepositoryHash() =>
    r'4839ad07ef51aa0673a702dd26af4bb4b46657de';

/// See also [bodyZoneRepository].
@ProviderFor(bodyZoneRepository)
final bodyZoneRepositoryProvider = Provider<BodyZoneRepository>.internal(
  bodyZoneRepository,
  name: r'bodyZoneRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bodyZoneRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BodyZoneRepositoryRef = ProviderRef<BodyZoneRepository>;
String _$bodyZonesHash() => r'2faf8365664f2565ed412c093c27819ce8ef5560';

/// See also [bodyZones].
@ProviderFor(bodyZones)
final bodyZonesProvider = AutoDisposeStreamProvider<List<BodyZone>>.internal(
  bodyZones,
  name: r'bodyZonesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bodyZonesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BodyZonesRef = AutoDisposeStreamProviderRef<List<BodyZone>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
