import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'refill_dao.g.dart';

@DriftAccessor(tables: [Refills, RefillItems])
class RefillDao extends DatabaseAccessor<AppDatabase>
    with _$RefillDaoMixin {
  RefillDao(super.db);

  Stream<List<Refill>> watchAll() {
    return (select(refills)..orderBy([(r) => OrderingTerm.desc(r.date)]))
        .watch();
  }

  Future<List<RefillItem>> itemsFor(int refillId) {
    return (select(refillItems)..where((i) => i.refillId.equals(refillId)))
        .get();
  }
}
