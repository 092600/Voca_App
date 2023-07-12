import 'package:drift/drift.dart';

import '../../database/drift_database.dart';
import 'type/language_type.dart';

abstract class Word {
  late String _theme;
  late String _spelling;
  late String _pronunciation;
  late List<String> _meanings;
  late LanguageType _type;

  String get theme => _theme;
  String get spelling => _spelling;
  String get pronunciation => _pronunciation;
  List<String> get meanings => _meanings;
  LanguageType get type => _type;

  WordTableCompanion toWordCompanion(String? updateTheme) {
    final themeValue = updateTheme != null ? Value(updateTheme) : Value(theme);

    return WordTableCompanion(
      theme: themeValue,
      spelling: Value(spelling),
      pronunciation: Value(pronunciation) ?? const Value(""),
      meanings: Value(meanings.join(',')),
      languageType: Value(type.toString()),
    );
  }

  // Word.fromJson(Map<String, dynamic> json) {
  //   print(json);
  //   LanguageType type = getLanguageTypeFromString(json['type'] as String);

  //   final theme = json['theme'] as String;
  //   final spelling = json['spelling'] as String;
  //   final pronunciation = json['pronunciation'] as String;
  //   final meanings = (json['meanings'] as String).split(',');
  // final type = getLanguageTypeFromString(json['type'] as String);

  // return Word(
  //   theme: theme,
  //   spelling: spelling,
  //   pronunciation: pronunciation,
  //   meanings: meanings,
  //   type: type,
  // );
  // }
}
