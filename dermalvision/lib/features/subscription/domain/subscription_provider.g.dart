// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subscriptionRepositoryHash() =>
    r'388ebb58664a8ac98e09636cf0b054b75a044efb';

/// See also [subscriptionRepository].
@ProviderFor(subscriptionRepository)
final subscriptionRepositoryProvider =
    AutoDisposeProvider<SubscriptionRepository>.internal(
  subscriptionRepository,
  name: r'subscriptionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subscriptionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubscriptionRepositoryRef
    = AutoDisposeProviderRef<SubscriptionRepository>;
String _$subscriptionHash() => r'd18417921da7e28861a8ff7fc7c1b6b4fe51fc59';

/// See also [subscription].
@ProviderFor(subscription)
final subscriptionProvider = AutoDisposeStreamProvider<CustomerInfo>.internal(
  subscription,
  name: r'subscriptionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$subscriptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubscriptionRef = AutoDisposeStreamProviderRef<CustomerInfo>;
String _$currentTierHash() => r'd9d976aa6ddf29ddcbf7fef5c4b61d4a9edce598';

/// See also [currentTier].
@ProviderFor(currentTier)
final currentTierProvider =
    AutoDisposeFutureProvider<SubscriptionTier>.internal(
  currentTier,
  name: r'currentTierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentTierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentTierRef = AutoDisposeFutureProviderRef<SubscriptionTier>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
