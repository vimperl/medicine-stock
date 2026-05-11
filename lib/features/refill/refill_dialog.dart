import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/dosage_calculator.dart';
import '../../domain/refill_service.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers.dart';
import '../../services/notification_service.dart';

Future<void> showRefillDialog(BuildContext context, WidgetRef ref) async {
  final service = ref.read(refillServiceProvider);
  final preview = await service.preview();
  if (!context.mounted) return;
  await showDialog(
    context: context,
    builder: (ctx) => _RefillDialog(preview: preview),
  );
}

class _RefillDialog extends ConsumerWidget {
  final RefillPreview preview;
  const _RefillDialog({required this.preview});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    final service = ref.read(refillServiceProvider);
    final db = ref.read(databaseProvider);
    if (preview.items.isEmpty) {
      return AlertDialog(
        title: Text(l.fillBoxTitle),
        content: Text(l.fillBoxNoMeds),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l.ok)),
        ],
      );
    }
    return AlertDialog(
      title: Text(l.fillBoxTitle),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.fillBoxSummary(
                DosageCalculator.formatQuantity(preview.totalConsumption),
                preview.items.length)),
            const SizedBox(height: 12),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: preview.items.length,
                itemBuilder: (ctx, i) {
                  final item = preview.items[i];
                  final color = item.wouldGoNegative
                      ? Theme.of(context).colorScheme.error
                      : null;
                  return ListTile(
                    dense: true,
                    title: Text(item.medication.name,
                        style: TextStyle(color: color)),
                    subtitle: Text(
                      '${l.willConsume}: ${DosageCalculator.formatQuantity(item.weeklyConsumption)} ${l.tabletsUnit}  •  ${l.stockAfter(DosageCalculator.formatQuantity(item.stockAfter))}',
                      style: TextStyle(color: color),
                    ),
                    trailing: item.wouldGoNegative
                        ? Icon(Icons.warning_amber, color: color)
                        : null,
                  );
                },
              ),
            ),
            if (preview.hasNegatives)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(l.negativeStockWarning,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.error)),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l.cancel)),
        FilledButton(
          onPressed: preview.hasNegatives
              ? null
              : () async {
                  await service.performRefill(preview: preview);
                  await NotificationService.instance.evaluate(db,
                      lowStockTitle: l.lowStockNotificationTitle,
                      bodyBuilder: (med, weeks) =>
                          l.lowStockNotificationBody(med, weeks));
                  if (!context.mounted) return;
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l.refillSaved)));
                },
          child: Text(l.fillBoxConfirm),
        ),
      ],
    );
  }
}
