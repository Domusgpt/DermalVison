import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

part 'notification_service.g.dart';

@Riverpod(keepAlive: true)
NotificationService notificationService(NotificationServiceRef ref) {
  final service = NotificationService();
  ref.onDispose(service.dispose);
  return service;
}

class NotificationService {
  final _localNotifications = FlutterLocalNotificationsPlugin();
  final _fcm = FirebaseMessaging.instance;

  bool _initialized = false;
  StreamSubscription<RemoteMessage>? _foregroundMessageSubscription;

  Future<void> init() async {
    if (_initialized) return;

    tz.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        // TODO: Route handling hook for deep-link navigation.
      },
    );

    await _fcm.requestPermission();

    _foregroundMessageSubscription = FirebaseMessaging.onMessage.listen((message) {
      _showRemoteNotification(message);
    });

    _initialized = true;
  }

  Future<void> dispose() async {
    await _foregroundMessageSubscription?.cancel();
    _foregroundMessageSubscription = null;
  }

  Future<void> _showRemoteNotification(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            importance: Importance.max,
          ),
        ),
        payload: message.data['route'],
      );
    }
  }

  Future<void> cancelReminder(int id) async {
    await _localNotifications.cancel(id);
  }

  Future<void> scheduleReminder({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    await _localNotifications.cancel(id);

    await _localNotifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'reminders_channel',
          'Reminders',
          importance: Importance.high,
        ),
      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
