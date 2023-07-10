import 'package:drift/drift.dart';

import '../../../database/drift_database.dart';
import 'language_type.dart';

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

  // Word({
  //   required String spelling,
  //   required String pronunciation,
  //   required List<String> meanings,
  //   required LanguageType type,
  // }) {
  //   _spelling = spelling;
  //   _pronunciation = pronunciation;
  //   _meanings = meanings;
  //   _type = type;
  // }

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
}
