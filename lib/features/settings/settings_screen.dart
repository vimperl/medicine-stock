import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../data/daos/settings_dao.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers.dart';
import '../../services/backup_service.dart';

final backupServiceProvider = Provider<BackupService>((ref) {
  return BackupService(ref.watch(databaseProvider));
});

final lastBackupProvider = StreamProvider<String?>((ref) {
  final db = ref.watch(databaseProvider);
  return db.settingsDao.watchValue(settingLastBackupAt);
});

final googleConnectedProvider = StreamProvider<String?>((ref) {
  final db = ref.watch(databaseProvider);
  return db.settingsDao.watchValue(settingGoogleDriveConnected);
});

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    final db = ref.watch(databaseProvider);
    final backup = ref.watch(backupServiceProvider);
    final lastBackup = ref.watch(lastBackupProvider).valueOrNull;
    final googleConnected =
        ref.watch(googleConnectedProvider).valueOrNull == 'true';
    final currentLocale =
        ref.watch(localeSettingProvider).valueOrNull ?? 'sr_Latn';

    return Scaffold(
      appBar: AppBar(title: Text(l.settings)),
      body: ListView(
        children: [
          ListTile(
            title: Text(l.language,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          RadioListTile<String>(
            title: Text(l.languageSrLatn),
            value: 'sr_Latn',
            groupValue: currentLocale,
            onChanged: (v) =>
                db.settingsDao.setValue(settingLocale, v ?? 'sr_Latn'),
          ),
          RadioListTile<String>(
            title: Text(l.languageSrCyrl),
            value: 'sr_Cyrl',
            groupValue: currentLocale,
            onChanged: (v) =>
                db.settingsDao.setValue(settingLocale, v ?? 'sr_Cyrl'),
          ),
          RadioListTile<String>(
            title: Text(l.languageEn),
            value: 'en',
            groupValue: currentLocale,
            onChanged: (v) =>
                db.settingsDao.setValue(settingLocale, v ?? 'en'),
          ),
          const Divider(),
          ListTile(
            title: Text(l.googleDrive,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(googleConnected
                ? Icons.cloud_done_outlined
                : Icons.cloud_off_outlined),
            title: Text(googleConnected
                ? l.disconnectGoogle
                : l.connectGoogle),
            subtitle: Text(lastBackup != null
                ? l.lastBackup(_formatDate(lastBackup, context))
                : l.lastBackup(l.neverBackedUp)),
            onTap: () async {
              if (googleConnected) {
                await backup.disconnectGoogle();
              } else {
                final ok = await backup.connectGoogle();
                if (ok) {
                  await db.settingsDao
                      .setValue(settingGoogleDriveConnected, 'true');
                }
              }
            },
          ),
          if (googleConnected)
            ListTile(
              leading: const Icon(Icons.backup_outlined),
              title: Text(l.backupNow),
              onTap: () async {
                final ok = await backup.backupToGoogleDrive();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(ok ? '✓' : '✗')));
              },
            ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.upload_file),
            title: Text(l.exportJson),
            onTap: () => backup.shareJson(),
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: Text(l.importJson),
            onTap: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  content: Text(l.importWarning),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: Text(l.cancel)),
                    FilledButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: Text(l.confirm)),
                  ],
                ),
              );
              if (confirm == true) {
                final ok = await backup.importFromPickedFile();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(ok ? '✓' : '✗')));
              }
            },
          ),
          const Divider(),
          Consumer(builder: (ctx, r, _) {
            final archived = r.watch(archivedMedicationsProvider).valueOrNull;
            final count = archived?.length ?? 0;
            return ListTile(
              leading: const Icon(Icons.archive_outlined),
              title: Text(l.archivedMedications),
              subtitle: Text(l.archivedCount(count)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/settings/archived'),
            );
          }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l.about),
            subtitle: Text(l.aboutText),
          ),
        ],
      ),
    );
  }

  String _formatDate(String iso, BuildContext context) {
    try {
      final dt = DateTime.parse(iso);
      return DateFormat.yMMMd(Localizations.localeOf(context).toString())
          .add_Hm()
          .format(dt);
    } catch (_) {
      return iso;
    }
  }
}
