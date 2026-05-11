import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../domain/dosage_calculator.dart';
import '../domain/medication_category.dart';
import '../domain/medication_view.dart';
import '../l10n/generated/app_localizations.dart';
import 'stock_badge.dart';

class MedicationTile extends StatelessWidget {
  final MedicationView view;

  const MedicationTile({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    final l = AppL10n.of(context)!;
    final brightness = Theme.of(context).brightness;
    final category = view.category;
    final accent = category.accentColor(brightness);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => context.go('/medications/med/${view.medication.id}'),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 5, color: accent),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(children: [
                          Expanded(
                            child: Text(
                              view.medication.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _CategoryChip(category: category, accent: accent),
                        ]),
                        const SizedBox(height: 6),
                        Row(children: [
                          Expanded(
                            child: Text(
                              '${DosageCalculator.formatQuantity(view.medication.currentStockTablets)} ${l.tabletsUnit}'
                              '  •  ${l.weeklyConsumption(DosageCalculator.formatQuantity(view.weeklyConsumption))}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant),
                            ),
                          ),
                          const SizedBox(width: 8),
                          StockBadge(view: view),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final MedicationCategory category;
  final Color accent;

  const _CategoryChip({required this.category, required this.accent});

  @override
  Widget build(BuildContext context) {
    final l = AppL10n.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accent.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(category.icon, size: 12, color: accent),
          const SizedBox(width: 4),
          Text(
            category.label(l),
            style: TextStyle(
                color: accent, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
