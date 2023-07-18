import 'package:voca/common/data/model/word/type/eng/english_word.dart';
import 'package:voca/common/data/model/word/type/jp/japanese_word.dart';
import 'package:voca/common/data/model/word/word_meaning.dart';
import 'package:drift/drift.dart';

import '../../database/drift_database.dart';
import 'type/language_type.dart';

abstract class Word {
  late int _id;
  late String _theme;

  late LanguageType _type;

  late String _spelling;
  late String _pronunciation;

  late bool _isFavorite;

  late List<WordMeaning> _meanings;

  int get id => _id;
  String get theme => _theme;

  LanguageType get type => _type;

  String get spelling => _spelling;
  String get pronunciation => _pronunciation;

  bool get isFavorite => _isFavorite;

  List<WordMeaning> get meanings => _meanings;

  set isFavorite(bool updateBoolean) {
    isFavorite = !updateBoolean;
  }

  set meanings(List<WordMeaning> meanings) {
    _meanings = meanings;
  }

  Word();

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "theme": theme,
      "type": type.name,
      "spelling": spelling,
      "pronunciation": pronunciation,
      "isFavorite": isFavorite,
      "meanings": meanings.map((meaning) => meaning.toJson()).toList(),
    };
  }

  factory Word.fromJson(Map<String, dynamic> json) {
    final String wordType = json['type'] as String;

    if (wordType == LanguageType.JP.name) {
      return JapaneseWord.fromJson(json);
    } else if (wordType == LanguageType.ENG.name) {
      return EnglishWord.fromJson(json);
    }

    throw ArgumentError('Invalid language type: $wordType');
  }

  WordTableCompanion toWordCompanion() {
    // final themeValue = updateTheme != null ? Value(updateTheme) : Value(theme);

    return WordTableCompanion(
      id: Value(id),
      theme: Value(theme),
      spelling: Value(spelling),
      pronunciation: Value(pronunciation) ?? const Value(""),
      isFavorite: Value(isFavorite),
      meanings: Value(meanings.join(',')),
      languageType: Value(type.toString()),
    );
  }
}
