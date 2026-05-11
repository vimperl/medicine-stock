import '../data/database.dart';

class DosageCalculator {
  static double weeklyConsumption(List<DosageEntry> entries) {
    var total = 0.0;
    for (final e in entries) {
      total += e.quantity;
    }
    return total;
  }

  static int? weeksRemaining(double stock, double weekly) {
    if (weekly <= 0) return null;
    if (stock <= 0) return 0;
    return (stock / weekly).floor();
  }

  static bool isLowStock({
    required double stock,
    required double weekly,
    required int thresholdWeeks,
  }) {
    final weeks = weeksRemaining(stock, weekly);
    if (weeks == null) return false;
    return weeks <= thresholdWeeks;
  }

  static double dailyConsumption(List<DosageEntry> entries, int dayOfWeek) {
    var total = 0.0;
    for (final e in entries) {
      if (e.dayOfWeek == dayOfWeek) total += e.quantity;
    }
    return total;
  }

  /// Format a tablet quantity for display: "1", "0.5", "1.5", "2".
  static String formatQuantity(double q) {
    if (q == q.toInt()) return q.toInt().toString();
    return q.toStringAsFixed(1);
  }
}
