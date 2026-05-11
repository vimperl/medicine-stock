import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/database.dart';

class WeeklyRefillChart extends StatelessWidget {
  final List<Refill> refills;
  final int barsToShow;

  const WeeklyRefillChart({
    super.key,
    required this.refills,
    this.barsToShow = 8,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final locale = Localizations.localeOf(context).toLanguageTag();

    final last = refills.take(barsToShow).toList().reversed.toList();
    if (last.isEmpty) return const SizedBox.shrink();

    final maxY = last
        .map((r) => r.totalTabletsConsumed)
        .fold<double>(0, (a, b) => b > a ? b : a);
    final upper = (maxY * 1.2).clamp(1, double.infinity).toDouble();

    final dateFmt = DateFormat('d.M.', locale);

    return SizedBox(
      height: 180,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: upper,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => scheme.inverseSurface,
              tooltipPadding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 4),
              getTooltipItem: (group, _, rod, _) {
                final r = last[group.x];
                return BarTooltipItem(
                  '${dateFmt.format(r.date)}\n'
                  '${rod.toY.toStringAsFixed(rod.toY == rod.toY.toInt() ? 0 : 1)} tab',
                  TextStyle(
                      color: scheme.onInverseSurface,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                );
              },
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: upper / 4,
            getDrawingHorizontalLine: (_) => FlLine(
              color: scheme.outlineVariant,
              strokeWidth: 0.8,
              dashArray: const [4, 4],
            ),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: upper / 4,
                getTitlesWidget: (value, _) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    value.toInt().toString(),
                    style: TextStyle(
                        color: scheme.onSurfaceVariant, fontSize: 10),
                  ),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTitlesWidget: (value, _) {
                  final i = value.toInt();
                  if (i < 0 || i >= last.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      dateFmt.format(last[i].date),
                      style: TextStyle(
                          color: scheme.onSurfaceVariant, fontSize: 10),
                    ),
                  );
                },
              ),
            ),
          ),
          barGroups: [
            for (int i = 0; i < last.length; i++)
              BarChartGroupData(
                x: i,
                barRods: [
                  BarChartRodData(
                    toY: last[i].totalTabletsConsumed,
                    color: scheme.primary,
                    width: 14,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4)),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
