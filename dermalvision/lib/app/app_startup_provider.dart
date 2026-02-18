import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core/services/notification_service.dart';
import '../features/monitoring/domain/scheduling_provider.dart';

part 'app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  final notifications = ref.read(notificationServiceProvider);
  await notifications.init();

  // Keep scheduling manager alive so body zone changes can schedule reminders.
  ref.watch(schedulingManagerProvider);
}
