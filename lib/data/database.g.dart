// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _packageSizeMeta = const VerificationMeta(
    'packageSize',
  );
  @override
  late final GeneratedColumn<int> packageSize = GeneratedColumn<int>(
    'package_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(30),
  );
  static const VerificationMeta _alertThresholdWeeksMeta =
      const VerificationMeta('alertThresholdWeeks');
  @override
  late final GeneratedColumn<int> alertThresholdWeeks = GeneratedColumn<int>(
    'alert_threshold_weeks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2),
  );
  static const VerificationMeta _currentStockTabletsMeta =
      const VerificationMeta('currentStockTablets');
  @override
  late final GeneratedColumn<double> currentStockTablets =
      GeneratedColumn<double>(
        'current_stock_tablets',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    notes,
    packageSize,
    alertThresholdWeeks,
    currentStockTablets,
    createdAt,
    archivedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medication> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('package_size')) {
      context.handle(
        _packageSizeMeta,
        packageSize.isAcceptableOrUnknown(
          data['package_size']!,
          _packageSizeMeta,
        ),
      );
    }
    if (data.containsKey('alert_threshold_weeks')) {
      context.handle(
        _alertThresholdWeeksMeta,
        alertThresholdWeeks.isAcceptableOrUnknown(
          data['alert_threshold_weeks']!,
          _alertThresholdWeeksMeta,
        ),
      );
    }
    if (data.containsKey('current_stock_tablets')) {
      context.handle(
        _currentStockTabletsMeta,
        currentStockTablets.isAcceptableOrUnknown(
          data['current_stock_tablets']!,
          _currentStockTabletsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      packageSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}package_size'],
      )!,
      alertThresholdWeeks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}alert_threshold_weeks'],
      )!,
      currentStockTablets: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_stock_tablets'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }
}

class Medication extends DataClass implements Insertable<Medication> {
  final int id;
  final String name;
  final String? notes;
  final int packageSize;
  final int alertThresholdWeeks;
  final double currentStockTablets;
  final DateTime createdAt;
  final DateTime? archivedAt;
  const Medication({
    required this.id,
    required this.name,
    this.notes,
    required this.packageSize,
    required this.alertThresholdWeeks,
    required this.currentStockTablets,
    required this.createdAt,
    this.archivedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['package_size'] = Variable<int>(packageSize);
    map['alert_threshold_weeks'] = Variable<int>(alertThresholdWeeks);
    map['current_stock_tablets'] = Variable<double>(currentStockTablets);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<DateTime>(archivedAt);
    }
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      name: Value(name),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      packageSize: Value(packageSize),
      alertThresholdWeeks: Value(alertThresholdWeeks),
      currentStockTablets: Value(currentStockTablets),
      createdAt: Value(createdAt),
      archivedAt: archivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAt),
    );
  }

  factory Medication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      notes: serializer.fromJson<String?>(json['notes']),
      packageSize: serializer.fromJson<int>(json['packageSize']),
      alertThresholdWeeks: serializer.fromJson<int>(
        json['alertThresholdWeeks'],
      ),
      currentStockTablets: serializer.fromJson<double>(
        json['currentStockTablets'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      archivedAt: serializer.fromJson<DateTime?>(json['archivedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'notes': serializer.toJson<String?>(notes),
      'packageSize': serializer.toJson<int>(packageSize),
      'alertThresholdWeeks': serializer.toJson<int>(alertThresholdWeeks),
      'currentStockTablets': serializer.toJson<double>(currentStockTablets),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'archivedAt': serializer.toJson<DateTime?>(archivedAt),
    };
  }

  Medication copyWith({
    int? id,
    String? name,
    Value<String?> notes = const Value.absent(),
    int? packageSize,
    int? alertThresholdWeeks,
    double? currentStockTablets,
    DateTime? createdAt,
    Value<DateTime?> archivedAt = const Value.absent(),
  }) => Medication(
    id: id ?? this.id,
    name: name ?? this.name,
    notes: notes.present ? notes.value : this.notes,
    packageSize: packageSize ?? this.packageSize,
    alertThresholdWeeks: alertThresholdWeeks ?? this.alertThresholdWeeks,
    currentStockTablets: currentStockTablets ?? this.currentStockTablets,
    createdAt: createdAt ?? this.createdAt,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
  );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      notes: data.notes.present ? data.notes.value : this.notes,
      packageSize: data.packageSize.present
          ? data.packageSize.value
          : this.packageSize,
      alertThresholdWeeks: data.alertThresholdWeeks.present
          ? data.alertThresholdWeeks.value
          : this.alertThresholdWeeks,
      currentStockTablets: data.currentStockTablets.present
          ? data.currentStockTablets.value
          : this.currentStockTablets,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      archivedAt: data.archivedAt.present
          ? data.archivedAt.value
          : this.archivedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('packageSize: $packageSize, ')
          ..write('alertThresholdWeeks: $alertThresholdWeeks, ')
          ..write('currentStockTablets: $currentStockTablets, ')
          ..write('createdAt: $createdAt, ')
          ..write('archivedAt: $archivedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    notes,
    packageSize,
    alertThresholdWeeks,
    currentStockTablets,
    createdAt,
    archivedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.name == this.name &&
          other.notes == this.notes &&
          other.packageSize == this.packageSize &&
          other.alertThresholdWeeks == this.alertThresholdWeeks &&
          other.currentStockTablets == this.currentStockTablets &&
          other.createdAt == this.createdAt &&
          other.archivedAt == this.archivedAt);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> notes;
  final Value<int> packageSize;
  final Value<int> alertThresholdWeeks;
  final Value<double> currentStockTablets;
  final Value<DateTime> createdAt;
  final Value<DateTime?> archivedAt;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.notes = const Value.absent(),
    this.packageSize = const Value.absent(),
    this.alertThresholdWeeks = const Value.absent(),
    this.currentStockTablets = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
  });
  MedicationsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.notes = const Value.absent(),
    this.packageSize = const Value.absent(),
    this.alertThresholdWeeks = const Value.absent(),
    this.currentStockTablets = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Medication> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? notes,
    Expression<int>? packageSize,
    Expression<int>? alertThresholdWeeks,
    Expression<double>? currentStockTablets,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? archivedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (notes != null) 'notes': notes,
      if (packageSize != null) 'package_size': packageSize,
      if (alertThresholdWeeks != null)
        'alert_threshold_weeks': alertThresholdWeeks,
      if (currentStockTablets != null)
        'current_stock_tablets': currentStockTablets,
      if (createdAt != null) 'created_at': createdAt,
      if (archivedAt != null) 'archived_at': archivedAt,
    });
  }

  MedicationsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? notes,
    Value<int>? packageSize,
    Value<int>? alertThresholdWeeks,
    Value<double>? currentStockTablets,
    Value<DateTime>? createdAt,
    Value<DateTime?>? archivedAt,
  }) {
    return MedicationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      packageSize: packageSize ?? this.packageSize,
      alertThresholdWeeks: alertThresholdWeeks ?? this.alertThresholdWeeks,
      currentStockTablets: currentStockTablets ?? this.currentStockTablets,
      createdAt: createdAt ?? this.createdAt,
      archivedAt: archivedAt ?? this.archivedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (packageSize.present) {
      map['package_size'] = Variable<int>(packageSize.value);
    }
    if (alertThresholdWeeks.present) {
      map['alert_threshold_weeks'] = Variable<int>(alertThresholdWeeks.value);
    }
    if (currentStockTablets.present) {
      map['current_stock_tablets'] = Variable<double>(
        currentStockTablets.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('packageSize: $packageSize, ')
          ..write('alertThresholdWeeks: $alertThresholdWeeks, ')
          ..write('currentStockTablets: $currentStockTablets, ')
          ..write('createdAt: $createdAt, ')
          ..write('archivedAt: $archivedAt')
          ..write(')'))
        .toString();
  }
}

class $DosageEntriesTable extends DosageEntries
    with TableInfo<$DosageEntriesTable, DosageEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DosageEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  @override
  late final GeneratedColumn<int> medicationId = GeneratedColumn<int>(
    'medication_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medications (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
    'day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeSlotMeta = const VerificationMeta(
    'timeSlot',
  );
  @override
  late final GeneratedColumn<String> timeSlot = GeneratedColumn<String>(
    'time_slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    medicationId,
    dayOfWeek,
    timeSlot,
    quantity,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dosage_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DosageEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('time_slot')) {
      context.handle(
        _timeSlotMeta,
        timeSlot.isAcceptableOrUnknown(data['time_slot']!, _timeSlotMeta),
      );
    } else if (isInserting) {
      context.missing(_timeSlotMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DosageEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DosageEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medication_id'],
      )!,
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_of_week'],
      )!,
      timeSlot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}time_slot'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
    );
  }

  @override
  $DosageEntriesTable createAlias(String alias) {
    return $DosageEntriesTable(attachedDatabase, alias);
  }
}

class DosageEntry extends DataClass implements Insertable<DosageEntry> {
  final int id;
  final int medicationId;
  final int dayOfWeek;
  final String timeSlot;
  final double quantity;
  const DosageEntry({
    required this.id,
    required this.medicationId,
    required this.dayOfWeek,
    required this.timeSlot,
    required this.quantity,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['medication_id'] = Variable<int>(medicationId);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    map['time_slot'] = Variable<String>(timeSlot);
    map['quantity'] = Variable<double>(quantity);
    return map;
  }

  DosageEntriesCompanion toCompanion(bool nullToAbsent) {
    return DosageEntriesCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      dayOfWeek: Value(dayOfWeek),
      timeSlot: Value(timeSlot),
      quantity: Value(quantity),
    );
  }

  factory DosageEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DosageEntry(
      id: serializer.fromJson<int>(json['id']),
      medicationId: serializer.fromJson<int>(json['medicationId']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
      timeSlot: serializer.fromJson<String>(json['timeSlot']),
      quantity: serializer.fromJson<double>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicationId': serializer.toJson<int>(medicationId),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
      'timeSlot': serializer.toJson<String>(timeSlot),
      'quantity': serializer.toJson<double>(quantity),
    };
  }

  DosageEntry copyWith({
    int? id,
    int? medicationId,
    int? dayOfWeek,
    String? timeSlot,
    double? quantity,
  }) => DosageEntry(
    id: id ?? this.id,
    medicationId: medicationId ?? this.medicationId,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    timeSlot: timeSlot ?? this.timeSlot,
    quantity: quantity ?? this.quantity,
  );
  DosageEntry copyWithCompanion(DosageEntriesCompanion data) {
    return DosageEntry(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      timeSlot: data.timeSlot.present ? data.timeSlot.value : this.timeSlot,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DosageEntry(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('timeSlot: $timeSlot, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, medicationId, dayOfWeek, timeSlot, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DosageEntry &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.dayOfWeek == this.dayOfWeek &&
          other.timeSlot == this.timeSlot &&
          other.quantity == this.quantity);
}

class DosageEntriesCompanion extends UpdateCompanion<DosageEntry> {
  final Value<int> id;
  final Value<int> medicationId;
  final Value<int> dayOfWeek;
  final Value<String> timeSlot;
  final Value<double> quantity;
  const DosageEntriesCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.timeSlot = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  DosageEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int medicationId,
    required int dayOfWeek,
    required String timeSlot,
    required double quantity,
  }) : medicationId = Value(medicationId),
       dayOfWeek = Value(dayOfWeek),
       timeSlot = Value(timeSlot),
       quantity = Value(quantity);
  static Insertable<DosageEntry> custom({
    Expression<int>? id,
    Expression<int>? medicationId,
    Expression<int>? dayOfWeek,
    Expression<String>? timeSlot,
    Expression<double>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (timeSlot != null) 'time_slot': timeSlot,
      if (quantity != null) 'quantity': quantity,
    });
  }

  DosageEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? medicationId,
    Value<int>? dayOfWeek,
    Value<String>? timeSlot,
    Value<double>? quantity,
  }) {
    return DosageEntriesCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      timeSlot: timeSlot ?? this.timeSlot,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<int>(medicationId.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (timeSlot.present) {
      map['time_slot'] = Variable<String>(timeSlot.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DosageEntriesCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('timeSlot: $timeSlot, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

class $PurchasesTable extends Purchases
    with TableInfo<$PurchasesTable, Purchase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  @override
  late final GeneratedColumn<int> medicationId = GeneratedColumn<int>(
    'medication_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medications (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _boxesMeta = const VerificationMeta('boxes');
  @override
  late final GeneratedColumn<int> boxes = GeneratedColumn<int>(
    'boxes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tabletsMeta = const VerificationMeta(
    'tablets',
  );
  @override
  late final GeneratedColumn<int> tablets = GeneratedColumn<int>(
    'tablets',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    medicationId,
    date,
    mode,
    boxes,
    tablets,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchases';
  @override
  VerificationContext validateIntegrity(
    Insertable<Purchase> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('boxes')) {
      context.handle(
        _boxesMeta,
        boxes.isAcceptableOrUnknown(data['boxes']!, _boxesMeta),
      );
    }
    if (data.containsKey('tablets')) {
      context.handle(
        _tabletsMeta,
        tablets.isAcceptableOrUnknown(data['tablets']!, _tabletsMeta),
      );
    } else if (isInserting) {
      context.missing(_tabletsMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Purchase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Purchase(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medication_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      )!,
      boxes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}boxes'],
      ),
      tablets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tablets'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $PurchasesTable createAlias(String alias) {
    return $PurchasesTable(attachedDatabase, alias);
  }
}

class Purchase extends DataClass implements Insertable<Purchase> {
  final int id;
  final int medicationId;
  final DateTime date;
  final String mode;
  final int? boxes;
  final int tablets;
  final String? note;
  const Purchase({
    required this.id,
    required this.medicationId,
    required this.date,
    required this.mode,
    this.boxes,
    required this.tablets,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['medication_id'] = Variable<int>(medicationId);
    map['date'] = Variable<DateTime>(date);
    map['mode'] = Variable<String>(mode);
    if (!nullToAbsent || boxes != null) {
      map['boxes'] = Variable<int>(boxes);
    }
    map['tablets'] = Variable<int>(tablets);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  PurchasesCompanion toCompanion(bool nullToAbsent) {
    return PurchasesCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      date: Value(date),
      mode: Value(mode),
      boxes: boxes == null && nullToAbsent
          ? const Value.absent()
          : Value(boxes),
      tablets: Value(tablets),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory Purchase.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Purchase(
      id: serializer.fromJson<int>(json['id']),
      medicationId: serializer.fromJson<int>(json['medicationId']),
      date: serializer.fromJson<DateTime>(json['date']),
      mode: serializer.fromJson<String>(json['mode']),
      boxes: serializer.fromJson<int?>(json['boxes']),
      tablets: serializer.fromJson<int>(json['tablets']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicationId': serializer.toJson<int>(medicationId),
      'date': serializer.toJson<DateTime>(date),
      'mode': serializer.toJson<String>(mode),
      'boxes': serializer.toJson<int?>(boxes),
      'tablets': serializer.toJson<int>(tablets),
      'note': serializer.toJson<String?>(note),
    };
  }

  Purchase copyWith({
    int? id,
    int? medicationId,
    DateTime? date,
    String? mode,
    Value<int?> boxes = const Value.absent(),
    int? tablets,
    Value<String?> note = const Value.absent(),
  }) => Purchase(
    id: id ?? this.id,
    medicationId: medicationId ?? this.medicationId,
    date: date ?? this.date,
    mode: mode ?? this.mode,
    boxes: boxes.present ? boxes.value : this.boxes,
    tablets: tablets ?? this.tablets,
    note: note.present ? note.value : this.note,
  );
  Purchase copyWithCompanion(PurchasesCompanion data) {
    return Purchase(
      id: data.id.present ? data.id.value : this.id,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      date: data.date.present ? data.date.value : this.date,
      mode: data.mode.present ? data.mode.value : this.mode,
      boxes: data.boxes.present ? data.boxes.value : this.boxes,
      tablets: data.tablets.present ? data.tablets.value : this.tablets,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Purchase(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('date: $date, ')
          ..write('mode: $mode, ')
          ..write('boxes: $boxes, ')
          ..write('tablets: $tablets, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, medicationId, date, mode, boxes, tablets, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Purchase &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.date == this.date &&
          other.mode == this.mode &&
          other.boxes == this.boxes &&
          other.tablets == this.tablets &&
          other.note == this.note);
}

class PurchasesCompanion extends UpdateCompanion<Purchase> {
  final Value<int> id;
  final Value<int> medicationId;
  final Value<DateTime> date;
  final Value<String> mode;
  final Value<int?> boxes;
  final Value<int> tablets;
  final Value<String?> note;
  const PurchasesCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.date = const Value.absent(),
    this.mode = const Value.absent(),
    this.boxes = const Value.absent(),
    this.tablets = const Value.absent(),
    this.note = const Value.absent(),
  });
  PurchasesCompanion.insert({
    this.id = const Value.absent(),
    required int medicationId,
    required DateTime date,
    required String mode,
    this.boxes = const Value.absent(),
    required int tablets,
    this.note = const Value.absent(),
  }) : medicationId = Value(medicationId),
       date = Value(date),
       mode = Value(mode),
       tablets = Value(tablets);
  static Insertable<Purchase> custom({
    Expression<int>? id,
    Expression<int>? medicationId,
    Expression<DateTime>? date,
    Expression<String>? mode,
    Expression<int>? boxes,
    Expression<int>? tablets,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (date != null) 'date': date,
      if (mode != null) 'mode': mode,
      if (boxes != null) 'boxes': boxes,
      if (tablets != null) 'tablets': tablets,
      if (note != null) 'note': note,
    });
  }

  PurchasesCompanion copyWith({
    Value<int>? id,
    Value<int>? medicationId,
    Value<DateTime>? date,
    Value<String>? mode,
    Value<int?>? boxes,
    Value<int>? tablets,
    Value<String?>? note,
  }) {
    return PurchasesCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      date: date ?? this.date,
      mode: mode ?? this.mode,
      boxes: boxes ?? this.boxes,
      tablets: tablets ?? this.tablets,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<int>(medicationId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (boxes.present) {
      map['boxes'] = Variable<int>(boxes.value);
    }
    if (tablets.present) {
      map['tablets'] = Variable<int>(tablets.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchasesCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('date: $date, ')
          ..write('mode: $mode, ')
          ..write('boxes: $boxes, ')
          ..write('tablets: $tablets, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $RefillsTable extends Refills with TableInfo<$RefillsTable, Refill> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RefillsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalTabletsConsumedMeta =
      const VerificationMeta('totalTabletsConsumed');
  @override
  late final GeneratedColumn<double> totalTabletsConsumed =
      GeneratedColumn<double>(
        'total_tablets_consumed',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [id, date, totalTabletsConsumed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'refills';
  @override
  VerificationContext validateIntegrity(
    Insertable<Refill> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('total_tablets_consumed')) {
      context.handle(
        _totalTabletsConsumedMeta,
        totalTabletsConsumed.isAcceptableOrUnknown(
          data['total_tablets_consumed']!,
          _totalTabletsConsumedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalTabletsConsumedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Refill map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Refill(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      totalTabletsConsumed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_tablets_consumed'],
      )!,
    );
  }

  @override
  $RefillsTable createAlias(String alias) {
    return $RefillsTable(attachedDatabase, alias);
  }
}

class Refill extends DataClass implements Insertable<Refill> {
  final int id;
  final DateTime date;
  final double totalTabletsConsumed;
  const Refill({
    required this.id,
    required this.date,
    required this.totalTabletsConsumed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['total_tablets_consumed'] = Variable<double>(totalTabletsConsumed);
    return map;
  }

  RefillsCompanion toCompanion(bool nullToAbsent) {
    return RefillsCompanion(
      id: Value(id),
      date: Value(date),
      totalTabletsConsumed: Value(totalTabletsConsumed),
    );
  }

  factory Refill.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Refill(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      totalTabletsConsumed: serializer.fromJson<double>(
        json['totalTabletsConsumed'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'totalTabletsConsumed': serializer.toJson<double>(totalTabletsConsumed),
    };
  }

  Refill copyWith({int? id, DateTime? date, double? totalTabletsConsumed}) =>
      Refill(
        id: id ?? this.id,
        date: date ?? this.date,
        totalTabletsConsumed: totalTabletsConsumed ?? this.totalTabletsConsumed,
      );
  Refill copyWithCompanion(RefillsCompanion data) {
    return Refill(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      totalTabletsConsumed: data.totalTabletsConsumed.present
          ? data.totalTabletsConsumed.value
          : this.totalTabletsConsumed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Refill(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('totalTabletsConsumed: $totalTabletsConsumed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, totalTabletsConsumed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Refill &&
          other.id == this.id &&
          other.date == this.date &&
          other.totalTabletsConsumed == this.totalTabletsConsumed);
}

class RefillsCompanion extends UpdateCompanion<Refill> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> totalTabletsConsumed;
  const RefillsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.totalTabletsConsumed = const Value.absent(),
  });
  RefillsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required double totalTabletsConsumed,
  }) : date = Value(date),
       totalTabletsConsumed = Value(totalTabletsConsumed);
  static Insertable<Refill> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? totalTabletsConsumed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (totalTabletsConsumed != null)
        'total_tablets_consumed': totalTabletsConsumed,
    });
  }

  RefillsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<double>? totalTabletsConsumed,
  }) {
    return RefillsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      totalTabletsConsumed: totalTabletsConsumed ?? this.totalTabletsConsumed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (totalTabletsConsumed.present) {
      map['total_tablets_consumed'] = Variable<double>(
        totalTabletsConsumed.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RefillsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('totalTabletsConsumed: $totalTabletsConsumed')
          ..write(')'))
        .toString();
  }
}

class $RefillItemsTable extends RefillItems
    with TableInfo<$RefillItemsTable, RefillItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RefillItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _refillIdMeta = const VerificationMeta(
    'refillId',
  );
  @override
  late final GeneratedColumn<int> refillId = GeneratedColumn<int>(
    'refill_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES refills (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _medicationIdMeta = const VerificationMeta(
    'medicationId',
  );
  @override
  late final GeneratedColumn<int> medicationId = GeneratedColumn<int>(
    'medication_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medications (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _medicationNameMeta = const VerificationMeta(
    'medicationName',
  );
  @override
  late final GeneratedColumn<String> medicationName = GeneratedColumn<String>(
    'medication_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tabletsConsumedMeta = const VerificationMeta(
    'tabletsConsumed',
  );
  @override
  late final GeneratedColumn<double> tabletsConsumed = GeneratedColumn<double>(
    'tablets_consumed',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    refillId,
    medicationId,
    medicationName,
    tabletsConsumed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'refill_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<RefillItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('refill_id')) {
      context.handle(
        _refillIdMeta,
        refillId.isAcceptableOrUnknown(data['refill_id']!, _refillIdMeta),
      );
    } else if (isInserting) {
      context.missing(_refillIdMeta);
    }
    if (data.containsKey('medication_id')) {
      context.handle(
        _medicationIdMeta,
        medicationId.isAcceptableOrUnknown(
          data['medication_id']!,
          _medicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('medication_name')) {
      context.handle(
        _medicationNameMeta,
        medicationName.isAcceptableOrUnknown(
          data['medication_name']!,
          _medicationNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationNameMeta);
    }
    if (data.containsKey('tablets_consumed')) {
      context.handle(
        _tabletsConsumedMeta,
        tabletsConsumed.isAcceptableOrUnknown(
          data['tablets_consumed']!,
          _tabletsConsumedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tabletsConsumedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RefillItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RefillItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      refillId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}refill_id'],
      )!,
      medicationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medication_id'],
      )!,
      medicationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_name'],
      )!,
      tabletsConsumed: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tablets_consumed'],
      )!,
    );
  }

  @override
  $RefillItemsTable createAlias(String alias) {
    return $RefillItemsTable(attachedDatabase, alias);
  }
}

class RefillItem extends DataClass implements Insertable<RefillItem> {
  final int id;
  final int refillId;
  final int medicationId;
  final String medicationName;
  final double tabletsConsumed;
  const RefillItem({
    required this.id,
    required this.refillId,
    required this.medicationId,
    required this.medicationName,
    required this.tabletsConsumed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['refill_id'] = Variable<int>(refillId);
    map['medication_id'] = Variable<int>(medicationId);
    map['medication_name'] = Variable<String>(medicationName);
    map['tablets_consumed'] = Variable<double>(tabletsConsumed);
    return map;
  }

  RefillItemsCompanion toCompanion(bool nullToAbsent) {
    return RefillItemsCompanion(
      id: Value(id),
      refillId: Value(refillId),
      medicationId: Value(medicationId),
      medicationName: Value(medicationName),
      tabletsConsumed: Value(tabletsConsumed),
    );
  }

  factory RefillItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RefillItem(
      id: serializer.fromJson<int>(json['id']),
      refillId: serializer.fromJson<int>(json['refillId']),
      medicationId: serializer.fromJson<int>(json['medicationId']),
      medicationName: serializer.fromJson<String>(json['medicationName']),
      tabletsConsumed: serializer.fromJson<double>(json['tabletsConsumed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'refillId': serializer.toJson<int>(refillId),
      'medicationId': serializer.toJson<int>(medicationId),
      'medicationName': serializer.toJson<String>(medicationName),
      'tabletsConsumed': serializer.toJson<double>(tabletsConsumed),
    };
  }

  RefillItem copyWith({
    int? id,
    int? refillId,
    int? medicationId,
    String? medicationName,
    double? tabletsConsumed,
  }) => RefillItem(
    id: id ?? this.id,
    refillId: refillId ?? this.refillId,
    medicationId: medicationId ?? this.medicationId,
    medicationName: medicationName ?? this.medicationName,
    tabletsConsumed: tabletsConsumed ?? this.tabletsConsumed,
  );
  RefillItem copyWithCompanion(RefillItemsCompanion data) {
    return RefillItem(
      id: data.id.present ? data.id.value : this.id,
      refillId: data.refillId.present ? data.refillId.value : this.refillId,
      medicationId: data.medicationId.present
          ? data.medicationId.value
          : this.medicationId,
      medicationName: data.medicationName.present
          ? data.medicationName.value
          : this.medicationName,
      tabletsConsumed: data.tabletsConsumed.present
          ? data.tabletsConsumed.value
          : this.tabletsConsumed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RefillItem(')
          ..write('id: $id, ')
          ..write('refillId: $refillId, ')
          ..write('medicationId: $medicationId, ')
          ..write('medicationName: $medicationName, ')
          ..write('tabletsConsumed: $tabletsConsumed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, refillId, medicationId, medicationName, tabletsConsumed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RefillItem &&
          other.id == this.id &&
          other.refillId == this.refillId &&
          other.medicationId == this.medicationId &&
          other.medicationName == this.medicationName &&
          other.tabletsConsumed == this.tabletsConsumed);
}

class RefillItemsCompanion extends UpdateCompanion<RefillItem> {
  final Value<int> id;
  final Value<int> refillId;
  final Value<int> medicationId;
  final Value<String> medicationName;
  final Value<double> tabletsConsumed;
  const RefillItemsCompanion({
    this.id = const Value.absent(),
    this.refillId = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.medicationName = const Value.absent(),
    this.tabletsConsumed = const Value.absent(),
  });
  RefillItemsCompanion.insert({
    this.id = const Value.absent(),
    required int refillId,
    required int medicationId,
    required String medicationName,
    required double tabletsConsumed,
  }) : refillId = Value(refillId),
       medicationId = Value(medicationId),
       medicationName = Value(medicationName),
       tabletsConsumed = Value(tabletsConsumed);
  static Insertable<RefillItem> custom({
    Expression<int>? id,
    Expression<int>? refillId,
    Expression<int>? medicationId,
    Expression<String>? medicationName,
    Expression<double>? tabletsConsumed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (refillId != null) 'refill_id': refillId,
      if (medicationId != null) 'medication_id': medicationId,
      if (medicationName != null) 'medication_name': medicationName,
      if (tabletsConsumed != null) 'tablets_consumed': tabletsConsumed,
    });
  }

  RefillItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? refillId,
    Value<int>? medicationId,
    Value<String>? medicationName,
    Value<double>? tabletsConsumed,
  }) {
    return RefillItemsCompanion(
      id: id ?? this.id,
      refillId: refillId ?? this.refillId,
      medicationId: medicationId ?? this.medicationId,
      medicationName: medicationName ?? this.medicationName,
      tabletsConsumed: tabletsConsumed ?? this.tabletsConsumed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (refillId.present) {
      map['refill_id'] = Variable<int>(refillId.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<int>(medicationId.value);
    }
    if (medicationName.present) {
      map['medication_name'] = Variable<String>(medicationName.value);
    }
    if (tabletsConsumed.present) {
      map['tablets_consumed'] = Variable<double>(tabletsConsumed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RefillItemsCompanion(')
          ..write('id: $id, ')
          ..write('refillId: $refillId, ')
          ..write('medicationId: $medicationId, ')
          ..write('medicationName: $medicationName, ')
          ..write('tabletsConsumed: $tabletsConsumed')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  const AppSetting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(key: Value(key), value: Value(value));
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppSetting copyWith({String? key, String? value}) =>
      AppSetting(key: key ?? this.key, value: value ?? this.value);
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $DosageEntriesTable dosageEntries = $DosageEntriesTable(this);
  late final $PurchasesTable purchases = $PurchasesTable(this);
  late final $RefillsTable refills = $RefillsTable(this);
  late final $RefillItemsTable refillItems = $RefillItemsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final MedicationDao medicationDao = MedicationDao(this as AppDatabase);
  late final PurchaseDao purchaseDao = PurchaseDao(this as AppDatabase);
  late final RefillDao refillDao = RefillDao(this as AppDatabase);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    medications,
    dosageEntries,
    purchases,
    refills,
    refillItems,
    appSettings,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'medications',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('dosage_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'medications',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('purchases', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'refills',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('refill_items', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'medications',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('refill_items', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$MedicationsTableCreateCompanionBuilder =
    MedicationsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> notes,
      Value<int> packageSize,
      Value<int> alertThresholdWeeks,
      Value<double> currentStockTablets,
      Value<DateTime> createdAt,
      Value<DateTime?> archivedAt,
    });
typedef $$MedicationsTableUpdateCompanionBuilder =
    MedicationsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> notes,
      Value<int> packageSize,
      Value<int> alertThresholdWeeks,
      Value<double> currentStockTablets,
      Value<DateTime> createdAt,
      Value<DateTime?> archivedAt,
    });

final class $$MedicationsTableReferences
    extends BaseReferences<_$AppDatabase, $MedicationsTable, Medication> {
  $$MedicationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DosageEntriesTable, List<DosageEntry>>
  _dosageEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dosageEntries,
    aliasName: $_aliasNameGenerator(
      db.medications.id,
      db.dosageEntries.medicationId,
    ),
  );

  $$DosageEntriesTableProcessedTableManager get dosageEntriesRefs {
    final manager = $$DosageEntriesTableTableManager(
      $_db,
      $_db.dosageEntries,
    ).filter((f) => f.medicationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dosageEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PurchasesTable, List<Purchase>>
  _purchasesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.purchases,
    aliasName: $_aliasNameGenerator(
      db.medications.id,
      db.purchases.medicationId,
    ),
  );

  $$PurchasesTableProcessedTableManager get purchasesRefs {
    final manager = $$PurchasesTableTableManager(
      $_db,
      $_db.purchases,
    ).filter((f) => f.medicationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_purchasesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RefillItemsTable, List<RefillItem>>
  _refillItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.refillItems,
    aliasName: $_aliasNameGenerator(
      db.medications.id,
      db.refillItems.medicationId,
    ),
  );

  $$RefillItemsTableProcessedTableManager get refillItemsRefs {
    final manager = $$RefillItemsTableTableManager(
      $_db,
      $_db.refillItems,
    ).filter((f) => f.medicationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_refillItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MedicationsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get packageSize => $composableBuilder(
    column: $table.packageSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get alertThresholdWeeks => $composableBuilder(
    column: $table.alertThresholdWeeks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentStockTablets => $composableBuilder(
    column: $table.currentStockTablets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dosageEntriesRefs(
    Expression<bool> Function($$DosageEntriesTableFilterComposer f) f,
  ) {
    final $$DosageEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dosageEntries,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DosageEntriesTableFilterComposer(
            $db: $db,
            $table: $db.dosageEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> purchasesRefs(
    Expression<bool> Function($$PurchasesTableFilterComposer f) f,
  ) {
    final $$PurchasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchases,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchasesTableFilterComposer(
            $db: $db,
            $table: $db.purchases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> refillItemsRefs(
    Expression<bool> Function($$RefillItemsTableFilterComposer f) f,
  ) {
    final $$RefillItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.refillItems,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RefillItemsTableFilterComposer(
            $db: $db,
            $table: $db.refillItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get packageSize => $composableBuilder(
    column: $table.packageSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get alertThresholdWeeks => $composableBuilder(
    column: $table.alertThresholdWeeks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentStockTablets => $composableBuilder(
    column: $table.currentStockTablets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get packageSize => $composableBuilder(
    column: $table.packageSize,
    builder: (column) => column,
  );

  GeneratedColumn<int> get alertThresholdWeeks => $composableBuilder(
    column: $table.alertThresholdWeeks,
    builder: (column) => column,
  );

  GeneratedColumn<double> get currentStockTablets => $composableBuilder(
    column: $table.currentStockTablets,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  Expression<T> dosageEntriesRefs<T extends Object>(
    Expression<T> Function($$DosageEntriesTableAnnotationComposer a) f,
  ) {
    final $$DosageEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dosageEntries,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DosageEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.dosageEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> purchasesRefs<T extends Object>(
    Expression<T> Function($$PurchasesTableAnnotationComposer a) f,
  ) {
    final $$PurchasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.purchases,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PurchasesTableAnnotationComposer(
            $db: $db,
            $table: $db.purchases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> refillItemsRefs<T extends Object>(
    Expression<T> Function($$RefillItemsTableAnnotationComposer a) f,
  ) {
    final $$RefillItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.refillItems,
      getReferencedColumn: (t) => t.medicationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RefillItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.refillItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MedicationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicationsTable,
          Medication,
          $$MedicationsTableFilterComposer,
          $$MedicationsTableOrderingComposer,
          $$MedicationsTableAnnotationComposer,
          $$MedicationsTableCreateCompanionBuilder,
          $$MedicationsTableUpdateCompanionBuilder,
          (Medication, $$MedicationsTableReferences),
          Medication,
          PrefetchHooks Function({
            bool dosageEntriesRefs,
            bool purchasesRefs,
            bool refillItemsRefs,
          })
        > {
  $$MedicationsTableTableManager(_$AppDatabase db, $MedicationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> packageSize = const Value.absent(),
                Value<int> alertThresholdWeeks = const Value.absent(),
                Value<double> currentStockTablets = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
              }) => MedicationsCompanion(
                id: id,
                name: name,
                notes: notes,
                packageSize: packageSize,
                alertThresholdWeeks: alertThresholdWeeks,
                currentStockTablets: currentStockTablets,
                createdAt: createdAt,
                archivedAt: archivedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> notes = const Value.absent(),
                Value<int> packageSize = const Value.absent(),
                Value<int> alertThresholdWeeks = const Value.absent(),
                Value<double> currentStockTablets = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
              }) => MedicationsCompanion.insert(
                id: id,
                name: name,
                notes: notes,
                packageSize: packageSize,
                alertThresholdWeeks: alertThresholdWeeks,
                currentStockTablets: currentStockTablets,
                createdAt: createdAt,
                archivedAt: archivedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedicationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                dosageEntriesRefs = false,
                purchasesRefs = false,
                refillItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dosageEntriesRefs) db.dosageEntries,
                    if (purchasesRefs) db.purchases,
                    if (refillItemsRefs) db.refillItems,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dosageEntriesRefs)
                        await $_getPrefetchedData<
                          Medication,
                          $MedicationsTable,
                          DosageEntry
                        >(
                          currentTable: table,
                          referencedTable: $$MedicationsTableReferences
                              ._dosageEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicationsTableReferences(
                                db,
                                table,
                                p0,
                              ).dosageEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (purchasesRefs)
                        await $_getPrefetchedData<
                          Medication,
                          $MedicationsTable,
                          Purchase
                        >(
                          currentTable: table,
                          referencedTable: $$MedicationsTableReferences
                              ._purchasesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicationsTableReferences(
                                db,
                                table,
                                p0,
                              ).purchasesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicationId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (refillItemsRefs)
                        await $_getPrefetchedData<
                          Medication,
                          $MedicationsTable,
                          RefillItem
                        >(
                          currentTable: table,
                          referencedTable: $$MedicationsTableReferences
                              ._refillItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicationsTableReferences(
                                db,
                                table,
                                p0,
                              ).refillItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicationId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MedicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicationsTable,
      Medication,
      $$MedicationsTableFilterComposer,
      $$MedicationsTableOrderingComposer,
      $$MedicationsTableAnnotationComposer,
      $$MedicationsTableCreateCompanionBuilder,
      $$MedicationsTableUpdateCompanionBuilder,
      (Medication, $$MedicationsTableReferences),
      Medication,
      PrefetchHooks Function({
        bool dosageEntriesRefs,
        bool purchasesRefs,
        bool refillItemsRefs,
      })
    >;
typedef $$DosageEntriesTableCreateCompanionBuilder =
    DosageEntriesCompanion Function({
      Value<int> id,
      required int medicationId,
      required int dayOfWeek,
      required String timeSlot,
      required double quantity,
    });
typedef $$DosageEntriesTableUpdateCompanionBuilder =
    DosageEntriesCompanion Function({
      Value<int> id,
      Value<int> medicationId,
      Value<int> dayOfWeek,
      Value<String> timeSlot,
      Value<double> quantity,
    });

final class $$DosageEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $DosageEntriesTable, DosageEntry> {
  $$DosageEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MedicationsTable _medicationIdTable(_$AppDatabase db) =>
      db.medications.createAlias(
        $_aliasNameGenerator(db.dosageEntries.medicationId, db.medications.id),
      );

  $$MedicationsTableProcessedTableManager get medicationId {
    final $_column = $_itemColumn<int>('medication_id')!;

    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DosageEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DosageEntriesTable> {
  $$DosageEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timeSlot => $composableBuilder(
    column: $table.timeSlot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DosageEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DosageEntriesTable> {
  $$DosageEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timeSlot => $composableBuilder(
    column: $table.timeSlot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableOrderingComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DosageEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DosageEntriesTable> {
  $$DosageEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<String> get timeSlot =>
      $composableBuilder(column: $table.timeSlot, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DosageEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DosageEntriesTable,
          DosageEntry,
          $$DosageEntriesTableFilterComposer,
          $$DosageEntriesTableOrderingComposer,
          $$DosageEntriesTableAnnotationComposer,
          $$DosageEntriesTableCreateCompanionBuilder,
          $$DosageEntriesTableUpdateCompanionBuilder,
          (DosageEntry, $$DosageEntriesTableReferences),
          DosageEntry,
          PrefetchHooks Function({bool medicationId})
        > {
  $$DosageEntriesTableTableManager(_$AppDatabase db, $DosageEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DosageEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DosageEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DosageEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> medicationId = const Value.absent(),
                Value<int> dayOfWeek = const Value.absent(),
                Value<String> timeSlot = const Value.absent(),
                Value<double> quantity = const Value.absent(),
              }) => DosageEntriesCompanion(
                id: id,
                medicationId: medicationId,
                dayOfWeek: dayOfWeek,
                timeSlot: timeSlot,
                quantity: quantity,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int medicationId,
                required int dayOfWeek,
                required String timeSlot,
                required double quantity,
              }) => DosageEntriesCompanion.insert(
                id: id,
                medicationId: medicationId,
                dayOfWeek: dayOfWeek,
                timeSlot: timeSlot,
                quantity: quantity,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DosageEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicationId,
                                referencedTable: $$DosageEntriesTableReferences
                                    ._medicationIdTable(db),
                                referencedColumn: $$DosageEntriesTableReferences
                                    ._medicationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DosageEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DosageEntriesTable,
      DosageEntry,
      $$DosageEntriesTableFilterComposer,
      $$DosageEntriesTableOrderingComposer,
      $$DosageEntriesTableAnnotationComposer,
      $$DosageEntriesTableCreateCompanionBuilder,
      $$DosageEntriesTableUpdateCompanionBuilder,
      (DosageEntry, $$DosageEntriesTableReferences),
      DosageEntry,
      PrefetchHooks Function({bool medicationId})
    >;
typedef $$PurchasesTableCreateCompanionBuilder =
    PurchasesCompanion Function({
      Value<int> id,
      required int medicationId,
      required DateTime date,
      required String mode,
      Value<int?> boxes,
      required int tablets,
      Value<String?> note,
    });
typedef $$PurchasesTableUpdateCompanionBuilder =
    PurchasesCompanion Function({
      Value<int> id,
      Value<int> medicationId,
      Value<DateTime> date,
      Value<String> mode,
      Value<int?> boxes,
      Value<int> tablets,
      Value<String?> note,
    });

final class $$PurchasesTableReferences
    extends BaseReferences<_$AppDatabase, $PurchasesTable, Purchase> {
  $$PurchasesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MedicationsTable _medicationIdTable(_$AppDatabase db) =>
      db.medications.createAlias(
        $_aliasNameGenerator(db.purchases.medicationId, db.medications.id),
      );

  $$MedicationsTableProcessedTableManager get medicationId {
    final $_column = $_itemColumn<int>('medication_id')!;

    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PurchasesTableFilterComposer
    extends Composer<_$AppDatabase, $PurchasesTable> {
  $$PurchasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get boxes => $composableBuilder(
    column: $table.boxes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tablets => $composableBuilder(
    column: $table.tablets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchasesTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchasesTable> {
  $$PurchasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get boxes => $composableBuilder(
    column: $table.boxes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tablets => $composableBuilder(
    column: $table.tablets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableOrderingComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchasesTable> {
  $$PurchasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<int> get boxes =>
      $composableBuilder(column: $table.boxes, builder: (column) => column);

  GeneratedColumn<int> get tablets =>
      $composableBuilder(column: $table.tablets, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PurchasesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchasesTable,
          Purchase,
          $$PurchasesTableFilterComposer,
          $$PurchasesTableOrderingComposer,
          $$PurchasesTableAnnotationComposer,
          $$PurchasesTableCreateCompanionBuilder,
          $$PurchasesTableUpdateCompanionBuilder,
          (Purchase, $$PurchasesTableReferences),
          Purchase,
          PrefetchHooks Function({bool medicationId})
        > {
  $$PurchasesTableTableManager(_$AppDatabase db, $PurchasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> medicationId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> mode = const Value.absent(),
                Value<int?> boxes = const Value.absent(),
                Value<int> tablets = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => PurchasesCompanion(
                id: id,
                medicationId: medicationId,
                date: date,
                mode: mode,
                boxes: boxes,
                tablets: tablets,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int medicationId,
                required DateTime date,
                required String mode,
                Value<int?> boxes = const Value.absent(),
                required int tablets,
                Value<String?> note = const Value.absent(),
              }) => PurchasesCompanion.insert(
                id: id,
                medicationId: medicationId,
                date: date,
                mode: mode,
                boxes: boxes,
                tablets: tablets,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PurchasesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicationId,
                                referencedTable: $$PurchasesTableReferences
                                    ._medicationIdTable(db),
                                referencedColumn: $$PurchasesTableReferences
                                    ._medicationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PurchasesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchasesTable,
      Purchase,
      $$PurchasesTableFilterComposer,
      $$PurchasesTableOrderingComposer,
      $$PurchasesTableAnnotationComposer,
      $$PurchasesTableCreateCompanionBuilder,
      $$PurchasesTableUpdateCompanionBuilder,
      (Purchase, $$PurchasesTableReferences),
      Purchase,
      PrefetchHooks Function({bool medicationId})
    >;
typedef $$RefillsTableCreateCompanionBuilder =
    RefillsCompanion Function({
      Value<int> id,
      required DateTime date,
      required double totalTabletsConsumed,
    });
typedef $$RefillsTableUpdateCompanionBuilder =
    RefillsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<double> totalTabletsConsumed,
    });

final class $$RefillsTableReferences
    extends BaseReferences<_$AppDatabase, $RefillsTable, Refill> {
  $$RefillsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RefillItemsTable, List<RefillItem>>
  _refillItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.refillItems,
    aliasName: $_aliasNameGenerator(db.refills.id, db.refillItems.refillId),
  );

  $$RefillItemsTableProcessedTableManager get refillItemsRefs {
    final manager = $$RefillItemsTableTableManager(
      $_db,
      $_db.refillItems,
    ).filter((f) => f.refillId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_refillItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RefillsTableFilterComposer
    extends Composer<_$AppDatabase, $RefillsTable> {
  $$RefillsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalTabletsConsumed => $composableBuilder(
    column: $table.totalTabletsConsumed,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> refillItemsRefs(
    Expression<bool> Function($$RefillItemsTableFilterComposer f) f,
  ) {
    final $$RefillItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.refillItems,
      getReferencedColumn: (t) => t.refillId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RefillItemsTableFilterComposer(
            $db: $db,
            $table: $db.refillItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RefillsTableOrderingComposer
    extends Composer<_$AppDatabase, $RefillsTable> {
  $$RefillsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalTabletsConsumed => $composableBuilder(
    column: $table.totalTabletsConsumed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RefillsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RefillsTable> {
  $$RefillsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get totalTabletsConsumed => $composableBuilder(
    column: $table.totalTabletsConsumed,
    builder: (column) => column,
  );

  Expression<T> refillItemsRefs<T extends Object>(
    Expression<T> Function($$RefillItemsTableAnnotationComposer a) f,
  ) {
    final $$RefillItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.refillItems,
      getReferencedColumn: (t) => t.refillId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RefillItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.refillItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RefillsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RefillsTable,
          Refill,
          $$RefillsTableFilterComposer,
          $$RefillsTableOrderingComposer,
          $$RefillsTableAnnotationComposer,
          $$RefillsTableCreateCompanionBuilder,
          $$RefillsTableUpdateCompanionBuilder,
          (Refill, $$RefillsTableReferences),
          Refill,
          PrefetchHooks Function({bool refillItemsRefs})
        > {
  $$RefillsTableTableManager(_$AppDatabase db, $RefillsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RefillsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RefillsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RefillsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<double> totalTabletsConsumed = const Value.absent(),
              }) => RefillsCompanion(
                id: id,
                date: date,
                totalTabletsConsumed: totalTabletsConsumed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required double totalTabletsConsumed,
              }) => RefillsCompanion.insert(
                id: id,
                date: date,
                totalTabletsConsumed: totalTabletsConsumed,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RefillsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({refillItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (refillItemsRefs) db.refillItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (refillItemsRefs)
                    await $_getPrefetchedData<
                      Refill,
                      $RefillsTable,
                      RefillItem
                    >(
                      currentTable: table,
                      referencedTable: $$RefillsTableReferences
                          ._refillItemsRefsTable(db),
                      managerFromTypedResult: (p0) => $$RefillsTableReferences(
                        db,
                        table,
                        p0,
                      ).refillItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.refillId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RefillsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RefillsTable,
      Refill,
      $$RefillsTableFilterComposer,
      $$RefillsTableOrderingComposer,
      $$RefillsTableAnnotationComposer,
      $$RefillsTableCreateCompanionBuilder,
      $$RefillsTableUpdateCompanionBuilder,
      (Refill, $$RefillsTableReferences),
      Refill,
      PrefetchHooks Function({bool refillItemsRefs})
    >;
typedef $$RefillItemsTableCreateCompanionBuilder =
    RefillItemsCompanion Function({
      Value<int> id,
      required int refillId,
      required int medicationId,
      required String medicationName,
      required double tabletsConsumed,
    });
typedef $$RefillItemsTableUpdateCompanionBuilder =
    RefillItemsCompanion Function({
      Value<int> id,
      Value<int> refillId,
      Value<int> medicationId,
      Value<String> medicationName,
      Value<double> tabletsConsumed,
    });

final class $$RefillItemsTableReferences
    extends BaseReferences<_$AppDatabase, $RefillItemsTable, RefillItem> {
  $$RefillItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RefillsTable _refillIdTable(_$AppDatabase db) =>
      db.refills.createAlias(
        $_aliasNameGenerator(db.refillItems.refillId, db.refills.id),
      );

  $$RefillsTableProcessedTableManager get refillId {
    final $_column = $_itemColumn<int>('refill_id')!;

    final manager = $$RefillsTableTableManager(
      $_db,
      $_db.refills,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_refillIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MedicationsTable _medicationIdTable(_$AppDatabase db) =>
      db.medications.createAlias(
        $_aliasNameGenerator(db.refillItems.medicationId, db.medications.id),
      );

  $$MedicationsTableProcessedTableManager get medicationId {
    final $_column = $_itemColumn<int>('medication_id')!;

    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RefillItemsTableFilterComposer
    extends Composer<_$AppDatabase, $RefillItemsTable> {
  $$RefillItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tabletsConsumed => $composableBuilder(
    column: $table.tabletsConsumed,
    builder: (column) => ColumnFilters(column),
  );

  $$RefillsTableFilterComposer get refillId {
    final $$RefillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.refillId,
      referencedTable: $db.refills,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RefillsTableFilterComposer(
            $db: $db,
            $table: $db.refills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicationsTableFilterComposer get medicationId {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RefillItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $RefillItemsTable> {
  $$RefillItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tabletsConsumed => $composableBuilder(
    column: $table.tabletsConsumed,
    builder: (column) => ColumnOrderings(column),
  );

  $$RefillsTableOrderingComposer get refillId {
    final $$RefillsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.refillId,
      referencedTable: $db.refills,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RefillsTableOrderingComposer(
            $db: $db,
            $table: $db.refills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicationsTableOrderingComposer get medicationId {
    final $$MedicationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableOrderingComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RefillItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RefillItemsTable> {
  $$RefillItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get tabletsConsumed => $composableBuilder(
    column: $table.tabletsConsumed,
    builder: (column) => column,
  );

  $$RefillsTableAnnotationComposer get refillId {
    final $$RefillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.refillId,
      referencedTable: $db.refills,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RefillsTableAnnotationComposer(
            $db: $db,
            $table: $db.refills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicationsTableAnnotationComposer get medicationId {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicationId,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RefillItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RefillItemsTable,
          RefillItem,
          $$RefillItemsTableFilterComposer,
          $$RefillItemsTableOrderingComposer,
          $$RefillItemsTableAnnotationComposer,
          $$RefillItemsTableCreateCompanionBuilder,
          $$RefillItemsTableUpdateCompanionBuilder,
          (RefillItem, $$RefillItemsTableReferences),
          RefillItem,
          PrefetchHooks Function({bool refillId, bool medicationId})
        > {
  $$RefillItemsTableTableManager(_$AppDatabase db, $RefillItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RefillItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RefillItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RefillItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> refillId = const Value.absent(),
                Value<int> medicationId = const Value.absent(),
                Value<String> medicationName = const Value.absent(),
                Value<double> tabletsConsumed = const Value.absent(),
              }) => RefillItemsCompanion(
                id: id,
                refillId: refillId,
                medicationId: medicationId,
                medicationName: medicationName,
                tabletsConsumed: tabletsConsumed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int refillId,
                required int medicationId,
                required String medicationName,
                required double tabletsConsumed,
              }) => RefillItemsCompanion.insert(
                id: id,
                refillId: refillId,
                medicationId: medicationId,
                medicationName: medicationName,
                tabletsConsumed: tabletsConsumed,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RefillItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({refillId = false, medicationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (refillId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.refillId,
                                referencedTable: $$RefillItemsTableReferences
                                    ._refillIdTable(db),
                                referencedColumn: $$RefillItemsTableReferences
                                    ._refillIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (medicationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicationId,
                                referencedTable: $$RefillItemsTableReferences
                                    ._medicationIdTable(db),
                                referencedColumn: $$RefillItemsTableReferences
                                    ._medicationIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RefillItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RefillItemsTable,
      RefillItem,
      $$RefillItemsTableFilterComposer,
      $$RefillItemsTableOrderingComposer,
      $$RefillItemsTableAnnotationComposer,
      $$RefillItemsTableCreateCompanionBuilder,
      $$RefillItemsTableUpdateCompanionBuilder,
      (RefillItem, $$RefillItemsTableReferences),
      RefillItem,
      PrefetchHooks Function({bool refillId, bool medicationId})
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MedicationsTableTableManager get medications =>
      $$MedicationsTableTableManager(_db, _db.medications);
  $$DosageEntriesTableTableManager get dosageEntries =>
      $$DosageEntriesTableTableManager(_db, _db.dosageEntries);
  $$PurchasesTableTableManager get purchases =>
      $$PurchasesTableTableManager(_db, _db.purchases);
  $$RefillsTableTableManager get refills =>
      $$RefillsTableTableManager(_db, _db.refills);
  $$RefillItemsTableTableManager get refillItems =>
      $$RefillItemsTableTableManager(_db, _db.refillItems);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
