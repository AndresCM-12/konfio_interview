// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.database.dart';

// ignore_for_file: type=lint
class $DogTableTable extends DogTable
    with TableInfo<$DogTableTable, DogTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dogNameMeta =
      const VerificationMeta('dogName');
  @override
  late final GeneratedColumn<String> dogName = GeneratedColumn<String>(
      'dog_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, dogName, description, age, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dog_table';
  @override
  VerificationContext validateIntegrity(Insertable<DogTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('dog_name')) {
      context.handle(_dogNameMeta,
          dogName.isAcceptableOrUnknown(data['dog_name']!, _dogNameMeta));
    } else if (isInserting) {
      context.missing(_dogNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DogTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DogTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dogName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dog_name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
    );
  }

  @override
  $DogTableTable createAlias(String alias) {
    return $DogTableTable(attachedDatabase, alias);
  }
}

class DogTableData extends DataClass implements Insertable<DogTableData> {
  final int id;
  final String dogName;
  final String description;
  final int age;
  final String image;
  const DogTableData(
      {required this.id,
      required this.dogName,
      required this.description,
      required this.age,
      required this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['dog_name'] = Variable<String>(dogName);
    map['description'] = Variable<String>(description);
    map['age'] = Variable<int>(age);
    map['image'] = Variable<String>(image);
    return map;
  }

  DogTableCompanion toCompanion(bool nullToAbsent) {
    return DogTableCompanion(
      id: Value(id),
      dogName: Value(dogName),
      description: Value(description),
      age: Value(age),
      image: Value(image),
    );
  }

  factory DogTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DogTableData(
      id: serializer.fromJson<int>(json['id']),
      dogName: serializer.fromJson<String>(json['dogName']),
      description: serializer.fromJson<String>(json['description']),
      age: serializer.fromJson<int>(json['age']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dogName': serializer.toJson<String>(dogName),
      'description': serializer.toJson<String>(description),
      'age': serializer.toJson<int>(age),
      'image': serializer.toJson<String>(image),
    };
  }

  DogTableData copyWith(
          {int? id,
          String? dogName,
          String? description,
          int? age,
          String? image}) =>
      DogTableData(
        id: id ?? this.id,
        dogName: dogName ?? this.dogName,
        description: description ?? this.description,
        age: age ?? this.age,
        image: image ?? this.image,
      );
  DogTableData copyWithCompanion(DogTableCompanion data) {
    return DogTableData(
      id: data.id.present ? data.id.value : this.id,
      dogName: data.dogName.present ? data.dogName.value : this.dogName,
      description:
          data.description.present ? data.description.value : this.description,
      age: data.age.present ? data.age.value : this.age,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DogTableData(')
          ..write('id: $id, ')
          ..write('dogName: $dogName, ')
          ..write('description: $description, ')
          ..write('age: $age, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dogName, description, age, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DogTableData &&
          other.id == this.id &&
          other.dogName == this.dogName &&
          other.description == this.description &&
          other.age == this.age &&
          other.image == this.image);
}

class DogTableCompanion extends UpdateCompanion<DogTableData> {
  final Value<int> id;
  final Value<String> dogName;
  final Value<String> description;
  final Value<int> age;
  final Value<String> image;
  const DogTableCompanion({
    this.id = const Value.absent(),
    this.dogName = const Value.absent(),
    this.description = const Value.absent(),
    this.age = const Value.absent(),
    this.image = const Value.absent(),
  });
  DogTableCompanion.insert({
    this.id = const Value.absent(),
    required String dogName,
    required String description,
    required int age,
    required String image,
  })  : dogName = Value(dogName),
        description = Value(description),
        age = Value(age),
        image = Value(image);
  static Insertable<DogTableData> custom({
    Expression<int>? id,
    Expression<String>? dogName,
    Expression<String>? description,
    Expression<int>? age,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dogName != null) 'dog_name': dogName,
      if (description != null) 'description': description,
      if (age != null) 'age': age,
      if (image != null) 'image': image,
    });
  }

  DogTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? dogName,
      Value<String>? description,
      Value<int>? age,
      Value<String>? image}) {
    return DogTableCompanion(
      id: id ?? this.id,
      dogName: dogName ?? this.dogName,
      description: description ?? this.description,
      age: age ?? this.age,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dogName.present) {
      map['dog_name'] = Variable<String>(dogName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DogTableCompanion(')
          ..write('id: $id, ')
          ..write('dogName: $dogName, ')
          ..write('description: $description, ')
          ..write('age: $age, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DogTableTable dogTable = $DogTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dogTable];
}

typedef $$DogTableTableCreateCompanionBuilder = DogTableCompanion Function({
  Value<int> id,
  required String dogName,
  required String description,
  required int age,
  required String image,
});
typedef $$DogTableTableUpdateCompanionBuilder = DogTableCompanion Function({
  Value<int> id,
  Value<String> dogName,
  Value<String> description,
  Value<int> age,
  Value<String> image,
});

class $$DogTableTableFilterComposer
    extends Composer<_$AppDatabase, $DogTableTable> {
  $$DogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dogName => $composableBuilder(
      column: $table.dogName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));
}

class $$DogTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DogTableTable> {
  $$DogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dogName => $composableBuilder(
      column: $table.dogName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));
}

class $$DogTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DogTableTable> {
  $$DogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get dogName =>
      $composableBuilder(column: $table.dogName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);
}

class $$DogTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DogTableTable,
    DogTableData,
    $$DogTableTableFilterComposer,
    $$DogTableTableOrderingComposer,
    $$DogTableTableAnnotationComposer,
    $$DogTableTableCreateCompanionBuilder,
    $$DogTableTableUpdateCompanionBuilder,
    (DogTableData, BaseReferences<_$AppDatabase, $DogTableTable, DogTableData>),
    DogTableData,
    PrefetchHooks Function()> {
  $$DogTableTableTableManager(_$AppDatabase db, $DogTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DogTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DogTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> dogName = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> age = const Value.absent(),
            Value<String> image = const Value.absent(),
          }) =>
              DogTableCompanion(
            id: id,
            dogName: dogName,
            description: description,
            age: age,
            image: image,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String dogName,
            required String description,
            required int age,
            required String image,
          }) =>
              DogTableCompanion.insert(
            id: id,
            dogName: dogName,
            description: description,
            age: age,
            image: image,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DogTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DogTableTable,
    DogTableData,
    $$DogTableTableFilterComposer,
    $$DogTableTableOrderingComposer,
    $$DogTableTableAnnotationComposer,
    $$DogTableTableCreateCompanionBuilder,
    $$DogTableTableUpdateCompanionBuilder,
    (DogTableData, BaseReferences<_$AppDatabase, $DogTableTable, DogTableData>),
    DogTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DogTableTableTableManager get dogTable =>
      $$DogTableTableTableManager(_db, _db.dogTable);
}
