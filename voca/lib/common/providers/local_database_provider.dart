import 'package:voca/common/data/model/word/type/language_type.dart';
import 'package:flutter/material.dart';

import '../data/database/drift_database.dart';
import '../data/model/word/word.dart';

class LocalDatabaseProvider extends ChangeNotifier {
  late final LocalDatabase _localDatabase;

  LocalDatabase get localDatabase => _localDatabase;

  LocalDatabaseProvider(LocalDatabase db) {
    _localDatabase = db;
  }

  saveWords({required List<Word> words}) {
    for (Word word in words) {
      localDatabase.saveWords(word.toWordCompanion());
      localDatabase.saveWordMeaning(word.meanings, word);
    }
  }

  Future<void> removeTheme({
    required LanguageType language,
    required String theme,
  }) async {
    await localDatabase.deleteWordTheme(theme: theme);
  }

  Future<Map<LanguageType, Map<String, List<Word>>>> getMapOfWords(
      List<LanguageType> languagies) async {
    return await localDatabase.getMapOfWords(languagies);
  }

  Future<Set<String>> findWordsThemes() async {
    return await localDatabase.findWordsThemes();
  }

  Future<Set<String>> findWordThemesByLanguageType({
    required LanguageType type,
  }) async {
    return await localDatabase.findWordsThemeByLanguageType(
      type: type,
    );
  }

  Future<List<Word>> findWordsByLanguageTypeAndTheme({
    required LanguageType type,
    required String theme,
  }) {
    return localDatabase.findWordsByLanguageTypeAndTheme(
      theme: theme,
      type: type,
    );
  }

  Future<void> addFavorite(Word word, bool updateBoolean) async {
    print("${word.isFavorite}, $updateBoolean");
    await localDatabase.addFavorite(word, updateBoolean);
  }

  // void createLanguagies() {
  //   _localDatabase.createLanguagies(defaultLanguageModels);
  // }
}
