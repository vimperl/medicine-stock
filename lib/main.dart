import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'data/database.dart';
import 'data/database_backup.dart';
import 'services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseBackup.backupBeforeMigration(kCurrentSchemaVersion);
  await NotificationService.instance.init();
  runApp(const ProviderScope(child: LekoviApp()));
}
