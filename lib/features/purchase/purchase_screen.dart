import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../domain/time_slot.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers.dart';
import '../../services/notification_service.dart';

class PurchaseScreen extends ConsumerStatefulWidget {
  const PurchaseScreen({super.key});

  @override
  ConsumerState<PurchaseScreen> createState() => _PurchaseState();
}

class _PurchaseState extends ConsumerState<PurchaseScreen> {
  final _formKey = GlobalKey<FormState>();
  Medication? _selected;
  PurchaseMode _mode = PurchaseMode.boxes;
  final _qtyCtrl = TextEditingController(text: '1');
  final _noteCtrl = TextEditingController();
  DateTime _date = DateTime.now();

  @override
  void dispose() {
    _qtyCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final res = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (res != null) setState(() => _date = res);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selected == null) return;
    final l = AppL10n.of(context)!;
    final db = ref.read(databaseProvider);
    final qty = int.tryParse(_qtyCtrl.text) ?? 0;
    if (qty <= 0) return;
    final tablets = _mode == PurchaseMode.boxes
        ? qty * _selected!.packageSize
        : qty;
    await db.purchaseDao.recordPurchase(
      medicationId: _selected!.id,
      date: _date,
      mode: _mode.key,
      boxes: _mode == PurchaseMode.boxes ? qty : null,
      tablets: tablets,
      note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
    );
    await NotificationService.instance.evaluate(db,
        lowStockTitle: l.lowStockNotificationTitle,
        bodyBuilder: (med, weeks) =>
            l.lowStockNotificationBody(med, weeks));
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l.purchaseSaved)));
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final l = AppL10n.of(context)!;
    final medsAsync = ref.watch(medicationsStreamProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.addPurchase)),
      body: medsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (meds) {
          if (meds.isEmpty) {
            return Center(child: Text(l.noMedications));
          }
          _selected ??= meds.first;
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                DropdownButtonFormField<Medication>(
                  initialValue: _selected,
                  decoration:
                      InputDecoration(labelText: l.selectMedication),
                  items: [
                    for (final m in meds)
                      DropdownMenuItem(value: m, child: Text(m.name))
                  ],
                  onChanged: (v) => setState(() => _selected = v),
                ),
                const SizedBox(height: 16),
                SegmentedButton<PurchaseMode>(
                  segments: [
                    ButtonSegment(
                        value: PurchaseMode.boxes,
                        label: Text(l.purchaseModeBoxes),
                        icon: const Icon(Icons.inventory_2)),
                    ButtonSegment(
                        value: PurchaseMode.tablets,
                        label: Text(l.purchaseModeTablets),
                        icon: const Icon(Icons.medication)),
                  ],
                  selected: {_mode},
                  onSelectionChanged: (s) =>
                      setState(() => _mode = s.first),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _qtyCtrl,
                  decoration: InputDecoration(
                    labelText: _mode == PurchaseMode.boxes
                        ? l.boxes
                        : l.amount,
                    helperText: _selected != null &&
                            _mode == PurchaseMode.boxes
                        ? '× ${_selected!.packageSize} ${l.tabletsUnit}'
                        : null,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      (int.tryParse(v ?? '') ?? 0) <= 0 ? '✱' : null,
                ),
                const SizedBox(height: 16),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.calendar_today),
                  title: Text(l.date),
                  subtitle: Text(
                      '${_date.year}-${_date.month.toString().padLeft(2, '0')}-${_date.day.toString().padLeft(2, '0')}'),
                  onTap: _pickDate,
                ),
                TextFormField(
                  controller: _noteCtrl,
                  decoration: InputDecoration(labelText: l.note),
                  maxLines: 2,
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                    onPressed: _save,
                    icon: const Icon(Icons.save),
                    label: Text(l.save)),
              ],
            ),
          );
        },
      ),
    );
  }
}
