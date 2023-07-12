import 'package:certificate_q/common/data/database/drift_database.dart';
import 'package:certificate_q/common/data/model/word/word.dart';
import 'package:drift/drift.dart';

class WordMeaning {
  final int id;
  final String meaning;

  WordMeaning({
    required this.id,
    required this.meaning,
  });

  factory WordMeaning.fromJson(Map<String, dynamic> json) {
    return WordMeaning(
      id: json['id'] as int,
      meaning: json['meaning'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "meaning": meaning,
    };
  }

  WordMeaningTableCompanion toWordMeaningCompanion({required Word word}) {
    return WordMeaningTableCompanion(
      id: Value(id),
      meaning: Value(meaning),
      wordTableId: Value(word.id),
    );
  }
}
