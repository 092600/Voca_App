import 'package:certificate_q/common/data/model/word/word_meaning.dart';

import 'type/language_type.dart';

abstract class Word2 {
  late String _theme;

  late LanguageType _type;

  late String _spelling;
  late String _pronunciation;

  late List<WordMeaning> _meanings;

  String get theme => _theme;

  LanguageType get type => _type;

  String get spelling => _spelling;
  String get pronunciation => _pronunciation;

  List<WordMeaning> get meanings => _meanings;

  // WordTableCompanion toWordCompanion(String? updateTheme) {
  //   final themeValue = updateTheme != null ? Value(updateTheme) : Value(theme);

  //   return WordTableCompanion(
  //     theme: themeValue,
  //     spelling: Value(spelling),
  //     pronunciation: Value(pronunciation) ?? const Value(""),
  //     meanings: Value(meanings.join(',')),
  //     languageType: Value(type.toString()),
  //   );
  // }

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
