import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/dosage_calculator.dart';
import '../../domain/medication_view.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers.dart';
import '../../widgets/stock_badge.dart';
import '../refill/refill_dialog.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    final viewsAsync = ref.watch(medicationViewsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.appTitle)),
      body: viewsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (views) {
          if (views.isEmpty) {
            return Center(
                child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(l.noMedications,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge)));
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 120),
            itemCount: views.length,
            separatorBuilder: (_, __) => const SizedBox(height: 4),
            itemBuilder: (ctx, i) => _MedicationTile(view: views[i]),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: 'fill',
            icon: const Icon(Icons.inventory_2),
            label: Text(l.fillBoxButton),
            onPressed: () => showRefillDialog(context, ref),
          ),
          const SizedBox(height: 12),
          Row(mainAxisSize: MainAxisSize.min, children: [
            FloatingActionButton.small(
              heroTag: 'purchase',
              tooltip: l.addPurchase,
              onPressed: () => context.go('/purchase'),
              child: const Icon(Icons.shopping_bag),
            ),
            const SizedBox(width: 12),
            FloatingActionButton.small(
              heroTag: 'add',
              tooltip: l.addMedication,
              onPressed: () => context.go('/med/new'),
              child: const Icon(Icons.add),
            ),
          ]),
        ],
      ),
    );
  }
}

class _MedicationTile extends ConsumerWidget {
  final MedicationView view;
  const _MedicationTile({required this.view});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    return Card(
      child: ListTile(
        title: Text(view.medication.name,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
                '${DosageCalculator.formatQuantity(view.medication.currentStockTablets)} ${l.tabletsUnit}  •  ${l.weeklyConsumption(DosageCalculator.formatQuantity(view.weeklyConsumption))}'),
          ],
        ),
        trailing: StockBadge(view: view),
        onTap: () => context.go('/med/${view.medication.id}'),
      ),
    );
  }
}
