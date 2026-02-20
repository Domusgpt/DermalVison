import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../body_map/domain/body_zone_provider.dart';
import '../../../core/services/notification_service.dart';

part 'scheduling_provider.g.dart';

@Riverpod(keepAlive: true)
void schedulingManager(SchedulingManagerRef ref) {
  ref.listen(bodyZonesProvider, (previous, next) {
    next.whenData((zones) {
      final notifications = ref.read(notificationServiceProvider);
      // Placeholder: Loop through zones and schedule reminders
      // for (final zone in zones) {
      //   if (zone.schedule?.enabled == true) { ... }
      // }
    });
  });
}
