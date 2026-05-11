import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/database.dart';
import '../../domain/dosage_calculator.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers.dart';
import '../../widgets/empty_state.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l.history),
          bottom: TabBar(tabs: [
            Tab(text: l.historyRefills),
            Tab(text: l.historyPurchases),
          ]),
        ),
        body: const TabBarView(children: [
          _RefillsTab(),
          _PurchasesTab(),
        ]),
      ),
    );
  }
}

class _RefillsTab extends ConsumerWidget {
  const _RefillsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    final refillsAsync = ref.watch(refillsStreamProvider);
    final fmt = DateFormat.yMMMd(Localizations.localeOf(context).toString());
    return refillsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('$e')),
      data: (refills) {
        if (refills.isEmpty) {
          return EmptyState(
            image: 'assets/illustrations/no_history.png',
            message: l.noHistory,
          );
        }
        return ListView.builder(
          itemCount: refills.length,
          itemBuilder: (ctx, i) {
            final r = refills[i];
            return _RefillTile(refill: r, dateFormat: fmt);
          },
        );
      },
    );
  }
}

class _RefillTile extends ConsumerWidget {
  final Refill refill;
  final DateFormat dateFormat;
  const _RefillTile({required this.refill, required this.dateFormat});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    final db = ref.watch(databaseProvider);
    return FutureBuilder<List<RefillItem>>(
      future: db.refillDao.itemsFor(refill.id),
      builder: (ctx, snap) {
        return ExpansionTile(
          title: Text(dateFormat.format(refill.date)),
          subtitle: Text(
              '${DosageCalculator.formatQuantity(refill.totalTabletsConsumed)} ${l.tabletsUnit}'),
          children: [
            if (snap.hasData)
              for (final item in snap.data!)
                ListTile(
                  dense: true,
                  title: Text(item.medicationName),
                  trailing:
                      Text(
                          '-${DosageCalculator.formatQuantity(item.tabletsConsumed)} ${l.tabletsUnit}'),
                ),
          ],
        );
      },
    );
  }
}

class _PurchasesTab extends ConsumerWidget {
  const _PurchasesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    final purchasesAsync = ref.watch(purchasesStreamProvider);
    final medsAsync = ref.watch(medicationsStreamProvider);
    final fmt = DateFormat.yMMMd(Localizations.localeOf(context).toString());
    return purchasesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('$e')),
      data: (purchases) {
        if (purchases.isEmpty) {
          return EmptyState(
            image: 'assets/illustrations/no_history.png',
            message: l.noHistory,
          );
        }
        final medsById = {
          for (final m in (medsAsync.valueOrNull ?? <Medication>[])) m.id: m
        };
        return ListView.builder(
          itemCount: purchases.length,
          itemBuilder: (ctx, i) {
            final p = purchases[i];
            final medName = medsById[p.medicationId]?.name ?? '?';
            final desc = p.boxes != null
                ? '${p.boxes} × ${p.tablets ~/ p.boxes!} = ${p.tablets} ${l.tabletsUnit}'
                : '${p.tablets} ${l.tabletsUnit}';
            return ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: Text(medName),
              subtitle: Text(
                  '${fmt.format(p.date)}  •  $desc${p.note != null ? '  •  ${p.note}' : ''}'),
              trailing: Text('+${p.tablets}',
                  style: TextStyle(color: Colors.green.shade700)),
            );
          },
        );
      },
    );
  }
}
