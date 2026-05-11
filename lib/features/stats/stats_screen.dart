import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../domain/home_summary.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/medication_tile.dart';
import '../../widgets/weekly_refill_chart.dart';
import '../refill/refill_dialog.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    final summaryAsync = ref.watch(homeSummaryProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.tabStats)),
      body: summaryAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (summary) {
          if (summary.all.isEmpty) {
            return EmptyState(
              image: 'assets/illustrations/no_medicine.png',
              message: l.noMedications,
              actionLabel: l.addMedication,
              actionIcon: Icons.add,
              onAction: () => context.go('/medications/med/new'),
            );
          }
          final refills = ref.watch(refillsStreamProvider).valueOrNull ?? [];
          return ListView(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 140),
            children: [
              _HeroCard(summary: summary),
              const SizedBox(height: 16),
              if (summary.upcoming.isNotEmpty) ...[
                _SectionHeader(text: l.upcomingNeeds),
                for (final v in summary.upcoming) MedicationTile(view: v),
                const SizedBox(height: 16),
              ] else
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4, vertical: 16),
                  child: Row(children: [
                    Icon(Icons.check_circle_outline,
                        color: Colors.green.shade600),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(l.allStocked,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ]),
                ),
              if (refills.length >= 2) ...[
                _SectionHeader(text: l.recentRefillsChart),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
                    child: WeeklyRefillChart(refills: refills),
                  ),
                ),
              ],
            ],
          );
        },
      ),
      floatingActionButton: summaryAsync.maybeWhen(
        data: (s) => s.all.isEmpty
            ? null
            : FloatingActionButton.extended(
                heroTag: 'stats-fill',
                icon: const Icon(Icons.inventory_2),
                label: Text(l.fillBoxButton),
                onPressed: () => showRefillDialog(context, ref),
              ),
        orElse: () => null,
      ),
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
                    weeks == null ? l.noActiveDosage : l.weeksUnit,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: scheme.onSurfaceVariant),
                  ),
                ),
              ],
            ),
            if (depletion != null) ...[
              const SizedBox(height: 2),
              Text(
                l.supplyUntil(DateFormat.yMMMd(locale).format(depletion)),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: scheme.onSurfaceVariant),
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
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: scheme.onSurfaceVariant),
              ),
            ]),
            const SizedBox(height: 12),
            FilledButton.tonalIcon(
              onPressed: () => context.go('/medications'),
              icon: const Icon(Icons.list_alt_outlined),
              label: Text(l.allMedications),
            ),
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
