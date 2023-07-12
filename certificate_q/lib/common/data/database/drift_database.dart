import 'dart:io';

import 'package:certificate_q/common/data/database/table/word_meaning_table.dart';
import 'package:certificate_q/common/data/database/table/word_table.dart';
import 'package:certificate_q/common/data/model/word/type/language_type.dart';
import 'package:certificate_q/common/data/model/word/word.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart' as p;

import '../model/word/type/eng/english_word.dart';
import '../model/word/type/jp/japanese_word.dart';
import '../model/word/word_meaning.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    WordTable,
    WordMeaningTable,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  saveWords(WordTableCompanion word) => into(wordTable).insert(word);
  saveWordMeaning(List<WordMeaning> meanings, Word word) {
    for (WordMeaning meaning in meanings) {
      into(wordMeaningTable).insert(meaning.toWordMeaningCompanion(word: word));
    }
  }

  Future<Set<String>> findWordsThemes() async {
    final words = await select(wordTable).get();

    return words
        .map((word) => "${word.languageType.split(".")[1]}/${word.theme}")
        .toSet();
  }

  Future<List<WordMeaning>> findAllWordMeanings() async {
    List<WordMeaningTableData> meanings = await select(wordMeaningTable).get();

    return meanings
        .map<WordMeaning>(
            (meaning) => WordMeaning(id: meaning.id, meaning: meaning.meaning))
        .toList();
  }

  Future<List<Word>> findAllWords() async {
    final List<WordTableData> wordTableDataList = await select(wordTable).get();

    List<Word> result = [];

    for (WordTableData data in wordTableDataList) {
      List<WordMeaning> meanings = await findWordMeaningByWordId(data.id);
      Word tmpWord = await convertByWord(data, meanings);

      result.add(tmpWord);
    }

    return result;
  }

  Future<Set<String>> findWordsThemeByLanguageType({
    required LanguageType type,
  }) async {
    final wordTableDataList = await (select(wordTable)
          ..where((tbl) => tbl.languageType.equals(type.toString())))
        .get();

    Set<String> themeSet = {};

    for (var word in wordTableDataList) {
      themeSet.add(word.theme);
    }

    return themeSet;
  }

  Future<List<WordMeaning>> findWordMeaningByWordId(int id) async {
    final meanings = await (select(wordMeaningTable)
          ..where((tbl) => tbl.wordTableId.equals(id)))
        .get();

    return convertByWordMeaning(meanings);
  }

  // * findWordsByLanguageTypeAndTheme()
  // *
  // * LanguageType & Theme 값으로 단어를 조회

  Future<List<Word>> findWordsByLanguageTypeAndTheme({
    required LanguageType type,
    required String theme,
    // required LocalDatabase db,
  }) async {
    List<Word> words = [];

    final query = select(wordTable)
      ..where((tbl) =>
          tbl.theme.equals(theme) & tbl.languageType.equals(type.toString()));

    final wordTableDataList = await query.get();

    for (WordTableData data in wordTableDataList) {
      List<WordMeaning> meanings = await findWordMeaningByWordId(data.id);
      Word word = await convertByWord(data, meanings);

      words.add(word);
    }

    return words;
  }

  delWords2() {
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

Future<Word> convertByWord(
  WordTableData word,
  List<WordMeaning> meanings,
  // LocalDatabase db,
) async {
  Word result;

  if (word.languageType == LanguageType.JP.toString()) {
    result = JapaneseWord(
      id: word.id,
      spelling: word.spelling,
      pronunciation: word.pronunciation,
      theme: word.theme,
      meanings: meanings,
    );
  } else {
    result = EnglishWord(
      id: word.id,
      spelling: word.spelling,
      pronunciation: word.pronunciation,
      theme: word.theme,
      meanings: meanings,
    );
  }

  return result;
}

List<WordMeaning> convertByWordMeaning(List<WordMeaningTableData> meanings) {
  return meanings
      .map<WordMeaning>(
          (meaning) => WordMeaning(id: meaning.id, meaning: meaning.meaning))
      .toList();
}
