import 'medication_view.dart';

class HomeSummary {
  final List<MedicationView> all;
  final List<MedicationView> upcoming;
  final int? minWeeks;
  final DateTime? depletionDate;
  final int activeCount;
  final int lowCount;
  final int outOfStockCount;
  final DateTime? lastRefillDate;

  const HomeSummary({
    required this.all,
    required this.upcoming,
    required this.minWeeks,
    required this.depletionDate,
    required this.activeCount,
    required this.lowCount,
    required this.outOfStockCount,
    required this.lastRefillDate,
  });

  int? get daysSinceLastRefill {
    final d = lastRefillDate;
    if (d == null) return null;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final then = DateTime(d.year, d.month, d.day);
    return today.difference(then).inDays;
  }

  static HomeSummary build({
    required List<MedicationView> views,
    required DateTime? lastRefillDate,
  }) {
    final sorted = [...views]..sort((a, b) {
        final wa = a.weeksRemaining;
        final wb = b.weeksRemaining;
        if (wa == null && wb == null) return 0;
        if (wa == null) return 1;
        if (wb == null) return -1;
        return wa.compareTo(wb);
      });

    int? minWeeks;
    for (final v in sorted) {
      final w = v.weeksRemaining;
      if (w == null) continue;
      minWeeks = w;
      break;
    }

    DateTime? depletion;
    if (minWeeks != null) {
      depletion = DateTime.now().add(Duration(days: minWeeks * 7));
    }

    final lowCount = sorted.where((v) => v.isLowStock).length;
    final outCount = sorted.where((v) => v.isOutOfStock).length;
    final upcoming = sorted
        .where((v) => v.isLowStock || v.isOutOfStock)
        .toList();

    return HomeSummary(
      all: sorted,
      upcoming: upcoming,
      minWeeks: minWeeks,
      depletionDate: depletion,
      activeCount: sorted.length,
      lowCount: lowCount,
      outOfStockCount: outCount,
      lastRefillDate: lastRefillDate,
    );
  }
}
