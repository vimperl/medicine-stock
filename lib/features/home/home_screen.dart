import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../domain/dosage_calculator.dart';
import '../../domain/home_summary.dart';
import '../../domain/medication_category.dart';
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
    final summaryAsync = ref.watch(homeSummaryProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.appTitle)),
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
                        style: Theme.of(context).textTheme.bodyLarge)));
          }
          return _HomeBody(summary: summary);
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

class _HomeBody extends StatelessWidget {
  final HomeSummary summary;
  const _HomeBody({required this.summary});

  @override
  Widget build(BuildContext context) {
    final l = AppL10n.of(context)!;
    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 140),
      children: [
        _HeroCard(summary: summary),
        const SizedBox(height: 16),
        if (summary.upcoming.isNotEmpty) ...[
          _SectionHeader(text: l.upcomingNeeds),
          for (final v in summary.upcoming) _MedicationTile(view: v),
          const SizedBox(height: 16),
          _SectionHeader(text: l.allMedications),
        ],
        if (summary.upcoming.isEmpty) _SectionHeader(text: l.allMedications),
        for (final v in summary.all) _MedicationTile(view: v),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  final HomeSummary summary;
  const _HeroCard({required this.summary});

  @override
  Widget build(BuildContext context) {
    final l = AppL10n.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final weeks = summary.minWeeks;
    final depletion = summary.depletionDate;

    String bigText;
    Color bigColor;
    if (weeks == null) {
      bigText = '—';
      bigColor = scheme.outline;
    } else if (weeks == 0) {
      bigText = '0';
      bigColor = scheme.error;
    } else {
      bigText = '$weeks';
      bigColor = weeks <= 2 ? Colors.orange.shade700 : scheme.primary;
    }

    return Card(
      elevation: 0,
      color: scheme.primaryContainer.withValues(alpha: 0.35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: scheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.weeksOfSupply,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: scheme.onSurfaceVariant)),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(bigText,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: bigColor,
                          fontWeight: FontWeight.w700,
                        )),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    weeks == null
                        ? l.noActiveDosage
                        : l.weeksUnit,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                  ),
                ),
              ],
            ),
            if (depletion != null) ...[
              const SizedBox(height: 2),
              Text(
                l.supplyUntil(DateFormat.yMMMd(locale).format(depletion)),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
              ),
            ],
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 4,
              children: [
                _Counter(
                  icon: Icons.medication_outlined,
                  label: l.summaryActive(summary.activeCount),
                  color: scheme.onSurface,
                ),
                if (summary.lowCount > 0)
                  _Counter(
                    icon: Icons.warning_amber_outlined,
                    label: l.summaryLow(summary.lowCount),
                    color: Colors.orange.shade800,
                  ),
                if (summary.outOfStockCount > 0)
                  _Counter(
                    icon: Icons.error_outline,
                    label: l.summaryOut(summary.outOfStockCount),
                    color: scheme.error,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(children: [
              Icon(Icons.inventory_2_outlined,
                  size: 16, color: scheme.onSurfaceVariant),
              const SizedBox(width: 6),
              Text(
                summary.daysSinceLastRefill == null
                    ? l.neverRefilled
                    : l.lastRefillAgo(summary.daysSinceLastRefill!),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _Counter({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: color, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader({required this.text});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
      child: Text(text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: scheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              )),
    );
  }
}

class _MedicationTile extends StatelessWidget {
  final MedicationView view;
  const _MedicationTile({required this.view});

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
          onTap: () => context.go('/med/${view.medication.id}'),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 5, color: accent),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                view.medication.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            _CategoryChip(
                                category: category, accent: accent),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
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
                          ],
                        ),
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
                color: accent,
                fontSize: 11,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
