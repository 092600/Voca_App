import 'package:voca/common/data/model/word/word.dart';
import 'package:drift/drift.dart';

import '../drift_database.dart';

class WordTable extends Table {
  // PK, AUTO_INCREMENT
  IntColumn get id => integer()();

  // ENG. JP, ...
  TextColumn get languageType => text()();

  TextColumn get theme => text()();

  TextColumn get spelling => text()();
  TextColumn get pronunciation => text()();

  TextColumn get meanings => text()();

  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();

  // CreatedTime
  DateTimeColumn get createdAt => dateTime().clientDefault(
        () => DateTime.now(),
      )();

  WordTableCompanion fromWord(Word word) {
    return WordTableCompanion(
      languageType: Value(word.type.toString()),
      spelling: Value(word.spelling),
      pronunciation: Value(word.pronunciation),
      isFavorite: Value(word.isFavorite),
    );
  }
}
