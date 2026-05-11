// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppL10nEn extends AppL10n {
  AppL10nEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Medications';

  @override
  String get tabHome => 'Home';

  @override
  String get tabHistory => 'History';

  @override
  String get tabSettings => 'Settings';

  @override
  String get addMedication => 'Add medication';

  @override
  String get editMedication => 'Edit medication';

  @override
  String get medicationName => 'Medication name';

  @override
  String get medicationNotes => 'Notes';

  @override
  String get packageSize => 'Tablets per box';

  @override
  String get alertThresholdWeeks => 'Alert threshold (weeks)';

  @override
  String get currentStock => 'Current stock';

  @override
  String get tablets => 'tablets';

  @override
  String weeksRemaining(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks',
      one: '1 week',
      zero: 'None left',
    );
    return '$_temp0';
  }

  @override
  String get weeksUnknown => 'No dosage configured';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get archive => 'Archive';

  @override
  String get confirm => 'Confirm';

  @override
  String get addPurchase => 'Add purchase';

  @override
  String get purchaseModeBoxes => 'Boxes';

  @override
  String get purchaseModeTablets => 'Tablets';

  @override
  String get boxes => 'Number of boxes';

  @override
  String get amount => 'Amount';

  @override
  String get date => 'Date';

  @override
  String get note => 'Note';

  @override
  String get fillBoxButton => 'Filled the pillbox';

  @override
  String get fillBoxTitle => 'Fill 7-day pillbox';

  @override
  String get fillBoxConfirm => 'Confirm fill';

  @override
  String get fillBoxNoMeds => 'No active medications with dosage.';

  @override
  String get willConsume => 'Will consume';

  @override
  String get willGoNegative => 'Insufficient stock!';

  @override
  String stockAfter(String n) {
    return 'After: $n tablets';
  }

  @override
  String weeklyConsumption(String n) {
    return 'Weekly: $n tablets';
  }

  @override
  String get dosageSchedule => 'Dosage schedule';

  @override
  String get morning => 'Morning';

  @override
  String get noon => 'Noon';

  @override
  String get evening => 'Evening';

  @override
  String get night => 'Night';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String get history => 'History';

  @override
  String get historyRefills => 'Refills';

  @override
  String get historyPurchases => 'Purchases';

  @override
  String get noHistory => 'No entries.';

  @override
  String get noMedications => 'No medications. Add your first one.';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get languageSrLatn => 'Serbian (Latin)';

  @override
  String get languageSrCyrl => 'Serbian (Cyrillic)';

  @override
  String get languageEn => 'English';

  @override
  String get googleDrive => 'Google Drive backup';

  @override
  String get connectGoogle => 'Connect account';

  @override
  String get disconnectGoogle => 'Disconnect';

  @override
  String get backupNow => 'Backup now';

  @override
  String lastBackup(String when) {
    return 'Last backup: $when';
  }

  @override
  String get neverBackedUp => 'Never';

  @override
  String get exportJson => 'Export JSON';

  @override
  String get importJson => 'Import JSON';

  @override
  String get importWarning =>
      'Import will replace all existing data. Continue?';

  @override
  String get about => 'About';

  @override
  String get aboutText => 'Medication stock tracking app.';

  @override
  String get lowStockNotificationTitle => 'Low medication stock';

  @override
  String lowStockNotificationBody(String med, int weeks) {
    return '$med: $weeks weeks left';
  }

  @override
  String get outOfStock => 'Out of stock';

  @override
  String get purchaseSaved => 'Purchase recorded';

  @override
  String get refillSaved => 'Refill recorded';

  @override
  String get medicationSaved => 'Medication saved';

  @override
  String get medicationArchived => 'Medication archived';

  @override
  String get tabletsUnit => 'tab.';

  @override
  String get weeksUnit => 'wk';

  @override
  String get selectMedication => 'Select medication';

  @override
  String get addDosageEntry => 'Add dose';

  @override
  String get removeDosageEntry => 'Remove';

  @override
  String get quantity => 'Quantity';

  @override
  String get timeSlot => 'Time of day';

  @override
  String get dayOfWeek => 'Day';

  @override
  String get noDosage => 'No dosage configured';

  @override
  String purchaseHistoryFor(String med) {
    return 'Purchases for $med';
  }

  @override
  String get deleted => 'Deleted';

  @override
  String fillBoxSummary(String n, int m) {
    return '$n tablets total will be used from $m medications.';
  }

  @override
  String get weeklyConsumptionLabel => 'Weekly consumption';

  @override
  String get negativeStockWarning =>
      'Stock would go negative — please add a purchase first.';

  @override
  String get ok => 'OK';

  @override
  String get untitled => 'Untitled';

  @override
  String get copyMondayToAll => 'Copy Monday to all days';
}
