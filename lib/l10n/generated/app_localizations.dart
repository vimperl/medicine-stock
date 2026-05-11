import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_sr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppL10n
/// returned by `AppL10n.of(context)`.
///
/// Applications need to include `AppL10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppL10n.localizationsDelegates,
///   supportedLocales: AppL10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppL10n.supportedLocales
/// property.
abstract class AppL10n {
  AppL10n(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppL10n? of(BuildContext context) {
    return Localizations.of<AppL10n>(context, AppL10n);
  }

  static const LocalizationsDelegate<AppL10n> delegate = _AppL10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sr'),
    Locale.fromSubtags(languageCode: 'sr', scriptCode: 'Cyrl'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In sr, this message translates to:
  /// **'Lekovi'**
  String get appTitle;

  /// No description provided for @tabHome.
  ///
  /// In sr, this message translates to:
  /// **'Pocetna'**
  String get tabHome;

  /// No description provided for @tabHistory.
  ///
  /// In sr, this message translates to:
  /// **'Istorija'**
  String get tabHistory;

  /// No description provided for @tabSettings.
  ///
  /// In sr, this message translates to:
  /// **'Podesavanja'**
  String get tabSettings;

  /// No description provided for @addMedication.
  ///
  /// In sr, this message translates to:
  /// **'Dodaj lek'**
  String get addMedication;

  /// No description provided for @editMedication.
  ///
  /// In sr, this message translates to:
  /// **'Izmeni lek'**
  String get editMedication;

  /// No description provided for @medicationName.
  ///
  /// In sr, this message translates to:
  /// **'Naziv leka'**
  String get medicationName;

  /// No description provided for @medicationNotes.
  ///
  /// In sr, this message translates to:
  /// **'Napomena'**
  String get medicationNotes;

  /// No description provided for @packageSize.
  ///
  /// In sr, this message translates to:
  /// **'Tableta po kutiji'**
  String get packageSize;

  /// No description provided for @alertThresholdWeeks.
  ///
  /// In sr, this message translates to:
  /// **'Prag upozorenja (nedelja)'**
  String get alertThresholdWeeks;

  /// No description provided for @currentStock.
  ///
  /// In sr, this message translates to:
  /// **'Trenutna zaliha'**
  String get currentStock;

  /// No description provided for @tablets.
  ///
  /// In sr, this message translates to:
  /// **'tablete'**
  String get tablets;

  /// No description provided for @weeksRemaining.
  ///
  /// In sr, this message translates to:
  /// **'{count, plural, =0{Nema vise} =1{1 nedelja} few{{count} nedelje} other{{count} nedelja}}'**
  String weeksRemaining(num count);

  /// No description provided for @weeksUnknown.
  ///
  /// In sr, this message translates to:
  /// **'Nije zadato doziranje'**
  String get weeksUnknown;

  /// No description provided for @save.
  ///
  /// In sr, this message translates to:
  /// **'Sacuvaj'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In sr, this message translates to:
  /// **'Otkazi'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In sr, this message translates to:
  /// **'Obrisi'**
  String get delete;

  /// No description provided for @archive.
  ///
  /// In sr, this message translates to:
  /// **'Arhiviraj'**
  String get archive;

  /// No description provided for @confirm.
  ///
  /// In sr, this message translates to:
  /// **'Potvrdi'**
  String get confirm;

  /// No description provided for @addPurchase.
  ///
  /// In sr, this message translates to:
  /// **'Dodaj nabavku'**
  String get addPurchase;

  /// No description provided for @purchaseModeBoxes.
  ///
  /// In sr, this message translates to:
  /// **'Kutije'**
  String get purchaseModeBoxes;

  /// No description provided for @purchaseModeTablets.
  ///
  /// In sr, this message translates to:
  /// **'Tablete'**
  String get purchaseModeTablets;

  /// No description provided for @boxes.
  ///
  /// In sr, this message translates to:
  /// **'Broj kutija'**
  String get boxes;

  /// No description provided for @amount.
  ///
  /// In sr, this message translates to:
  /// **'Kolicina'**
  String get amount;

  /// No description provided for @date.
  ///
  /// In sr, this message translates to:
  /// **'Datum'**
  String get date;

  /// No description provided for @note.
  ///
  /// In sr, this message translates to:
  /// **'Napomena'**
  String get note;

  /// No description provided for @fillBoxButton.
  ///
  /// In sr, this message translates to:
  /// **'Napunio sam kutijicu'**
  String get fillBoxButton;

  /// No description provided for @fillBoxTitle.
  ///
  /// In sr, this message translates to:
  /// **'Punjenje kutijice za 7 dana'**
  String get fillBoxTitle;

  /// No description provided for @fillBoxConfirm.
  ///
  /// In sr, this message translates to:
  /// **'Potvrdi punjenje'**
  String get fillBoxConfirm;

  /// No description provided for @fillBoxNoMeds.
  ///
  /// In sr, this message translates to:
  /// **'Nema aktivnih lekova sa doziranjem.'**
  String get fillBoxNoMeds;

  /// No description provided for @willConsume.
  ///
  /// In sr, this message translates to:
  /// **'Bice utroseno'**
  String get willConsume;

  /// No description provided for @willGoNegative.
  ///
  /// In sr, this message translates to:
  /// **'Nedovoljna zaliha!'**
  String get willGoNegative;

  /// No description provided for @stockAfter.
  ///
  /// In sr, this message translates to:
  /// **'Stanje posle: {n} tableta'**
  String stockAfter(String n);

  /// No description provided for @weeklyConsumption.
  ///
  /// In sr, this message translates to:
  /// **'Nedeljno: {n} tableta'**
  String weeklyConsumption(String n);

  /// No description provided for @dosageSchedule.
  ///
  /// In sr, this message translates to:
  /// **'Raspored doziranja'**
  String get dosageSchedule;

  /// No description provided for @morning.
  ///
  /// In sr, this message translates to:
  /// **'Jutro'**
  String get morning;

  /// No description provided for @noon.
  ///
  /// In sr, this message translates to:
  /// **'Podne'**
  String get noon;

  /// No description provided for @evening.
  ///
  /// In sr, this message translates to:
  /// **'Vece'**
  String get evening;

  /// No description provided for @night.
  ///
  /// In sr, this message translates to:
  /// **'Noc'**
  String get night;

  /// No description provided for @monday.
  ///
  /// In sr, this message translates to:
  /// **'Ponedeljak'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In sr, this message translates to:
  /// **'Utorak'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In sr, this message translates to:
  /// **'Sreda'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In sr, this message translates to:
  /// **'Cetvrtak'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In sr, this message translates to:
  /// **'Petak'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In sr, this message translates to:
  /// **'Subota'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In sr, this message translates to:
  /// **'Nedelja'**
  String get sunday;

  /// No description provided for @history.
  ///
  /// In sr, this message translates to:
  /// **'Istorija'**
  String get history;

  /// No description provided for @historyRefills.
  ///
  /// In sr, this message translates to:
  /// **'Punjenja'**
  String get historyRefills;

  /// No description provided for @historyPurchases.
  ///
  /// In sr, this message translates to:
  /// **'Nabavke'**
  String get historyPurchases;

  /// No description provided for @noHistory.
  ///
  /// In sr, this message translates to:
  /// **'Nema unosa.'**
  String get noHistory;

  /// No description provided for @noMedications.
  ///
  /// In sr, this message translates to:
  /// **'Nema lekova. Dodaj prvi lek.'**
  String get noMedications;

  /// No description provided for @settings.
  ///
  /// In sr, this message translates to:
  /// **'Podesavanja'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In sr, this message translates to:
  /// **'Jezik'**
  String get language;

  /// No description provided for @languageSrLatn.
  ///
  /// In sr, this message translates to:
  /// **'Srpski (latinica)'**
  String get languageSrLatn;

  /// No description provided for @languageSrCyrl.
  ///
  /// In sr, this message translates to:
  /// **'Srpski (cirilica)'**
  String get languageSrCyrl;

  /// No description provided for @languageEn.
  ///
  /// In sr, this message translates to:
  /// **'Engleski'**
  String get languageEn;

  /// No description provided for @googleDrive.
  ///
  /// In sr, this message translates to:
  /// **'Google Drive backup'**
  String get googleDrive;

  /// No description provided for @connectGoogle.
  ///
  /// In sr, this message translates to:
  /// **'Poveži nalog'**
  String get connectGoogle;

  /// No description provided for @disconnectGoogle.
  ///
  /// In sr, this message translates to:
  /// **'Diskonektuj'**
  String get disconnectGoogle;

  /// No description provided for @backupNow.
  ///
  /// In sr, this message translates to:
  /// **'Backup sada'**
  String get backupNow;

  /// No description provided for @lastBackup.
  ///
  /// In sr, this message translates to:
  /// **'Poslednji backup: {when}'**
  String lastBackup(String when);

  /// No description provided for @neverBackedUp.
  ///
  /// In sr, this message translates to:
  /// **'Nikad'**
  String get neverBackedUp;

  /// No description provided for @exportJson.
  ///
  /// In sr, this message translates to:
  /// **'Izvezi JSON'**
  String get exportJson;

  /// No description provided for @importJson.
  ///
  /// In sr, this message translates to:
  /// **'Uvezi JSON'**
  String get importJson;

  /// No description provided for @importWarning.
  ///
  /// In sr, this message translates to:
  /// **'Uvoz ce zameniti sve postojece podatke. Nastaviti?'**
  String get importWarning;

  /// No description provided for @about.
  ///
  /// In sr, this message translates to:
  /// **'O aplikaciji'**
  String get about;

  /// No description provided for @aboutText.
  ///
  /// In sr, this message translates to:
  /// **'Aplikacija za pracenje zaliha lekova.'**
  String get aboutText;

  /// No description provided for @lowStockNotificationTitle.
  ///
  /// In sr, this message translates to:
  /// **'Niska zaliha leka'**
  String get lowStockNotificationTitle;

  /// No description provided for @lowStockNotificationBody.
  ///
  /// In sr, this message translates to:
  /// **'{med}: jos {weeks} nedelja'**
  String lowStockNotificationBody(String med, int weeks);

  /// No description provided for @outOfStock.
  ///
  /// In sr, this message translates to:
  /// **'Bez zalihe'**
  String get outOfStock;

  /// No description provided for @purchaseSaved.
  ///
  /// In sr, this message translates to:
  /// **'Nabavka zabelezena'**
  String get purchaseSaved;

  /// No description provided for @refillSaved.
  ///
  /// In sr, this message translates to:
  /// **'Punjenje zabelezeno'**
  String get refillSaved;

  /// No description provided for @medicationSaved.
  ///
  /// In sr, this message translates to:
  /// **'Lek sacuvan'**
  String get medicationSaved;

  /// No description provided for @medicationArchived.
  ///
  /// In sr, this message translates to:
  /// **'Lek arhiviran'**
  String get medicationArchived;

  /// No description provided for @tabletsUnit.
  ///
  /// In sr, this message translates to:
  /// **'tab.'**
  String get tabletsUnit;

  /// No description provided for @weeksUnit.
  ///
  /// In sr, this message translates to:
  /// **'ned.'**
  String get weeksUnit;

  /// No description provided for @selectMedication.
  ///
  /// In sr, this message translates to:
  /// **'Izaberi lek'**
  String get selectMedication;

  /// No description provided for @addDosageEntry.
  ///
  /// In sr, this message translates to:
  /// **'Dodaj doziranje'**
  String get addDosageEntry;

  /// No description provided for @removeDosageEntry.
  ///
  /// In sr, this message translates to:
  /// **'Ukloni'**
  String get removeDosageEntry;

  /// No description provided for @quantity.
  ///
  /// In sr, this message translates to:
  /// **'Kolicina'**
  String get quantity;

  /// No description provided for @timeSlot.
  ///
  /// In sr, this message translates to:
  /// **'Doba dana'**
  String get timeSlot;

  /// No description provided for @dayOfWeek.
  ///
  /// In sr, this message translates to:
  /// **'Dan'**
  String get dayOfWeek;

  /// No description provided for @noDosage.
  ///
  /// In sr, this message translates to:
  /// **'Nije zadato doziranje'**
  String get noDosage;

  /// No description provided for @purchaseHistoryFor.
  ///
  /// In sr, this message translates to:
  /// **'Nabavke za {med}'**
  String purchaseHistoryFor(String med);

  /// No description provided for @deleted.
  ///
  /// In sr, this message translates to:
  /// **'Obrisano'**
  String get deleted;

  /// No description provided for @fillBoxSummary.
  ///
  /// In sr, this message translates to:
  /// **'Ukupno ce biti utroseno {n} tableta iz {m} lekova.'**
  String fillBoxSummary(String n, int m);

  /// No description provided for @weeklyConsumptionLabel.
  ///
  /// In sr, this message translates to:
  /// **'Nedeljna potrosnja'**
  String get weeklyConsumptionLabel;

  /// No description provided for @negativeStockWarning.
  ///
  /// In sr, this message translates to:
  /// **'Bice u minusu — molimo prvo dopuni zalihu.'**
  String get negativeStockWarning;

  /// No description provided for @ok.
  ///
  /// In sr, this message translates to:
  /// **'U redu'**
  String get ok;

  /// No description provided for @untitled.
  ///
  /// In sr, this message translates to:
  /// **'Bez naziva'**
  String get untitled;

  /// No description provided for @copyMondayToAll.
  ///
  /// In sr, this message translates to:
  /// **'Kopiraj ponedeljak na ostale dane'**
  String get copyMondayToAll;
}

class _AppL10nDelegate extends LocalizationsDelegate<AppL10n> {
  const _AppL10nDelegate();

  @override
  Future<AppL10n> load(Locale locale) {
    return SynchronousFuture<AppL10n>(lookupAppL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'sr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppL10nDelegate old) => false;
}

AppL10n lookupAppL10n(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'sr':
      {
        switch (locale.scriptCode) {
          case 'Cyrl':
            return AppL10nSrCyrl();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppL10nEn();
    case 'sr':
      return AppL10nSr();
  }

  throw FlutterError(
    'AppL10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
