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

  final reminders = zones
      .where((zone) => zone.schedule?.enabled == true)
      .map((zone) {
        final nextDate = _resolveNextReminderDate(zone.schedule!, reference);
        if (nextDate == null) return null;

        return ScheduledReminder(
          id: _stableNotificationId(zone.id),
          title: 'DermalVision Reminder',
          body:
              'Time to capture a new ${zone.customLabel ?? zone.bodyZone} check-in.',
          scheduledDate: nextDate,
        );
      })
      .whereType<ScheduledReminder>()
      .toList(growable: false);

  reminders.sort((a, b) => a.scheduledDate.compareTo(b.scheduledDate));
  return reminders;
}

int _stableNotificationId(String input) {
  // Deterministic 31-bit FNV-1a hash for stable notification IDs.
  const int fnvOffset = 0x811C9DC5;
  const int fnvPrime = 0x01000193;

  var hash = fnvOffset;
  for (final codeUnit in input.codeUnits) {
    hash ^= codeUnit;
    hash = (hash * fnvPrime) & 0x7fffffff;
  }
  return hash;
}

DateTime? _resolveNextReminderDate(MonitoringSchedule schedule, DateTime now) {
  final nextDue = schedule.nextDue;
  if (nextDue != null && nextDue.isAfter(now)) {
    return nextDue;
  }

  final preferred = _parsePreferredTime(schedule.preferredTime);
  if (preferred == null) {
    return null;
  }

  var candidate = DateTime(
    now.year,
    now.month,
    now.day,
    preferred.$1,
    preferred.$2,
  );
  final step = _frequencyStep(schedule.frequency);

  while (!candidate.isAfter(now)) {
    candidate = candidate.add(step);
  }

  return candidate;
}

Duration _frequencyStep(String frequency) {
  switch (frequency.toLowerCase()) {
    case 'weekly':
      return const Duration(days: 7);
    case 'biweekly':
      return const Duration(days: 14);
    case 'hourly':
      return const Duration(hours: 1);
    case 'daily':
    default:
      return const Duration(days: 1);
  }
}

(int, int)? _parsePreferredTime(String? preferredTime) {
  if (preferredTime == null || preferredTime.trim().isEmpty) return null;

  final parts = preferredTime.split(':');
  if (parts.length != 2) return null;

  final hour = int.tryParse(parts[0]);
  final minute = int.tryParse(parts[1]);
  if (hour == null || minute == null) return null;
  if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return null;

  return (hour, minute);
}
