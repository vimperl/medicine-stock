import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/medication_category.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers.dart';
import '../../widgets/empty_state.dart';

class ArchivedMedicationsScreen extends ConsumerWidget {
  const ArchivedMedicationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppL10n.of(context)!;
    final archivedAsync = ref.watch(archivedMedicationsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.archivedMedications)),
      body: archivedAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (list) {
          if (list.isEmpty) {
            return EmptyState(
              image: 'assets/illustrations/no_archive.png',
              message: l.noArchivedMedications,
            );
          }
          final locale = Localizations.localeOf(context).toLanguageTag();
          final dateFmt = DateFormat.yMMMd(locale);
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: list.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (ctx, i) {
              final m = list[i];
              final category = MedicationCategory.fromKey(m.category);
              final accent = category.accentColor(
                  Theme.of(context).brightness);
              return ListTile(
                leading: Icon(category.icon, color: accent),
                title: Text(m.name,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(m.archivedAt != null
                    ? l.archivedOn(dateFmt.format(m.archivedAt!))
                    : ''),
                trailing: TextButton.icon(
                  icon: const Icon(Icons.unarchive_outlined),
                  label: Text(l.unarchive),
                  onPressed: () async {
                    final db = ref.read(databaseProvider);
                    await db.medicationDao.unarchiveMedication(m.id);
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l.medicationRestored)),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
