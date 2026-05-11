import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../domain/time_slot.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers.dart';
import '../../services/notification_service.dart';

class MedicationFormScreen extends ConsumerStatefulWidget {
  final int? medicationId;
  const MedicationFormScreen({super.key, this.medicationId});

  @override
  ConsumerState<MedicationFormScreen> createState() => _MedicationFormState();
}

class _MedicationFormState extends ConsumerState<MedicationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  final _packageSizeCtrl = TextEditingController(text: '30');
  final _alertCtrl = TextEditingController(text: '2');
  final _stockCtrl = TextEditingController(text: '0');

  // dosage[day][slot] = quantity (double, supports halves)
  final Map<int, Map<TimeSlot, double>> _dosage = {
    for (int d = 0; d < 7; d++) d: {for (final s in TimeSlot.values) s: 0.0}
  };

  bool _loading = true;
  bool _isEdit = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final id = widget.medicationId;
    if (id == null) {
      setState(() => _loading = false);
      return;
    }
    _isEdit = true;
    final db = ref.read(databaseProvider);
    final med = await db.medicationDao.getById(id);
    final entries = await db.medicationDao.getDosageFor(id);
    if (med != null) {
      _nameCtrl.text = med.name;
      _notesCtrl.text = med.notes ?? '';
      _packageSizeCtrl.text = med.packageSize.toString();
      _alertCtrl.text = med.alertThresholdWeeks.toString();
      _stockCtrl.text = med.currentStockTablets.toString();
      for (final e in entries) {
        _dosage[e.dayOfWeek]?[TimeSlot.fromKey(e.timeSlot)] = e.quantity;
      }
    }
    setState(() => _loading = false);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _notesCtrl.dispose();
    _packageSizeCtrl.dispose();
    _alertCtrl.dispose();
    _stockCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final db = ref.read(databaseProvider);
    final l = AppL10n.of(context)!;
    final name = _nameCtrl.text.trim();
    final notes = _notesCtrl.text.trim();
    final packageSize = int.tryParse(_packageSizeCtrl.text) ?? 30;
    final alert = int.tryParse(_alertCtrl.text) ?? 2;
    final stock = double.tryParse(_stockCtrl.text.replaceAll(',', '.')) ?? 0.0;

    int medId;
    if (_isEdit) {
      final existing = await db.medicationDao.getById(widget.medicationId!);
      if (existing == null) return;
      await db.medicationDao.updateMedication(MedicationsCompanion(
        id: d.Value(existing.id),
        name: d.Value(name),
        notes: d.Value(notes.isEmpty ? null : notes),
        packageSize: d.Value(packageSize),
        alertThresholdWeeks: d.Value(alert),
        currentStockTablets: d.Value(stock),
        createdAt: d.Value(existing.createdAt),
      ));
      medId = existing.id;
    } else {
      medId = await db.medicationDao.insertMedication(
        MedicationsCompanion.insert(
          name: name,
          notes: d.Value(notes.isEmpty ? null : notes),
          packageSize: d.Value(packageSize),
          alertThresholdWeeks: d.Value(alert),
          currentStockTablets: d.Value(stock),
        ),
      );
    }

    final entries = <DosageEntriesCompanion>[];
    for (final dayEntry in _dosage.entries) {
      for (final slotEntry in dayEntry.value.entries) {
        if (slotEntry.value > 0) {
          entries.add(DosageEntriesCompanion.insert(
            medicationId: medId,
            dayOfWeek: dayEntry.key,
            timeSlot: slotEntry.key.key,
            quantity: slotEntry.value,
          ));
        }
      }
    }
    await db.medicationDao.replaceDosage(medId, entries);

    await NotificationService.instance.evaluate(db,
        lowStockTitle: l.lowStockNotificationTitle,
        bodyBuilder: (med, weeks) =>
            l.lowStockNotificationBody(med, weeks));

    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l.medicationSaved)));
    context.go('/');
  }

  Future<void> _archive() async {
    if (widget.medicationId == null) return;
    final db = ref.read(databaseProvider);
    final l = AppL10n.of(context)!;
    await db.medicationDao.archiveMedication(widget.medicationId!);
    await NotificationService.instance.cancel(widget.medicationId!);
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l.medicationArchived)));
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final l = AppL10n.of(context)!;
    if (_loading) {
      return Scaffold(
          appBar: AppBar(),
          body: const Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? l.editMedication : l.addMedication),
        actions: [
          if (_isEdit)
            IconButton(
              icon: const Icon(Icons.archive_outlined),
              tooltip: l.archive,
              onPressed: _archive,
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameCtrl,
              decoration: InputDecoration(labelText: l.medicationName),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? '✱' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _notesCtrl,
              decoration: InputDecoration(labelText: l.medicationNotes),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: TextFormField(
                  controller: _packageSizeCtrl,
                  decoration: InputDecoration(labelText: l.packageSize),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _alertCtrl,
                  decoration:
                      InputDecoration(labelText: l.alertThresholdWeeks),
                  keyboardType: TextInputType.number,
                ),
              ),
            ]),
            const SizedBox(height: 12),
            TextFormField(
              controller: _stockCtrl,
              decoration: InputDecoration(labelText: l.currentStock),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Text(l.dosageSchedule,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            _DosageGrid(
              dosage: _dosage,
              onChanged: () => setState(() {}),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: Text(l.save)),
          ],
        ),
      ),
    );
  }
}

class _DosageGrid extends StatelessWidget {
  final Map<int, Map<TimeSlot, double>> dosage;
  final VoidCallback onChanged;
  const _DosageGrid({required this.dosage, required this.onChanged});

  void _copyMondayToAll() {
    final mon = dosage[0]!;
    for (int day = 1; day < 7; day++) {
      for (final slot in TimeSlot.values) {
        dosage[day]![slot] = mon[slot]!;
      }
    }
    onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppL10n.of(context)!;
    final dayLabels = [
      l.monday,
      l.tuesday,
      l.wednesday,
      l.thursday,
      l.friday,
      l.saturday,
      l.sunday
    ];
    final slotLabels = {
      TimeSlot.morning: l.morning,
      TimeSlot.noon: l.noon,
      TimeSlot.evening: l.evening,
      TimeSlot.night: l.night,
    };
    final scheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            icon: const Icon(Icons.content_copy, size: 18),
            label: Text(l.copyMondayToAll),
            onPressed: _copyMondayToAll,
          ),
        ),
        for (int day = 0; day < 7; day++)
          Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dayLabels[day],
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: scheme.primary,
                          fontSize: 15)),
                  const SizedBox(height: 6),
                  for (final slot in TimeSlot.values)
                    _SlotRow(
                      label: slotLabels[slot]!,
                      value: dosage[day]![slot]!,
                      onChange: (v) {
                        dosage[day]![slot] = v;
                        onChanged();
                      },
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

const double _step = 0.5;

class _SlotRow extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChange;
  const _SlotRow({
    required this.label,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final hasValue = value > 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                    color: hasValue
                        ? scheme.onSurface
                        : scheme.onSurface.withValues(alpha: 0.6))),
          ),
          _StepperButton(
            icon: Icons.remove,
            onPressed: value > 0 ? () => onChange(value - _step) : null,
          ),
          SizedBox(
            width: 44,
            child: Text(_format(value),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: hasValue ? scheme.primary : scheme.onSurface)),
          ),
          _StepperButton(
            icon: Icons.add,
            onPressed: () => onChange(value + _step),
          ),
        ],
      ),
    );
  }
}

String _format(double v) {
  if (v == v.toInt()) return v.toInt().toString();
  return v.toStringAsFixed(1);
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const _StepperButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final enabled = onPressed != null;
    return SizedBox(
      width: 32,
      height: 32,
      child: Material(
        color: enabled
            ? scheme.primaryContainer
            : scheme.surfaceContainerHighest,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: Icon(icon,
              size: 18,
              color: enabled
                  ? scheme.onPrimaryContainer
                  : scheme.onSurface.withValues(alpha: 0.3)),
        ),
      ),
    );
  }
}
