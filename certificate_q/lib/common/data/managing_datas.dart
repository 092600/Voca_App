import 'dart:math';

import 'package:certificate_q/common/data/model/english_word.dart';
import 'package:certificate_q/common/data/model/word/word.dart';
import 'package:certificate_q/common/data/sample_word.dart';
import 'package:certificate_q/common/database/drift_database.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'model/word/japanese_word.dart';

void insertSampleWordsIntoDB(LocalDatabase db) async {
  for (var sampleJPWordFile in sampleJPWordFiles) {
    String theme = sampleJPWordFile
        .substring(sampleJPWordFile.lastIndexOf("/") + 1)
        .split(".csv")[0];

    List<JapaneseWord> jpWords =
        await readJapaneseWordCSV(fileLocation: sampleJPWordFile, theme: theme);

    for (Word jpWord in jpWords) {
      db.createWords(jpWord.toWordCompanion(theme));
    }
  }

  for (var sampleENGWordFile in sampleENGWordFiles) {
    String theme = sampleENGWordFile
        .substring(sampleENGWordFile.lastIndexOf("/") + 1)
        .split(".csv")[0];

    List<EnglishWord> engWords =
        await readEnglishWordCSV(fileLocation: sampleENGWordFile, theme: theme);

    for (Word engWord in engWords) {
      db.createWords(engWord.toWordCompanion(theme));
    }
  }
}

Future<List<JapaneseWord>> readJapaneseWordCSV({
  required String fileLocation,
  required String theme,
}) async {
  // CSV 파일을 로드합니다.
  String file = await rootBundle.loadString(fileLocation);

  List<List<dynamic>> words =
      const CsvToListConverter().convert(file, eol: "\n");

  List<JapaneseWord> japaneseWords = [];

  for (var row in words) {
    String kanji = row[0];
    String yomikata = row[1];

    List<String> meanings =
        (row[2] as String).split(',').map((meaning) => meaning.trim()).toList();

    JapaneseWord japaneseWord = JapaneseWord(
      spelling: kanji,
      pronunciation: yomikata,
      meanings: meanings,
      theme: theme,
    );

    japaneseWords.add(japaneseWord);
  }

  return japaneseWords;
}

Future<List<EnglishWord>> readEnglishWordCSV({
  required String fileLocation,
  required String theme,
}) async {
  // CSV 파일을 로드합니다.
  String file = await rootBundle.loadString(fileLocation);

  List<List<dynamic>> words =
      const CsvToListConverter().convert(file, eol: "\n");

  List<EnglishWord> englishWords = [];

  for (var row in words) {
    String spelling = row[0];
    String pronunciation = row[1];

    List<String> meanings =
        (row[2] as String).split(',').map((meaning) => meaning.trim()).toList();

    EnglishWord englishWord = EnglishWord(
      spelling: spelling,
      pronunciation: pronunciation,
      meanings: meanings,
      theme: theme,
    );

    englishWords.add(englishWord);
  }

  return englishWords;
}

List<Word> setShuffling(Set<Word> words) {
  List<Word> randomizedAnswers = words.toList();
  randomizedAnswers.shuffle(Random());

  return randomizedAnswers;
}
