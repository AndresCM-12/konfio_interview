import 'package:drift/drift.dart';

class DogTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get dogName => text()();
  TextColumn get description => text()();
  //For demostration purposes, we will use the age as unique key
  IntColumn get age => integer().unique()();
  TextColumn get image => text()();
}
