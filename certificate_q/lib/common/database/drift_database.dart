import 'dart:io';

import 'package:certificate_q/common/data/model/language/language_model.dart';
import 'package:certificate_q/common/data/model/word/language_type.dart';
import 'package:certificate_q/common/data/table/languagies_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../data/model/english_word.dart';
import '../data/model/word/japanese_word.dart';
import '../data/model/word/word.dart';
import '../data/table/word_table.dart';

import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    WordTable,
    LanguageTable,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  createWords(WordTableCompanion word) => into(wordTable).insert(word);
  createLanguage(LanguageTableCompanion languageTableCompanion) =>
      into(languageTable).insert(languageTableCompanion);

  Future<List<Word>> findAllWords() async {
    final wordTableDataList = await select(wordTable).get();

    return convertByWord(wordTableDataList);
  }

  void createLanguagies(List<LanguageModel> languagies) {
    for (LanguageModel language in languagies) {
      createLanguage(language.toLanguageCompanion());
    }
  }

  Future<List<LanguageModel>> findAllLanguagies() async {
    final languageDatas = await select(languageTable).get();

    List<LanguageModel> langs = languageDatas
        .map((lang) => LanguageModel(
              // id: lang.id,
              languageTitle: lang.languageTitle,
              languageType: getLanguageTypeFromString(lang.languageType),
              // createAt: lang.createdAt,
            ))
        .toList();

    return langs;
  }

  Future<List<Word>> findWordByTheme({
    required String theme,
  }) async {
    final wordTableDataList = await (select(wordTable)
          ..where((tbl) => tbl.theme.equals(theme)))
        .get();

    return convertByWord(wordTableDataList);
  }

  Future<List<Word>> findWordsByLanguageType(LanguageType type) async {
    final wordTableDataList = await (select(wordTable)
          ..where((tbl) => tbl.languageType.equals(type.toString())))
        .get();

    return convertByWord(wordTableDataList);
  }

  Future<Set<String>> findWordsThemeByLanguageType(
      {required LanguageType type}) async {
    final wordTableDataList = await (select(wordTable)
          ..where((tbl) => tbl.languageType.equals(type.toString())))
        .get();

    List<Word> words = convertByWord(wordTableDataList);

    Set<String> themeSet = {};

    for (var word in words) {
      themeSet.add(word.theme);
    }

    return themeSet;
  }

  Future<List<Word>> findWordsByLanguageTypeAndTheme({
    required LanguageType type,
    required String theme,
  }) async {
    final query = select(wordTable)
      ..where((tbl) =>
          tbl.theme.equals(theme) & tbl.languageType.equals(type.toString()));

    final wordTableDataList = await query.get().then((result) => result);

    return convertByWord(wordTableDataList);
  }

  delWords() {
    return delete(wordTable).go();
  }

  // App Schema Version : 테이블 변경 시 스키마 버전을 변경해주어야 함.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));

    return NativeDatabase(file);
  });
}

List<Word> convertByWord(List<WordTableData> words) {
  final wordList = words.map((wordTableData) {
    if (wordTableData.languageType == LanguageType.JP.toString()) {
      return JapaneseWord(
        spelling: wordTableData.spelling,
        pronunciation: wordTableData.pronunciation,
        meanings: wordTableData.meanings.split(','),
        theme: wordTableData.theme,
      );
    } else {
      return EnglishWord(
        spelling: wordTableData.spelling,
        pronunciation: wordTableData.pronunciation,
        meanings: wordTableData.meanings.split(','),
        theme: wordTableData.theme,
      );
    }
  }).toList();

  return wordList;
}
