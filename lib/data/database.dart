import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables.dart';
import 'daos/medication_dao.dart';
import 'daos/purchase_dao.dart';
import 'daos/refill_dao.dart';
import 'daos/settings_dao.dart';

part 'database.g.dart';

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
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            for (final t in allTables) {
              await m.deleteTable(t.actualTableName);
            }
            await m.createAll();
          }
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'medicine_stock_db');
  }
}
