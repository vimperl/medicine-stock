import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

const String _dbName = 'medicine_stock_db';
const String _dbFileName = '$_dbName.sqlite';
const String _backupPrefix = '$_dbName.bak-v';
const int _maxBackups = 3;

class PreMigrationBackup {
  final String path;
  final int fromVersion;
  final int toVersion;

  const PreMigrationBackup({
    required this.path,
    required this.fromVersion,
    required this.toVersion,
  });
}

class DatabaseBackup {
  static Future<File> _dbFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, _dbFileName));
  }

  static Future<int?> readSchemaVersion() async {
    final file = await _dbFile();
    if (!await file.exists()) return null;
    Database? db;
    try {
      db = sqlite3.open(file.path, mode: OpenMode.readOnly);
      final result = db.select('PRAGMA user_version');
      if (result.isEmpty) return null;
      final v = result.first.values.first;
      return v is int ? v : null;
    } catch (e) {
      debugPrint('readSchemaVersion failed: $e');
      return null;
    } finally {
      db?.dispose();
    }
  }

  static Future<PreMigrationBackup?> backupBeforeMigration(
      int currentVersion) async {
    try {
      final onDisk = await readSchemaVersion();
      if (onDisk == null || onDisk == 0 || onDisk == currentVersion) {
        return null;
      }
      final file = await _dbFile();
      final dir = file.parent;
      final ts = DateTime.now().millisecondsSinceEpoch;
      final backup = File(p.join(dir.path, '$_backupPrefix$onDisk-$ts.sqlite'));
      await file.copy(backup.path);
      await _rotate(dir);
      debugPrint('Pre-migration backup written: ${backup.path}');
      return PreMigrationBackup(
        path: backup.path,
        fromVersion: onDisk,
        toVersion: currentVersion,
      );
    } catch (e) {
      debugPrint('Pre-migration backup failed: $e');
      return null;
    }
  }

  static Future<List<File>> listBackups() async {
    final file = await _dbFile();
    final dir = file.parent;
    if (!await dir.exists()) return const [];
    return dir
        .listSync()
        .whereType<File>()
        .where((f) => p.basename(f.path).startsWith(_backupPrefix))
        .toList()
      ..sort((a, b) => b.statSync().modified.compareTo(a.statSync().modified));
  }

  static Future<void> _rotate(Directory dir) async {
    final backups = dir
        .listSync()
        .whereType<File>()
        .where((f) => p.basename(f.path).startsWith(_backupPrefix))
        .toList()
      ..sort((a, b) => b.statSync().modified.compareTo(a.statSync().modified));
    for (final old in backups.skip(_maxBackups)) {
      try {
        await old.delete();
      } catch (e) {
        debugPrint('Failed to delete old backup ${old.path}: $e');
      }
    }
  }
}
