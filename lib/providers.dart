import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/database.dart';
import 'domain/home_summary.dart';
import 'domain/medication_view.dart';
import 'domain/refill_service.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final refillServiceProvider = Provider<RefillService>((ref) {
  return RefillService(ref.watch(databaseProvider));
});

final medicationsStreamProvider = StreamProvider<List<Medication>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.medicationDao.watchActiveMedications();
});

final archivedMedicationsProvider = StreamProvider<List<Medication>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.medicationDao.watchArchivedMedications();
});

final medicationDosageProvider =
    StreamProvider.family<List<DosageEntry>, int>((ref, medicationId) {
  final db = ref.watch(databaseProvider);
  return db.medicationDao.watchDosageFor(medicationId);
});

final medicationViewsProvider = FutureProvider<List<MedicationView>>((ref) async {
  // Re-evaluate when underlying medications change.
  ref.watch(medicationsStreamProvider);
  final service = ref.watch(refillServiceProvider);
  return service.getMedicationViews();
});

final purchasesStreamProvider = StreamProvider<List<Purchase>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.purchaseDao.watchAll();
});

final refillsStreamProvider = StreamProvider<List<Refill>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.refillDao.watchAll();
});

final homeSummaryProvider = FutureProvider<HomeSummary>((ref) async {
  final views = await ref.watch(medicationViewsProvider.future);
  final refills = await ref.watch(refillsStreamProvider.future);
  final last = refills.isEmpty ? null : refills.first.date;
  return HomeSummary.build(views: views, lastRefillDate: last);
});

final localeSettingProvider = StreamProvider<String?>((ref) {
  final db = ref.watch(databaseProvider);
  return db.settingsDao.watchValue('locale');
});
