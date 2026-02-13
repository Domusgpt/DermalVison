// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userProfileRepositoryHash() =>
    r'cee3fcdc2d0c3f48c82da614a719aa239239e2ea';

/// See also [userProfileRepository].
@ProviderFor(userProfileRepository)
final userProfileRepositoryProvider = Provider<UserProfileRepository>.internal(
  userProfileRepository,
  name: r'userProfileRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userProfileRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserProfileRepositoryRef = ProviderRef<UserProfileRepository>;
String _$userProfileHash() => r'2a072ddb8e38867b78e0fd5107588c412ee396a0';

/// See also [userProfile].
@ProviderFor(userProfile)
final userProfileProvider = AutoDisposeStreamProvider<UserProfile?>.internal(
  userProfile,
  name: r'userProfileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserProfileRef = AutoDisposeStreamProviderRef<UserProfile?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
