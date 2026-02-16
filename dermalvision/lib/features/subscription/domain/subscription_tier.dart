enum SubscriptionTier {
  free,
  plus,
  pro;

  bool get isPremium => this != SubscriptionTier.free;
  bool get isPro => this == SubscriptionTier.pro;
}
