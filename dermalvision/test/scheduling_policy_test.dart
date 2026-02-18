import 'package:dermalvision/features/body_map/domain/body_zone.dart';
import 'package:dermalvision/features/monitoring/domain/scheduling_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('buildScheduledReminders', () {
    test('includes only enabled zones with future nextDue', () {
      final now = DateTime(2026, 2, 18, 10, 0, 0);

      final zones = [
        BodyZone(
          id: 'zone-future-enabled',
          bodyZone: 'left_cheek',
          customLabel: 'Left Cheek',
          schedule: MonitoringSchedule(
            frequency: 'daily',
            enabled: true,
            nextDue: now.add(const Duration(hours: 1)),
          ),
        ),
        BodyZone(
          id: 'zone-disabled',
          bodyZone: 'forehead',
          schedule: MonitoringSchedule(
            frequency: 'daily',
            enabled: false,
            nextDue: now.add(const Duration(hours: 2)),
          ),
        ),
        BodyZone(
          id: 'zone-past',
          bodyZone: 'chin',
          schedule: MonitoringSchedule(
            frequency: 'daily',
            enabled: true,
            nextDue: now.subtract(const Duration(minutes: 1)),
          ),
        ),
        const BodyZone(
          id: 'zone-no-schedule',
          bodyZone: 'nose',
        ),
      ];

      final reminders = buildScheduledReminders(zones, now: now);

      expect(reminders, hasLength(1));
      expect(reminders.first.title, 'DermalVision Reminder');
      expect(reminders.first.body, contains('Left Cheek'));
      expect(reminders.first.scheduledDate, now.add(const Duration(hours: 1)));
    });

    test('falls back to bodyZone label when customLabel is null', () {
      final now = DateTime(2026, 2, 18, 10, 0, 0);
      final zone = BodyZone(
        id: 'zone-1',
        bodyZone: 'right_cheek',
        schedule: MonitoringSchedule(
          frequency: 'daily',
          enabled: true,
          nextDue: now.add(const Duration(minutes: 5)),
        ),
      );

      final reminders = buildScheduledReminders([zone], now: now);

      expect(reminders, hasLength(1));
      expect(reminders.first.body, contains('right_cheek'));
    });
  });
}
