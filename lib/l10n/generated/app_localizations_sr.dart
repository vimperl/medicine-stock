// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppL10nSr extends AppL10n {
  AppL10nSr([String locale = 'sr']) : super(locale);

  @override
  String get appTitle => 'Lekovi';

  @override
  String get tabHome => 'Pocetna';

  @override
  String get tabHistory => 'Istorija';

  @override
  String get tabSettings => 'Podesavanja';

  @override
  String get addMedication => 'Dodaj lek';

  @override
  String get editMedication => 'Izmeni lek';

  @override
  String get medicationName => 'Naziv leka';

  @override
  String get medicationNotes => 'Napomena';

  @override
  String get packageSize => 'Tableta po kutiji';

  @override
  String get alertThresholdWeeks => 'Prag upozorenja (nedelja)';

  @override
  String get currentStock => 'Trenutna zaliha';

  @override
  String get tablets => 'tablete';

  @override
  String weeksRemaining(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nedelja',
      few: '$count nedelje',
      one: '1 nedelja',
      zero: 'Nema vise',
    );
    return '$_temp0';
  }

  @override
  String get weeksUnknown => 'Nije zadato doziranje';

  @override
  String get save => 'Sacuvaj';

  @override
  String get cancel => 'Otkazi';

  @override
  String get delete => 'Obrisi';

  @override
  String get archive => 'Arhiviraj';

  @override
  String get confirm => 'Potvrdi';

  @override
  String get addPurchase => 'Dodaj nabavku';

  @override
  String get purchaseModeBoxes => 'Kutije';

  @override
  String get purchaseModeTablets => 'Tablete';

  @override
  String get boxes => 'Broj kutija';

  @override
  String get amount => 'Kolicina';

  @override
  String get date => 'Datum';

  @override
  String get note => 'Napomena';

  @override
  String get fillBoxButton => 'Napunio sam kutijicu';

  @override
  String get fillBoxTitle => 'Punjenje kutijice za 7 dana';

  @override
  String get fillBoxConfirm => 'Potvrdi punjenje';

  @override
  String get fillBoxNoMeds => 'Nema aktivnih lekova sa doziranjem.';

  @override
  String get willConsume => 'Bice utroseno';

  @override
  String get willGoNegative => 'Nedovoljna zaliha!';

  @override
  String stockAfter(String n) {
    return 'Stanje posle: $n tableta';
  }

  @override
  String weeklyConsumption(String n) {
    return 'Nedeljno: $n tableta';
  }

  @override
  String get dosageSchedule => 'Raspored doziranja';

  @override
  String get morning => 'Jutro';

  @override
  String get noon => 'Podne';

  @override
  String get evening => 'Vece';

  @override
  String get night => 'Noc';

  @override
  String get monday => 'Ponedeljak';

  @override
  String get tuesday => 'Utorak';

  @override
  String get wednesday => 'Sreda';

  @override
  String get thursday => 'Cetvrtak';

  @override
  String get friday => 'Petak';

  @override
  String get saturday => 'Subota';

  @override
  String get sunday => 'Nedelja';

  @override
  String get history => 'Istorija';

  @override
  String get historyRefills => 'Punjenja';

  @override
  String get historyPurchases => 'Nabavke';

  @override
  String get noHistory => 'Nema unosa.';

  @override
  String get noMedications => 'Nema lekova. Dodaj prvi lek.';

  @override
  String get settings => 'Podesavanja';

  @override
  String get language => 'Jezik';

  @override
  String get languageSrLatn => 'Srpski (latinica)';

  @override
  String get languageSrCyrl => 'Srpski (cirilica)';

  @override
  String get languageEn => 'Engleski';

  @override
  String get googleDrive => 'Google Drive backup';

  @override
  String get connectGoogle => 'Poveži nalog';

  @override
  String get disconnectGoogle => 'Diskonektuj';

  @override
  String get backupNow => 'Backup sada';

  @override
  String lastBackup(String when) {
    return 'Poslednji backup: $when';
  }

  @override
  String get neverBackedUp => 'Nikad';

  @override
  String get exportJson => 'Izvezi JSON';

  @override
  String get importJson => 'Uvezi JSON';

  @override
  String get importWarning =>
      'Uvoz ce zameniti sve postojece podatke. Nastaviti?';

  @override
  String get about => 'O aplikaciji';

  @override
  String get aboutText => 'Aplikacija za pracenje zaliha lekova.';

  @override
  String get lowStockNotificationTitle => 'Niska zaliha leka';

  @override
  String lowStockNotificationBody(String med, int weeks) {
    return '$med: jos $weeks nedelja';
  }

  @override
  String get outOfStock => 'Bez zalihe';

  @override
  String get purchaseSaved => 'Nabavka zabelezena';

  @override
  String get refillSaved => 'Punjenje zabelezeno';

  @override
  String get medicationSaved => 'Lek sacuvan';

  @override
  String get medicationArchived => 'Lek arhiviran';

  @override
  String get tabletsUnit => 'tab.';

  @override
  String get weeksUnit => 'ned.';

  @override
  String get selectMedication => 'Izaberi lek';

  @override
  String get addDosageEntry => 'Dodaj doziranje';

  @override
  String get removeDosageEntry => 'Ukloni';

  @override
  String get quantity => 'Kolicina';

  @override
  String get timeSlot => 'Doba dana';

  @override
  String get dayOfWeek => 'Dan';

  @override
  String get noDosage => 'Nije zadato doziranje';

  @override
  String purchaseHistoryFor(String med) {
    return 'Nabavke za $med';
  }

  @override
  String get deleted => 'Obrisano';

  @override
  String fillBoxSummary(String n, int m) {
    return 'Ukupno ce biti utroseno $n tableta iz $m lekova.';
  }

  @override
  String get weeklyConsumptionLabel => 'Nedeljna potrosnja';

  @override
  String get negativeStockWarning =>
      'Bice u minusu — molimo prvo dopuni zalihu.';

  @override
  String get ok => 'U redu';

  @override
  String get untitled => 'Bez naziva';

  @override
  String get copyMondayToAll => 'Kopiraj ponedeljak na ostale dane';

  @override
  String get category => 'Kategorija';

  @override
  String get categoryPrescription => 'Na recept';

  @override
  String get categoryPurchase => 'Kupovina';

  @override
  String get categorySupplement => 'Suplementi';

  @override
  String get weeksOfSupply => 'Imas lekove za';

  @override
  String supplyUntil(String date) {
    return 'do ~ $date';
  }

  @override
  String get noActiveDosage => 'Nema aktivnog doziranja';

  @override
  String summaryActive(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktivnih',
      few: '$count aktivna',
      one: '1 aktivan',
    );
    return '$_temp0';
  }

  @override
  String summaryLow(int count) {
    return '$count uskoro nestaje';
  }

  @override
  String summaryOut(int count) {
    return '$count bez zalihe';
  }

  @override
  String lastRefillAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Kutijica napunjena pre $days dana',
      few: 'Kutijica napunjena pre $days dana',
      one: 'Kutijica napunjena juce',
      zero: 'Kutijica napunjena danas',
    );
    return '$_temp0';
  }

  @override
  String get neverRefilled => 'Kutijica jos nije punjena';

  @override
  String get upcomingNeeds => 'Uskoro treba dokupiti';

  @override
  String get allStocked => 'Sve zalihe su u redu';

  @override
  String get allMedications => 'Svi lekovi';
}

/// The translations for Serbian, using the Cyrillic script (`sr_Cyrl`).
class AppL10nSrCyrl extends AppL10nSr {
  AppL10nSrCyrl() : super('sr_Cyrl');

  @override
  String get appTitle => 'Лекови';

  @override
  String get tabHome => 'Почетна';

  @override
  String get tabHistory => 'Историја';

  @override
  String get tabSettings => 'Подешавања';

  @override
  String get addMedication => 'Додај лек';

  @override
  String get editMedication => 'Измени лек';

  @override
  String get medicationName => 'Назив лека';

  @override
  String get medicationNotes => 'Напомена';

  @override
  String get packageSize => 'Таблета по кутији';

  @override
  String get alertThresholdWeeks => 'Праг упозорења (недеља)';

  @override
  String get currentStock => 'Тренутна залиха';

  @override
  String get tablets => 'таблете';

  @override
  String weeksRemaining(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count недеља',
      few: '$count недеље',
      one: '1 недеља',
      zero: 'Нема више',
    );
    return '$_temp0';
  }

  @override
  String get weeksUnknown => 'Није задато дозирање';

  @override
  String get save => 'Сачувај';

  @override
  String get cancel => 'Откажи';

  @override
  String get delete => 'Обриши';

  @override
  String get archive => 'Архивирај';

  @override
  String get confirm => 'Потврди';

  @override
  String get addPurchase => 'Додај набавку';

  @override
  String get purchaseModeBoxes => 'Кутије';

  @override
  String get purchaseModeTablets => 'Таблете';

  @override
  String get boxes => 'Број кутија';

  @override
  String get amount => 'Количина';

  @override
  String get date => 'Датум';

  @override
  String get note => 'Напомена';

  @override
  String get fillBoxButton => 'Напунио сам кутијицу';

  @override
  String get fillBoxTitle => 'Пуњење кутијице за 7 дана';

  @override
  String get fillBoxConfirm => 'Потврди пуњење';

  @override
  String get fillBoxNoMeds => 'Нема активних лекова са дозирањем.';

  @override
  String get willConsume => 'Биће утрошено';

  @override
  String get willGoNegative => 'Недовољна залиха!';

  @override
  String stockAfter(String n) {
    return 'Стање после: $n таблета';
  }

  @override
  String weeklyConsumption(String n) {
    return 'Недељно: $n таблета';
  }

  @override
  String get dosageSchedule => 'Распоред дозирања';

  @override
  String get morning => 'Јутро';

  @override
  String get noon => 'Подне';

  @override
  String get evening => 'Вече';

  @override
  String get night => 'Ноћ';

  @override
  String get monday => 'Понедељак';

  @override
  String get tuesday => 'Уторак';

  @override
  String get wednesday => 'Среда';

  @override
  String get thursday => 'Четвртак';

  @override
  String get friday => 'Петак';

  @override
  String get saturday => 'Субота';

  @override
  String get sunday => 'Недеља';

  @override
  String get history => 'Историја';

  @override
  String get historyRefills => 'Пуњења';

  @override
  String get historyPurchases => 'Набавке';

  @override
  String get noHistory => 'Нема уноса.';

  @override
  String get noMedications => 'Нема лекова. Додај први лек.';

  @override
  String get settings => 'Подешавања';

  @override
  String get language => 'Језик';

  @override
  String get languageSrLatn => 'Српски (латиница)';

  @override
  String get languageSrCyrl => 'Српски (ћирилица)';

  @override
  String get languageEn => 'Енглески';

  @override
  String get googleDrive => 'Google Drive бекап';

  @override
  String get connectGoogle => 'Повежи налог';

  @override
  String get disconnectGoogle => 'Дисконектуј';

  @override
  String get backupNow => 'Бекап сада';

  @override
  String lastBackup(String when) {
    return 'Последњи бекап: $when';
  }

  @override
  String get neverBackedUp => 'Никад';

  @override
  String get exportJson => 'Извези JSON';

  @override
  String get importJson => 'Увези JSON';

  @override
  String get importWarning =>
      'Увоз ће заменити све постојеће податке. Наставити?';

  @override
  String get about => 'О апликацији';

  @override
  String get aboutText => 'Апликација за праћење залиха лекова.';

  @override
  String get lowStockNotificationTitle => 'Ниска залиха лека';

  @override
  String lowStockNotificationBody(String med, int weeks) {
    return '$med: још $weeks недеља';
  }

  @override
  String get outOfStock => 'Без залихе';

  @override
  String get purchaseSaved => 'Набавка забележена';

  @override
  String get refillSaved => 'Пуњење забележено';

  @override
  String get medicationSaved => 'Лек сачуван';

  @override
  String get medicationArchived => 'Лек архивиран';

  @override
  String get tabletsUnit => 'таб.';

  @override
  String get weeksUnit => 'нед.';

  @override
  String get selectMedication => 'Изабери лек';

  @override
  String get addDosageEntry => 'Додај дозирање';

  @override
  String get removeDosageEntry => 'Уклони';

  @override
  String get quantity => 'Количина';

  @override
  String get timeSlot => 'Доба дана';

  @override
  String get dayOfWeek => 'Дан';

  @override
  String get noDosage => 'Није задато дозирање';

  @override
  String purchaseHistoryFor(String med) {
    return 'Набавке за $med';
  }

  @override
  String get deleted => 'Обрисано';

  @override
  String fillBoxSummary(String n, int m) {
    return 'Укупно ће бити утрошено $n таблета из $m лекова.';
  }

  @override
  String get weeklyConsumptionLabel => 'Недељна потрошња';

  @override
  String get negativeStockWarning =>
      'Биће у минусу — молимо прво допуните залиху.';

  @override
  String get ok => 'У реду';

  @override
  String get untitled => 'Без назива';

  @override
  String get copyMondayToAll => 'Копирај понедељак на остале дане';

  @override
  String get category => 'Категорија';

  @override
  String get categoryPrescription => 'На рецепт';

  @override
  String get categoryPurchase => 'Куповина';

  @override
  String get categorySupplement => 'Суплементи';

  @override
  String get weeksOfSupply => 'Имаш лекове за';

  @override
  String supplyUntil(String date) {
    return 'до ~ $date';
  }

  @override
  String get noActiveDosage => 'Нема активног дозирања';

  @override
  String summaryActive(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count активних',
      few: '$count активна',
      one: '1 активан',
    );
    return '$_temp0';
  }

  @override
  String summaryLow(int count) {
    return '$count ускоро нестаје';
  }

  @override
  String summaryOut(int count) {
    return '$count без залихе';
  }

  @override
  String lastRefillAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Кутијица напуњена пре $days дана',
      few: 'Кутијица напуњена пре $days дана',
      one: 'Кутијица напуњена јуче',
      zero: 'Кутијица напуњена данас',
    );
    return '$_temp0';
  }

  @override
  String get neverRefilled => 'Кутијица још није пуњена';

  @override
  String get upcomingNeeds => 'Ускоро треба докупити';

  @override
  String get allStocked => 'Све залихе су у реду';

  @override
  String get allMedications => 'Сви лекови';
}
