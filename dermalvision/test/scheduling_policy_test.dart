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

    test('derives reminder from preferredTime when nextDue is null', () {
      final now = DateTime(2026, 2, 18, 10, 0, 0);
      final zone = const BodyZone(
        id: 'zone-derived',
        bodyZone: 'forehead',
        schedule: MonitoringSchedule(
          frequency: 'daily',
          enabled: true,
          preferredTime: '11:30',
        ),
      );

      final reminders = buildScheduledReminders([zone], now: now);

      expect(reminders, hasLength(1));
      expect(reminders.first.scheduledDate, DateTime(2026, 2, 18, 11, 30));
    });

    test('rolls to next weekly slot when preferredTime already passed', () {
      final now = DateTime(2026, 2, 18, 10, 0, 0);
      final zone = const BodyZone(
        id: 'zone-weekly',
        bodyZone: 'chin',
        schedule: MonitoringSchedule(
          frequency: 'weekly',
          enabled: true,
          preferredTime: '09:00',
        ),
      );

      final reminders = buildScheduledReminders([zone], now: now);

      expect(reminders, hasLength(1));
      expect(reminders.first.scheduledDate, DateTime(2026, 2, 25, 9, 0));
    });

    test(
      'skips when schedule has no valid nextDue and invalid preferredTime',
      () {
        final now = DateTime(2026, 2, 18, 10, 0, 0);
        final zone = const BodyZone(
          id: 'zone-invalid-time',
          bodyZone: 'nose',
          schedule: MonitoringSchedule(
            frequency: 'daily',
            enabled: true,
            preferredTime: 'bad-time',
          ),
        );

        final reminders = buildScheduledReminders([zone], now: now);

        expect(reminders, isEmpty);
      },
    );

    test('dedupes reminder IDs keeping the earliest schedule', () {
      final now = DateTime(2026, 2, 18, 10, 0, 0);
      final zones = [
        BodyZone(
          id: 'collision-zone',
          bodyZone: 'left_cheek',
          schedule: MonitoringSchedule(
            frequency: 'daily',
            enabled: true,
            nextDue: now.add(const Duration(hours: 3)),
          ),
        ),
        BodyZone(
          id: 'collision-zone',
          bodyZone: 'right_cheek',
          schedule: MonitoringSchedule(
            frequency: 'daily',
            enabled: true,
            nextDue: now.add(const Duration(hours: 1)),
          ),
        ),
      ];

      final reminders = buildScheduledReminders(zones, now: now);

      expect(reminders, hasLength(1));
      expect(reminders.first.scheduledDate, now.add(const Duration(hours: 1)));
    });
    test('uses stable ID and sorts reminders by soonest scheduled date', () {
      final now = DateTime(2026, 2, 18, 10, 0, 0);
      final zones = [
        const BodyZone(
          id: 'zone-late',
          bodyZone: 'back',
          schedule: MonitoringSchedule(
            frequency: 'daily',
            enabled: true,
            preferredTime: '18:00',
          ),
        ),
        const BodyZone(
          id: 'zone-soon',
          bodyZone: 'face',
          schedule: MonitoringSchedule(
            frequency: 'daily',
            enabled: true,
            preferredTime: '10:30',
          ),
        ),
      ];

      final firstRun = buildScheduledReminders(zones, now: now);
      final secondRun = buildScheduledReminders(zones, now: now);

      expect(firstRun.map((e) => e.scheduledDate).toList(), [
        DateTime(2026, 2, 18, 10, 30),
        DateTime(2026, 2, 18, 18, 0),
      ]);

      expect(
        firstRun.map((e) => e.id).toList(),
        secondRun.map((e) => e.id).toList(),
      );
    });
  });

  group('scheduling helpers', () {
    test('stableNotificationId is deterministic and non-negative', () {
      final a1 = stableNotificationId('zone-alpha');
      final a2 = stableNotificationId('zone-alpha');
      final b = stableNotificationId('zone-beta');

      expect(a1, a2);
      expect(a1, isNot(b));
      expect(a1, greaterThanOrEqualTo(0));
    });

    test('staleReminderIds returns only removed IDs', () {
      final reminders = [
        ScheduledReminder(
          id: 11,
          title: 't',
          body: 'b',
          scheduledDate: DateTime(2026, 2, 18, 10, 0),
        ),
        ScheduledReminder(
          id: 33,
          title: 't',
          body: 'b',
          scheduledDate: DateTime(2026, 2, 18, 11, 0),
        ),
      ];

      final stale = staleReminderIds({11, 22, 33}, reminders);
      expect(stale, {22});
    });
  });
}
