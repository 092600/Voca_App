import 'package:drift/drift.dart';

import '../drift_database.dart';
import '../../model/word/word.dart';

class WordTable extends Table {
  // PK, AUTO_INCREMENT
  IntColumn get id => integer().autoIncrement()();

  // ENG. JP, ...
  TextColumn get languageType => text()();

  TextColumn get theme => text()();

  TextColumn get spelling => text()();
  TextColumn get pronunciation => text()();
  TextColumn get meanings => text()();

  // CreatedTime
  DateTimeColumn get createdAt => dateTime().clientDefault(
        () => DateTime.now(),
      )();

  WordTableCompanion fromWord(Word word) {
    return WordTableCompanion(
      languageType: Value(word.type.toString()),
      spelling: Value(word.spelling),
      pronunciation: Value(word.pronunciation),
      meanings: Value(word.meanings.join(',')),
    );
  }
}
