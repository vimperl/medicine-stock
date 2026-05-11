import '../data/database.dart';
import 'dosage_calculator.dart';
import 'medication_category.dart';

class MedicationView {
  final Medication medication;
  final List<DosageEntry> dosage;

  const MedicationView({required this.medication, required this.dosage});

  double get weeklyConsumption =>
      DosageCalculator.weeklyConsumption(dosage);

  int? get weeksRemaining => DosageCalculator.weeksRemaining(
      medication.currentStockTablets, weeklyConsumption);

  bool get isLowStock => DosageCalculator.isLowStock(
        stock: medication.currentStockTablets,
        weekly: weeklyConsumption,
        thresholdWeeks: medication.alertThresholdWeeks,
      );

  bool get isOutOfStock {
    if (weeklyConsumption == 0) return false;
    return medication.currentStockTablets < weeklyConsumption;
  }

  MedicationCategory get category =>
      MedicationCategory.fromKey(medication.category);
}
