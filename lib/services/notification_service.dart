import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import '../data/database.dart';
import '../domain/dosage_calculator.dart';

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const _channelId = 'low_stock_channel';
  static const _channelName = 'Niska zaliha';
  static const _channelDesc = 'Obavestenja o niskoj zalihi lekova';

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    tz.initializeTimeZones();
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);
    await _plugin.initialize(initSettings);
    final android =
        _plugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      await android.requestNotificationsPermission();
      await android.createNotificationChannel(const AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: _channelDesc,
        importance: Importance.high,
      ));
    }
    _initialized = true;
  }

  Future<void> showLowStock({
    required int id,
    required String medication,
    required int weeksLeft,
    required String title,
  }) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDesc,
        importance: Importance.high,
        priority: Priority.high,
      ),
    );
    final body = '$medication: $weeksLeft';
    await _plugin.show(id, title, body, details);
  }

  Future<void> cancel(int id) async {
    await _plugin.cancel(id);
  }

  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  Future<void> evaluate(AppDatabase db,
      {required String lowStockTitle,
      required String Function(String, int) bodyBuilder}) async {
    try {
      final meds = await db.medicationDao.getActiveMedications();
      for (final m in meds) {
        final dosage = await db.medicationDao.getDosageFor(m.id);
        final weekly = DosageCalculator.weeklyConsumption(dosage);
        final isLow = DosageCalculator.isLowStock(
          stock: m.currentStockTablets,
          weekly: weekly,
          thresholdWeeks: m.alertThresholdWeeks,
        );
        if (isLow) {
          final weeks =
              DosageCalculator.weeksRemaining(m.currentStockTablets, weekly) ??
                  0;
          await showLowStock(
            id: m.id,
            medication: m.name,
            weeksLeft: weeks,
            title: lowStockTitle,
          );
        } else {
          await cancel(m.id);
        }
      }
    } catch (e) {
      debugPrint('Notification evaluate failed: $e');
    }
  }
}
