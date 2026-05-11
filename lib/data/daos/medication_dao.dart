import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'medication_dao.g.dart';

@DriftAccessor(tables: [Medications, DosageEntries])
class MedicationDao extends DatabaseAccessor<AppDatabase>
    with _$MedicationDaoMixin {
  MedicationDao(super.db);

  Stream<List<Medication>> watchActiveMedications() {
    return (select(medications)..where((m) => m.archivedAt.isNull()))
        .watch();
  }

  Future<List<Medication>> getActiveMedications() {
    return (select(medications)..where((m) => m.archivedAt.isNull())).get();
  }

  Future<Medication?> getById(int id) {
    return (select(medications)..where((m) => m.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<List<DosageEntry>> watchDosageFor(int medicationId) {
    return (select(dosageEntries)
          ..where((d) => d.medicationId.equals(medicationId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.dayOfWeek),
            (t) => OrderingTerm(expression: t.timeSlot),
          ]))
        .watch();
  }

  Future<List<DosageEntry>> getDosageFor(int medicationId) {
    return (select(dosageEntries)
          ..where((d) => d.medicationId.equals(medicationId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.dayOfWeek),
            (t) => OrderingTerm(expression: t.timeSlot),
          ]))
        .get();
  }

  Future<int> insertMedication(MedicationsCompanion entry) {
    return into(medications).insert(entry);
  }

  Future<bool> updateMedication(MedicationsCompanion entry) {
    return update(medications).replace(entry);
  }

  Future<int> archiveMedication(int id) {
    return (update(medications)..where((m) => m.id.equals(id))).write(
      MedicationsCompanion(archivedAt: Value(DateTime.now())),
    );
  }

  Future<void> replaceDosage(
      int medicationId, List<DosageEntriesCompanion> entries) async {
    await transaction(() async {
      await (delete(dosageEntries)
            ..where((d) => d.medicationId.equals(medicationId)))
          .go();
      await batch((b) => b.insertAll(dosageEntries, entries));
    });
  }

  Future<int> adjustStock(int medicationId, double delta) async {
    final current = await getById(medicationId);
    if (current == null) return 0;
    final next = current.currentStockTablets + delta;
    return (update(medications)..where((m) => m.id.equals(medicationId)))
        .write(MedicationsCompanion(currentStockTablets: Value(next)));
  }
}
