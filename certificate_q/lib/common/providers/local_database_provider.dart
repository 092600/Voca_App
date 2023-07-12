import 'package:certificate_q/common/data/model/word/type/language_type.dart';
import 'package:flutter/material.dart';

import '../data/database/drift_database.dart';
import '../data/model/language/language_model.dart';
import '../data/model/word/word.dart';

class LocalDatabaseProvider extends ChangeNotifier {
  late final LocalDatabase _localDatabase;

  LocalDatabase get localDatabase => _localDatabase;

  LocalDatabaseProvider(LocalDatabase db) {
    _localDatabase = db;
  }

  // 필요한 경우 상태를 업데이트하는 메서드를 추가할 수 있습니다.
  // 예를 들어, 데이터베이스에 새로운 단어를 추가하는 메서드:
  // void createNewWord(Word word) {
  //   localDatabase.createWords(word);

  //   // 상태가 변경되었음을 알리기 위해 notifyListeners()를 호출합니다.
  //   notifyListeners();
  // }

  Future<List<Word>> findWordsByLanguageType(LanguageType type) {
    return localDatabase.findWordsByLanguageType(type);
  }

  Future<Set<String>> findWordsThemeByLanguageType(LanguageType type) {
    return localDatabase.findWordsThemeByLanguageType(type: type);
  }

  Future<List<Word>> findWordsByLanguageTypeAndTheme({
    required LanguageType type,
    required String theme,
  }) {
    return localDatabase.findWordsByLanguageTypeAndTheme(
        theme: theme, type: type);
  }

  // void createLanguagies() {
  //   _localDatabase.createLanguagies(defaultLanguageModels);
  // }

  Future<List<LanguageModel>> findAllLanguagies() {
    return _localDatabase.findAllLanguagies();
  }
}
