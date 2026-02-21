import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../body_map/domain/body_zone_provider.dart';
import '../../../core/services/notification_service.dart';
import 'scheduling_policy.dart';

part 'scheduling_provider.g.dart';

@Riverpod(keepAlive: true)
void schedulingManager(SchedulingManagerRef ref) {
  final lastScheduledIds = <int>{};

  ref.listen(bodyZonesProvider, (previous, next) {
    next.whenData((zones) async {
      final notifications = ref.read(notificationServiceProvider);
      await notifications.init();

      final reminders = buildScheduledReminders(zones);
      final nextIds = reminders.map((e) => e.id).toSet();

      final idsToCancel = lastScheduledIds.difference(nextIds);
      for (final id in idsToCancel) {
        await notifications.cancelReminder(id);
      }

      for (final reminder in reminders) {
        await notifications.scheduleReminder(
          id: reminder.id,
          title: reminder.title,
          body: reminder.body,
          scheduledDate: reminder.scheduledDate,
        );
      }

      lastScheduledIds
        ..clear()
        ..addAll(nextIds);
    });
  });
}
