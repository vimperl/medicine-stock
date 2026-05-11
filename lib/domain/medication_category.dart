import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';

enum MedicationCategory {
  prescription('prescription', Colors.red),
  purchase('purchase', Colors.green),
  supplement('supplement', Colors.amber);

  final String key;
  final MaterialColor baseColor;

  const MedicationCategory(this.key, this.baseColor);

  static MedicationCategory fromKey(String? key) {
    for (final c in MedicationCategory.values) {
      if (c.key == key) return c;
    }
    return MedicationCategory.purchase;
  }

  String label(AppL10n l) => switch (this) {
        MedicationCategory.prescription => l.categoryPrescription,
        MedicationCategory.purchase => l.categoryPurchase,
        MedicationCategory.supplement => l.categorySupplement,
      };

  IconData get icon => switch (this) {
        MedicationCategory.prescription => Icons.medical_services_outlined,
        MedicationCategory.purchase => Icons.shopping_bag_outlined,
        MedicationCategory.supplement => Icons.spa_outlined,
      };

  Color accentColor(Brightness brightness) {
    final palette = baseColor;
    return brightness == Brightness.dark
        ? palette.shade300
        : palette.shade600;
  }
}
