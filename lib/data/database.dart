import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables.dart';
import 'daos/medication_dao.dart';
import 'daos/purchase_dao.dart';
import 'daos/refill_dao.dart';
import 'daos/settings_dao.dart';

part 'database.g.dart';

const int kCurrentSchemaVersion = 2;

@DriftDatabase(
  tables: [
    Medications,
    DosageEntries,
    Purchases,
    Refills,
    RefillItems,
    AppSettings,
  ],
  daos: [
    MedicationDao,
    PurchaseDao,
    RefillDao,
    SettingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => kCurrentSchemaVersion;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          // Non-destructive migrations only. A pre-migration copy of the
          // .sqlite file is written by DatabaseBackup.backupBeforeMigration()
          // in main.dart before drift opens this database, so even a failed
          // step here is recoverable by restoring the .bak-v<from>-*.sqlite.
          //
          // Add additive steps per version bump, e.g.:
          //   if (from < 3) {
          //     await m.addColumn(medications, medications.newField);
          //   }
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'medicine_stock_db');
  }
}
