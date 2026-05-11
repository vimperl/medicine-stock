import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart' as d;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../data/database.dart';
import '../data/daos/settings_dao.dart';

class BackupPayload {
  final List<Map<String, dynamic>> medications;
  final List<Map<String, dynamic>> dosageEntries;
  final List<Map<String, dynamic>> purchases;
  final List<Map<String, dynamic>> refills;
  final List<Map<String, dynamic>> refillItems;
  final List<Map<String, dynamic>> settings;

  BackupPayload({
    required this.medications,
    required this.dosageEntries,
    required this.purchases,
    required this.refills,
    required this.refillItems,
    required this.settings,
  });

  Map<String, dynamic> toJson() => {
        'version': 1,
        'exportedAt': DateTime.now().toIso8601String(),
        'medications': medications,
        'dosageEntries': dosageEntries,
        'purchases': purchases,
        'refills': refills,
        'refillItems': refillItems,
        'settings': settings,
      };
}

class BackupService {
  final AppDatabase db;

  BackupService(this.db);

  Future<String> exportToJson() async {
    final payload = await _collect();
    return const JsonEncoder.withIndent('  ').convert(payload.toJson());
  }

  Future<File> writeJsonToTempFile() async {
    final json = await exportToJson();
    final dir = await getTemporaryDirectory();
    final file = File(
        '${dir.path}/medicine-stock-backup-${DateTime.now().millisecondsSinceEpoch}.json');
    await file.writeAsString(json);
    return file;
  }

  Future<void> shareJson() async {
    final file = await writeJsonToTempFile();
    await Share.shareXFiles([XFile(file.path)],
        subject: 'Medicine Stock backup');
  }

  Future<bool> importFromPickedFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    if (result == null || result.files.isEmpty) return false;
    final path = result.files.first.path;
    if (path == null) return false;
    final file = File(path);
    final content = await file.readAsString();
    final data = jsonDecode(content) as Map<String, dynamic>;
    await _restore(data);
    return true;
  }

  Future<BackupPayload> _collect() async {
    final medsRows = await db.select(db.medications).get();
    final dosageRows = await db.select(db.dosageEntries).get();
    final purchaseRows = await db.select(db.purchases).get();
    final refillRows = await db.select(db.refills).get();
    final refillItemRows = await db.select(db.refillItems).get();
    final settingsRows = await db.select(db.appSettings).get();

    return BackupPayload(
      medications: medsRows.map(_medToMap).toList(),
      dosageEntries: dosageRows.map(_doseToMap).toList(),
      purchases: purchaseRows.map(_purchaseToMap).toList(),
      refills: refillRows.map(_refillToMap).toList(),
      refillItems: refillItemRows.map(_refillItemToMap).toList(),
      settings: settingsRows.map(_settingToMap).toList(),
    );
  }

  Map<String, dynamic> _medToMap(Medication m) => {
        'id': m.id,
        'name': m.name,
        'notes': m.notes,
        'packageSize': m.packageSize,
        'alertThresholdWeeks': m.alertThresholdWeeks,
        'currentStockTablets': m.currentStockTablets,
        'category': m.category,
        'createdAt': m.createdAt.toIso8601String(),
        'archivedAt': m.archivedAt?.toIso8601String(),
      };

  Map<String, dynamic> _doseToMap(DosageEntry e) => {
        'id': e.id,
        'medicationId': e.medicationId,
        'dayOfWeek': e.dayOfWeek,
        'timeSlot': e.timeSlot,
        'quantity': e.quantity,
      };

  Map<String, dynamic> _purchaseToMap(Purchase p) => {
        'id': p.id,
        'medicationId': p.medicationId,
        'date': p.date.toIso8601String(),
        'mode': p.mode,
        'boxes': p.boxes,
        'tablets': p.tablets,
        'note': p.note,
      };

  Map<String, dynamic> _refillToMap(Refill r) => {
        'id': r.id,
        'date': r.date.toIso8601String(),
        'totalTabletsConsumed': r.totalTabletsConsumed,
      };

  Map<String, dynamic> _refillItemToMap(RefillItem r) => {
        'id': r.id,
        'refillId': r.refillId,
        'medicationId': r.medicationId,
        'medicationName': r.medicationName,
        'tabletsConsumed': r.tabletsConsumed,
      };

  Map<String, dynamic> _settingToMap(AppSetting s) => {
        'key': s.key,
        'value': s.value,
      };

  Future<void> _restore(Map<String, dynamic> data) async {
    await db.transaction(() async {
      await db.delete(db.refillItems).go();
      await db.delete(db.refills).go();
      await db.delete(db.purchases).go();
      await db.delete(db.dosageEntries).go();
      await db.delete(db.medications).go();
      await db.delete(db.appSettings).go();

      for (final raw in (data['medications'] as List)) {
        final m = raw as Map<String, dynamic>;
        await db.into(db.medications).insert(MedicationsCompanion(
              id: d.Value(m['id'] as int),
              name: d.Value(m['name'] as String),
              notes: d.Value(m['notes'] as String?),
              packageSize: d.Value(m['packageSize'] as int? ?? 30),
              alertThresholdWeeks:
                  d.Value(m['alertThresholdWeeks'] as int? ?? 2),
              currentStockTablets: d.Value(
                  (m['currentStockTablets'] as num?)?.toDouble() ?? 0.0),
              category: d.Value(m['category'] as String? ?? 'purchase'),
              createdAt: d.Value(DateTime.parse(m['createdAt'] as String)),
              archivedAt: d.Value(m['archivedAt'] != null
                  ? DateTime.parse(m['archivedAt'] as String)
                  : null),
            ));
      }
      for (final raw in (data['dosageEntries'] as List)) {
        final e = raw as Map<String, dynamic>;
        await db.into(db.dosageEntries).insert(DosageEntriesCompanion(
              id: d.Value(e['id'] as int),
              medicationId: d.Value(e['medicationId'] as int),
              dayOfWeek: d.Value(e['dayOfWeek'] as int),
              timeSlot: d.Value(e['timeSlot'] as String),
              quantity: d.Value((e['quantity'] as num).toDouble()),
            ));
      }
      for (final raw in (data['purchases'] as List)) {
        final p = raw as Map<String, dynamic>;
        await db.into(db.purchases).insert(PurchasesCompanion(
              id: d.Value(p['id'] as int),
              medicationId: d.Value(p['medicationId'] as int),
              date: d.Value(DateTime.parse(p['date'] as String)),
              mode: d.Value(p['mode'] as String),
              boxes: d.Value(p['boxes'] as int?),
              tablets: d.Value(p['tablets'] as int),
              note: d.Value(p['note'] as String?),
            ));
      }
      for (final raw in (data['refills'] as List)) {
        final r = raw as Map<String, dynamic>;
        await db.into(db.refills).insert(RefillsCompanion(
              id: d.Value(r['id'] as int),
              date: d.Value(DateTime.parse(r['date'] as String)),
              totalTabletsConsumed: d.Value(
                  (r['totalTabletsConsumed'] as num).toDouble()),
            ));
      }
      for (final raw in (data['refillItems'] as List)) {
        final r = raw as Map<String, dynamic>;
        await db.into(db.refillItems).insert(RefillItemsCompanion(
              id: d.Value(r['id'] as int),
              refillId: d.Value(r['refillId'] as int),
              medicationId: d.Value(r['medicationId'] as int),
              medicationName: d.Value(r['medicationName'] as String),
              tabletsConsumed:
                  d.Value((r['tabletsConsumed'] as num).toDouble()),
            ));
      }
      for (final raw in (data['settings'] as List)) {
        final s = raw as Map<String, dynamic>;
        await db.into(db.appSettings).insert(AppSettingsCompanion.insert(
              key: s['key'] as String,
              value: s['value'] as String,
            ));
      }
    });
  }

  // Google Drive sync.

  static const _appDataFileName = 'medicine-stock-backup-latest.json';
  final _googleSignIn = GoogleSignIn(scopes: [drive.DriveApi.driveAppdataScope]);

  Future<bool> isGoogleConnected() async {
    final account = await _googleSignIn.signInSilently();
    return account != null;
  }

  Future<bool> connectGoogle() async {
    try {
      final acc = await _googleSignIn.signIn();
      return acc != null;
    } catch (e) {
      debugPrint('Google sign-in failed: $e');
      return false;
    }
  }

  Future<void> disconnectGoogle() async {
    await _googleSignIn.signOut();
    await db.settingsDao.deleteValue(settingGoogleDriveConnected);
  }

  Future<drive.DriveApi?> _driveApi() async {
    final account =
        await _googleSignIn.signInSilently() ?? await _googleSignIn.signIn();
    if (account == null) return null;
    final headers = await account.authHeaders;
    final client = _GoogleAuthClient(headers);
    return drive.DriveApi(client);
  }

  Future<bool> backupToGoogleDrive() async {
    try {
      final api = await _driveApi();
      if (api == null) return false;
      final json = await exportToJson();
      final bytes = utf8.encode(json);

      final existing = await api.files.list(
          spaces: 'appDataFolder',
          q: "name = '$_appDataFileName'",
          $fields: 'files(id, name)');
      final media = drive.Media(Stream.value(bytes), bytes.length);
      if (existing.files != null && existing.files!.isNotEmpty) {
        final fileId = existing.files!.first.id!;
        await api.files.update(drive.File(), fileId, uploadMedia: media);
      } else {
        final f = drive.File()
          ..name = _appDataFileName
          ..parents = ['appDataFolder'];
        await api.files.create(f, uploadMedia: media);
      }
      await db.settingsDao.setValue(
          settingLastBackupAt, DateTime.now().toIso8601String());
      await db.settingsDao
          .setValue(settingGoogleDriveConnected, 'true');
      return true;
    } catch (e) {
      debugPrint('Drive backup failed: $e');
      return false;
    }
  }

  Future<bool> restoreFromGoogleDrive() async {
    try {
      final api = await _driveApi();
      if (api == null) return false;
      final list = await api.files.list(
          spaces: 'appDataFolder',
          q: "name = '$_appDataFileName'",
          $fields: 'files(id, name)');
      if (list.files == null || list.files!.isEmpty) return false;
      final id = list.files!.first.id!;
      final media = await api.files.get(id,
          downloadOptions: drive.DownloadOptions.fullMedia) as drive.Media;
      final bytes = <int>[];
      await for (final chunk in media.stream) {
        bytes.addAll(chunk);
      }
      final data = jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
      await _restore(data);
      return true;
    } catch (e) {
      debugPrint('Drive restore failed: $e');
      return false;
    }
  }
}

class _GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;
  final http.Client _inner = http.Client();

  _GoogleAuthClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(_headers);
    return _inner.send(request);
  }
}
