import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../body_map/domain/body_zone_provider.dart';
import '../../../core/services/notification_service.dart';

part 'scheduling_provider.g.dart';

@Riverpod(keepAlive: true)
void schedulingManager(SchedulingManagerRef ref) {
  ref.listen(bodyZonesProvider, (previous, next) {
    next.whenData((zones) async {
      final notifications = ref.read(notificationServiceProvider);
      await notifications.init();

      for (final zone in zones) {
        final schedule = zone.schedule;
        final nextDue = schedule?.nextDue;

        if (schedule?.enabled != true || nextDue == null || nextDue.isBefore(DateTime.now())) {
          continue;
        }

        await notifications.scheduleReminder(
          id: zone.id.hashCode,
          title: 'DermalVision Reminder',
          body: 'Time to capture a new ${zone.customLabel ?? zone.bodyZone} check-in.',
          scheduledDate: nextDue,
        );
      }
    });
  });
}
