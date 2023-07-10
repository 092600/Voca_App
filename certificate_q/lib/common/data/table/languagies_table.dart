import 'package:drift/drift.dart';

class LanguageTable extends Table {
  // PK, AUTO_INCREMENT
  IntColumn get id => integer().autoIncrement()();

  // ENG. JP, ...
  TextColumn get languageType => text()();

  TextColumn get languageTitle => text()();

  // CreatedTime
  DateTimeColumn get createdAt => dateTime().clientDefault(
        () => DateTime.now(),
      )();
}
