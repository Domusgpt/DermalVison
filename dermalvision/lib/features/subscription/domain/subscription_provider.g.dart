// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subscriptionRepositoryHash() =>
    r'b4c049438258b61d308883bffd693be00033ddb3';

/// See also [subscriptionRepository].
@ProviderFor(subscriptionRepository)
final subscriptionRepositoryProvider =
    Provider<SubscriptionRepository>.internal(
  subscriptionRepository,
  name: r'subscriptionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subscriptionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubscriptionRepositoryRef = ProviderRef<SubscriptionRepository>;
String _$subscriptionHash() => r'76419b15a3e7058caed58199028dfa57eb2a5cdd';

/// See also [Subscription].
@ProviderFor(Subscription)
final subscriptionProvider =
    AutoDisposeAsyncNotifierProvider<Subscription, SubscriptionTier>.internal(
  Subscription.new,
  name: r'subscriptionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$subscriptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Subscription = AutoDisposeAsyncNotifier<SubscriptionTier>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
