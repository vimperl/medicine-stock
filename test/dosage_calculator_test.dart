import 'package:flutter_test/flutter_test.dart';
import 'package:medicine_stock/data/database.dart';
import 'package:medicine_stock/domain/dosage_calculator.dart';

DosageEntry _e(int day, String slot, double qty) => DosageEntry(
      id: 1,
      medicationId: 1,
      dayOfWeek: day,
      timeSlot: slot,
      quantity: qty,
    );

void main() {
  group('weeklyConsumption', () {
    test('zero entries -> 0', () {
      expect(DosageCalculator.weeklyConsumption([]), 0);
    });
    test('sums all quantities across 7 days', () {
      final entries = [
        for (int d = 0; d < 5; d++) _e(d, 'morning', 1.0),
      ];
      expect(DosageCalculator.weeklyConsumption(entries), 5.0);
    });
    test('different doses per day and time', () {
      final entries = [
        _e(0, 'morning', 2.0),
        _e(0, 'evening', 1.0),
        _e(1, 'morning', 1.0),
        _e(6, 'noon', 3.0),
      ];
      expect(DosageCalculator.weeklyConsumption(entries), 7.0);
    });
    test('handles half tablets', () {
      final entries = [
        for (int d = 0; d < 7; d++) _e(d, 'morning', 0.5),
      ];
      expect(DosageCalculator.weeklyConsumption(entries), 3.5);
    });
  });

  group('weeksRemaining', () {
    test('null when weekly is 0', () {
      expect(DosageCalculator.weeksRemaining(100, 0), null);
    });
    test('floors integer division', () {
      expect(DosageCalculator.weeksRemaining(50, 7), 7);
      expect(DosageCalculator.weeksRemaining(49, 7), 7);
      expect(DosageCalculator.weeksRemaining(48, 7), 6);
    });
    test('zero stock', () {
      expect(DosageCalculator.weeksRemaining(0, 5), 0);
    });
    test('fractional weekly consumption', () {
      expect(DosageCalculator.weeksRemaining(10, 3.5), 2);
      expect(DosageCalculator.weeksRemaining(14, 3.5), 4);
    });
    test('fractional stock', () {
      expect(DosageCalculator.weeksRemaining(10.5, 3.5), 3);
    });
  });

  group('isLowStock', () {
    test('weekly 0 means never low (no schedule)', () {
      expect(
          DosageCalculator.isLowStock(
              stock: 1, weekly: 0, thresholdWeeks: 2),
          false);
    });
    test('triggers when weeks <= threshold', () {
      expect(
          DosageCalculator.isLowStock(
              stock: 14, weekly: 7, thresholdWeeks: 2),
          true);
      expect(
          DosageCalculator.isLowStock(
              stock: 21, weekly: 7, thresholdWeeks: 2),
          false);
    });
    test('zero stock counts as low', () {
      expect(
          DosageCalculator.isLowStock(
              stock: 0, weekly: 5, thresholdWeeks: 1),
          true);
    });
  });

  group('formatQuantity', () {
    test('integer values render without decimals', () {
      expect(DosageCalculator.formatQuantity(0), '0');
      expect(DosageCalculator.formatQuantity(1), '1');
      expect(DosageCalculator.formatQuantity(7), '7');
    });
    test('half values render as .5', () {
      expect(DosageCalculator.formatQuantity(0.5), '0.5');
      expect(DosageCalculator.formatQuantity(1.5), '1.5');
      expect(DosageCalculator.formatQuantity(3.5), '3.5');
    });
  });
}
