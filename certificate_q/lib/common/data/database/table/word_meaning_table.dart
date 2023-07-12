import 'package:certificate_q/common/data/database/table/word_table.dart';
import 'package:drift/drift.dart';

class WordMeaningTable extends Table {
  // WordMeaning 테이블의 컬럼들
  IntColumn get id => integer().autoIncrement()();
  TextColumn get meaning => text()();

  IntColumn get wordTableId =>
      integer().nullable().references(WordTable, #id)();
}
