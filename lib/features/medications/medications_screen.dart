import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../providers.dart';
import '../../widgets/medication_tile.dart';
import '../refill/refill_dialog.dart';

class MedicationsScreen extends ConsumerWidget {
  const MedicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    final summaryAsync = ref.watch(homeSummaryProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.tabMedications)),
      body: summaryAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (summary) {
          if (summary.all.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(l.noMedications,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 160),
            itemCount: summary.all.length,
            itemBuilder: (ctx, i) =>
                MedicationTile(view: summary.all[i]),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: 'meds-fill',
            icon: const Icon(Icons.inventory_2),
            label: Text(l.fillBoxButton),
            onPressed: () => showRefillDialog(context, ref),
          ),
          const SizedBox(height: 12),
          Row(mainAxisSize: MainAxisSize.min, children: [
            FloatingActionButton.small(
              heroTag: 'meds-purchase',
              tooltip: l.addPurchase,
              onPressed: () => context.go('/medications/purchase'),
              child: const Icon(Icons.shopping_bag),
            ),
            const SizedBox(width: 12),
            FloatingActionButton.small(
              heroTag: 'meds-add',
              tooltip: l.addMedication,
              onPressed: () => context.go('/medications/med/new'),
              child: const Icon(Icons.add),
            ),
          ]),
        ],
      ),
    );
  }
}
