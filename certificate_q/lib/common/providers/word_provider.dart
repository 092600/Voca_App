import 'package:certificate_q/common/datas/models/english_word.dart';

import '../datas/managing_datas.dart';
import '../datas/models/japanese_word.dart';
import 'package:flutter/foundation.dart';

import '../datas/models/word.dart';

class WordsProvider extends ChangeNotifier {
  final japaneseWords = [
    "assets/csv/japanese_words/N3_사람사귀기, 관계 유지하기.csv",
    "assets/csv/japanese_words/N3_이사하다.csv",
    "assets/csv/japanese_words/N3_인사하기와 안부묻기.csv",
  ];

  final englishWords = [
    "assets/csv/english_words/가장 많이 사용하는 영단어 1.csv",
    "assets/csv/english_words/가장 많이 사용하는 영단어 2.csv",
    "assets/csv/english_words/가장 많이 사용하는 영단어 3.csv",
  ];

  Map<String, Map<String, List<Word>>> words = {};

  void init() {
    words["japaneseWords"] = <String, List<JapaneseWord>>{};
    words["englishWords"] = <String, List<EnglishWord>>{};
  }

  // List<JapaneseWord> japaneseWords = [];

  void loadJapaneseWords() async {
    for (var jpWord in japaneseWords) {
      String themeTitle =
          jpWord.substring(jpWord.lastIndexOf("/") + 1).split(".csv")[0];

      words["japaneseWords"]?[themeTitle] =
          await readJapaneseWordCSV(themeTitle: themeTitle);
    }

    notifyListeners();
  }

  void loadEnglishWords() async {
    for (var engWord in englishWords) {
      String themeTitle =
          engWord.substring(engWord.lastIndexOf("/") + 1).split(".csv")[0];

      words["englishWords"]?[themeTitle] =
          await readEnglishWordCSV(themeTitle: themeTitle);
    }

    notifyListeners();
  }
}
