import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:sh_mobile/features/dogs/data/data_sources/local/dogs.table.dart';

part 'app.database.g.dart';

@DriftDatabase(tables: [DogTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: "app_database",
      native: const DriftNativeOptions(),
    );
  }
}
