import 'package:drift/drift.dart';

import '../data/database.dart';
import 'dosage_calculator.dart';
import 'medication_view.dart';

class RefillPreviewItem {
  final Medication medication;
  final double weeklyConsumption;
  final double currentStock;
  final double stockAfter;
  final bool wouldGoNegative;

  const RefillPreviewItem({
    required this.medication,
    required this.weeklyConsumption,
    required this.currentStock,
    required this.stockAfter,
    required this.wouldGoNegative,
  });
}

class RefillPreview {
  final List<RefillPreviewItem> items;
  final double totalConsumption;

  const RefillPreview({required this.items, required this.totalConsumption});

  bool get hasNegatives => items.any((i) => i.wouldGoNegative);
}

class RefillService {
  final AppDatabase db;

  RefillService(this.db);

  Future<RefillPreview> preview() async {
    final meds = await db.medicationDao.getActiveMedications();
    final items = <RefillPreviewItem>[];
    var total = 0.0;
    for (final m in meds) {
      final dosage = await db.medicationDao.getDosageFor(m.id);
      final weekly = DosageCalculator.weeklyConsumption(dosage);
      if (weekly == 0) continue;
      final stockAfter = m.currentStockTablets - weekly;
      items.add(RefillPreviewItem(
        medication: m,
        weeklyConsumption: weekly,
        currentStock: m.currentStockTablets,
        stockAfter: stockAfter,
        wouldGoNegative: stockAfter < 0,
      ));
      total += weekly;
    }
    return RefillPreview(items: items, totalConsumption: total);
  }

  Future<int> performRefill({required RefillPreview preview}) async {
    return await db.transaction(() async {
      final now = DateTime.now();
      final refillId = await db.into(db.refills).insert(
            RefillsCompanion.insert(
              date: now,
              totalTabletsConsumed: preview.totalConsumption,
            ),
          );
      for (final item in preview.items) {
        await (db.update(db.medications)
              ..where((m) => m.id.equals(item.medication.id)))
            .write(MedicationsCompanion(
                currentStockTablets: Value(item.stockAfter)));
        await db.into(db.refillItems).insert(
              RefillItemsCompanion.insert(
                refillId: refillId,
                medicationId: item.medication.id,
                medicationName: item.medication.name,
                tabletsConsumed: item.weeklyConsumption,
              ),
            );
      }
      return refillId;
    });
  }

  Future<List<MedicationView>> getMedicationViews() async {
    final meds = await db.medicationDao.getActiveMedications();
    final results = <MedicationView>[];
    for (final m in meds) {
      final dosage = await db.medicationDao.getDosageFor(m.id);
      results.add(MedicationView(medication: m, dosage: dosage));
    }
    return results;
  }
}
