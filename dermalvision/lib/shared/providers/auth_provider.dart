import 'package:dermalvision/shared/models/subscription_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subscriptionProvider =
    StateProvider<SubscriptionState>((ref) => SubscriptionState.free);

final appBootedAtProvider = Provider<DateTime>((ref) => DateTime.now());
