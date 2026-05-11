import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'purchase_dao.g.dart';

@DriftAccessor(tables: [Purchases, Medications])
class PurchaseDao extends DatabaseAccessor<AppDatabase>
    with _$PurchaseDaoMixin {
  PurchaseDao(super.db);

  Stream<List<Purchase>> watchAll() {
    return (select(purchases)
          ..orderBy([(p) => OrderingTerm.desc(p.date)]))
        .watch();
  }

  Future<int> recordPurchase({
    required int medicationId,
    required DateTime date,
    required String mode,
    int? boxes,
    required int tablets,
    String? note,
  }) async {
    return await transaction(() async {
      final id = await into(purchases).insert(
        PurchasesCompanion.insert(
          medicationId: medicationId,
          date: date,
          mode: mode,
          boxes: Value(boxes),
          tablets: tablets,
          note: Value(note),
        ),
      );
      final med = await (select(medications)
            ..where((m) => m.id.equals(medicationId)))
          .getSingle();
      await (update(medications)..where((m) => m.id.equals(medicationId)))
          .write(MedicationsCompanion(
              currentStockTablets:
                  Value(med.currentStockTablets + tablets.toDouble())));
      return id;
    });
  }
}
