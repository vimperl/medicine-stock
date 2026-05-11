# Medicine Stock

Flutter aplikacija za praćenje zaliha lekova kod kuće. Vodi evidenciju o lekovima, raspodeli doza po danima i delovima dana, kupovinama, punjenju nedeljne kutijice i šalje upozorenje kad zalihe padnu ispod praga.

## Funkcionalnosti

- **Lista lekova** sa trenutnim brojem tableta, nedeljnom potrošnjom i procenom preostalih nedelja.
- **Raspored doza** po danu u nedelji i delu dana (jutro, podne, veče, noć), sa opcijom „kopiraj ponedeljak na sve dane".
- **Kupovine** — unos u kutijama ili tabletama, sa beleškom i datumom; uvećavaju zalihu.
- **Punjenje 7-dnevne kutijice** — jednim potezom oduzima nedeljnu dozu za sve aktivne lekove i upisuje stavku u istoriju; upozorava ako bi zaliha išla u minus.
- **Istorija** punjenja i kupovina po leku.
- **Lokalna notifikacija** kad procenjene zalihe padnu ispod konfigurisanog praga (u nedeljama, po leku).
- **Lokalizacija**: srpski (latinica), srpski (ćirilica), engleski.
- **Backup**:
  - Export / import JSON-a (preko sistemskog deljenja / izbornika fajla).
  - Backup na Google Drive (App Data folder) preko Google naloga.

## Tehnologija

- **Flutter** (Dart SDK 3.11+)
- **Riverpod** za state management
- **go_router** sa `StatefulShellRoute` za navigaciju (tabovi: Home / Istorija / Podešavanja)
- **drift** (SQLite) sa kod-generatorom za bazu i DAO-ove
- **flutter_local_notifications** + `timezone` za upozorenja
- **google_sign_in** + `googleapis` (Drive) za cloud backup
- **share_plus**, **file_picker** za eksport/uvoz JSON-a

## Struktura projekta

```
lib/
  app.dart                 # MaterialApp + GoRouter + RootShell sa tabovima
  main.dart                # bootstrap, init notifikacija
  providers.dart           # Riverpod provideri
  data/
    database.dart          # drift baza
    tables.dart            # Medications, DosageEntries, Purchases, Refills, RefillItems, AppSettings
    daos/                  # medication/purchase/refill/settings DAO
  domain/
    dosage_calculator.dart # nedeljna potrošnja, procena nedelja preostalih
    refill_service.dart    # logika punjenja kutijice
    medication_view.dart
    time_slot.dart
  features/
    home/                  # lista lekova
    medication_form/       # dodavanje/izmena leka + raspored doza
    purchase/              # unos kupovine
    refill/                # dijalog za punjenje kutijice
    history/               # istorija
    settings/              # jezik, backup, about
  services/
    backup_service.dart    # JSON export/import + Google Drive
    notification_service.dart
  l10n/                    # ARB fajlovi + generisane klase
  widgets/
test/
  dosage_calculator_test.dart
```

## Instalacija

### Preduslovi

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (kanal koji podržava Dart `^3.11.0-57.0.dev` — testirano na beta/master).
- Android SDK (Android Studio command-line tools je dovoljan).
- Za Google Drive backup: Google Cloud projekat sa konfigurisanim OAuth klijentom (Android, SHA-1 fingerprint debug ključa).

Provera Flutter okruženja:

```bash
flutter doctor
```

### Kloniranje i instalacija zavisnosti

```bash
git clone https://github.com/vimperl/medicine-stock.git
cd medicine-stock
flutter pub get
```

### Generisanje koda

Drift, Freezed i json_serializable koriste `build_runner`. Generisani fajlovi su commitovani, ali ako menjaš tabele/modele:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Za rad u režimu sa watch-om:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### Lokalizacija

ARB fajlovi su u `lib/l10n/`. Generisanje:

```bash
flutter gen-l10n
```

(konfiguracija je u `l10n.yaml`)

## Pokretanje

Debug build na priključenom uređaju / emulatoru:

```bash
flutter run
```

Release APK:

```bash
flutter build apk --release
```

Build se nalazi u `build/app/outputs/flutter-apk/app-release.apk`.

App bundle za Play Store:

```bash
flutter build appbundle --release
```

## Google Drive backup — postavka

Da bi backup na Drive radio:

1. U Google Cloud Console-u napravi projekat i omogući **Google Drive API**.
2. Konfiguriši OAuth consent screen (External, test korisnici dok aplikacija nije verifikovana).
3. Napravi OAuth Client ID tipa **Android**:
   - package name: `com.vladan.medicine_stock` (videti `android/app/build.gradle.kts`)
   - SHA-1 debug ključa: `cd android && ./gradlew signingReport`
4. Za release build dodaj SHA-1 release ključa istom klijentu.
5. Aplikacija koristi `drive.appdata` scope — fajlovi se čuvaju u privatnom App Data folderu naloga (nisu vidljivi korisniku u Drive UI-u).

## Testovi

```bash
flutter test
```

Trenutno postoji `test/dosage_calculator_test.dart` koji pokriva proračun nedeljne potrošnje.

## Baza i migracije

Šema je definisana u `lib/data/tables.dart`. Drift čuva verziju šeme; pri promenama dodaj migraciju u `database.dart` (`MigrationStrategy`). Lokalna baza se čuva u app document direktorijumu (vidi `drift_flutter`).

## Licenca

Privatan projekat — nema definisanu licencu. Sva prava zadržana.
