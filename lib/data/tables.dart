import 'package:drift/drift.dart';

class Medications extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get notes => text().nullable()();
  IntColumn get packageSize => integer().withDefault(const Constant(30))();
  IntColumn get alertThresholdWeeks =>
      integer().withDefault(const Constant(2))();
  RealColumn get currentStockTablets =>
      real().withDefault(const Constant(0))();
  TextColumn get category =>
      text().withDefault(const Constant('purchase'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get archivedAt => dateTime().nullable()();
}

class DosageEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get medicationId =>
      integer().references(Medications, #id, onDelete: KeyAction.cascade)();
  IntColumn get dayOfWeek => integer()();
  TextColumn get timeSlot => text()();
  RealColumn get quantity => real()();
}

class Purchases extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get medicationId =>
      integer().references(Medications, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get date => dateTime()();
  TextColumn get mode => text()();
  IntColumn get boxes => integer().nullable()();
  IntColumn get tablets => integer()();
  TextColumn get note => text().nullable()();
}

class Refills extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  RealColumn get totalTabletsConsumed => real()();
}

class RefillItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get refillId =>
      integer().references(Refills, #id, onDelete: KeyAction.cascade)();
  IntColumn get medicationId =>
      integer().references(Medications, #id, onDelete: KeyAction.cascade)();
  TextColumn get medicationName => text()();
  RealColumn get tabletsConsumed => real()();
}

class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}
