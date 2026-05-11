import 'package:flutter/material.dart';

import '../domain/medication_view.dart';
import '../l10n/generated/app_localizations.dart';

class StockBadge extends StatelessWidget {
  final MedicationView view;
  const StockBadge({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    final l = AppL10n.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    final weeks = view.weeksRemaining;
    final Color color;
    final String label;
    if (weeks == null) {
      color = scheme.outline;
      label = l.weeksUnknown;
    } else if (weeks == 0) {
      color = scheme.error;
      label = l.outOfStock;
    } else if (weeks <= view.medication.alertThresholdWeeks) {
      color = Colors.orange;
      label = l.weeksRemaining(weeks);
    } else {
      color = Colors.green.shade700;
      label = l.weeksRemaining(weeks);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(label,
          style: TextStyle(color: color, fontWeight: FontWeight.w600)),
    );
  }
}
