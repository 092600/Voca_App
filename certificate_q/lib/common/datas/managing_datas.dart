import 'dart:math';

import 'package:certificate_q/common/datas/models/english_word.dart';
import 'package:certificate_q/common/datas/models/word.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'models/japanese_word.dart';

Future<List<JapaneseWord>> readJapaneseWordCSV({
  required String themeTitle,
}) async {
  // CSV 파일을 로드합니다.
  String file =
      await rootBundle.loadString('assets/csv/japanese_words/$themeTitle.csv');

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
    );

    japaneseWords.add(japaneseWord);
  }

  return japaneseWords;
}

Future<List<EnglishWord>> readEnglishWordCSV({
  required String themeTitle,
}) async {
  // CSV 파일을 로드합니다.
  String file =
      await rootBundle.loadString('assets/csv/english_words/$themeTitle.csv');

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
