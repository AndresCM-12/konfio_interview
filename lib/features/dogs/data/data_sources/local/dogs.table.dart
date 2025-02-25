import 'package:drift/drift.dart';

class DogTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get dogName => text()();
  TextColumn get description => text()();
  IntColumn get age => integer()();
  TextColumn get image => text()();
}
