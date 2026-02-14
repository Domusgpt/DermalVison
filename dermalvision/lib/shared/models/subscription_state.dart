enum SubscriptionTier { free, premium }

class SubscriptionState {
  const SubscriptionState({
    required this.tier,
    required this.active,
  });

  final SubscriptionTier tier;
  final bool active;

  bool get isPremium => tier == SubscriptionTier.premium && active;

  SubscriptionState copyWith({
    SubscriptionTier? tier,
    bool? active,
  }) {
    return SubscriptionState(
      tier: tier ?? this.tier,
      active: active ?? this.active,
    );
  }

  static const free = SubscriptionState(
    tier: SubscriptionTier.free,
    active: true,
  );
}
