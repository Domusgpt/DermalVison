import '../../body_map/domain/body_zone.dart';

class ScheduledReminder {
  const ScheduledReminder({
    required this.id,
    required this.title,
    required this.body,
    required this.scheduledDate,
  });

  final int id;
  final String title;
  final String body;
  final DateTime scheduledDate;
}

List<ScheduledReminder> buildScheduledReminders(
  List<BodyZone> zones, {
  DateTime? now,
}) {
  final reference = now ?? DateTime.now();

  return zones
      .where((zone) {
        final schedule = zone.schedule;
        final nextDue = schedule?.nextDue;
        return schedule?.enabled == true && nextDue != null && nextDue.isAfter(reference);
      })
      .map(
        (zone) => ScheduledReminder(
          id: zone.id.hashCode,
          title: 'DermalVision Reminder',
          body: 'Time to capture a new ${zone.customLabel ?? zone.bodyZone} check-in.',
          scheduledDate: zone.schedule!.nextDue!,
        ),
      )
      .toList(growable: false);
}
