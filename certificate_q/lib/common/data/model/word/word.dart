import 'package:certificate_q/common/data/model/word/word_meaning.dart';
import 'package:drift/drift.dart';

import '../../database/drift_database.dart';
import 'type/language_type.dart';

abstract class Word {
  late int _id;
  late String _theme;

  late LanguageType _type;

  late String _spelling;
  late String _pronunciation;

  late List<WordMeaning> _meanings;

  int get id => _id;
  String get theme => _theme;

  LanguageType get type => _type;

  String get spelling => _spelling;
  String get pronunciation => _pronunciation;

  List<WordMeaning> get meanings => _meanings;

  set meanings(List<WordMeaning> meanings) {
    _meanings = meanings;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "theme": theme,
      "type": type.name,
      "spelling": spelling,
      "pronunciation": pronunciation,
      "meanings": meanings.map((meaning) => meaning.toJson()).toList(),
    };
  }

  WordTableCompanion toWordCompanion() {
    // final themeValue = updateTheme != null ? Value(updateTheme) : Value(theme);

    return WordTableCompanion(
      id: Value(id),
      theme: Value(theme),
      spelling: Value(spelling),
      pronunciation: Value(pronunciation) ?? const Value(""),
      meanings: Value(meanings.join(',')),
      languageType: Value(type.toString()),
    );
  }
}
