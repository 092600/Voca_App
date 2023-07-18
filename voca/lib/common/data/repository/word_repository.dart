import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voca/common/const/default.dart';
import 'package:voca/common/data/model/word/type/language_type.dart';
import 'package:dio/dio.dart';

import '../../const/api_uris.dart';
import '../model/word/type/eng/english_word.dart';
import '../model/word/type/jp/japanese_word.dart';
import '../model/word/word.dart';
import '../model/word/word_meaning.dart';

class WordRepository {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<Map<String, List<Word>>> getWordsByLanguageTypeGroupByTheme(
      LanguageType type) async {
    Dio dio = Dio();

    const FlutterSecureStorage storage = FlutterSecureStorage();
    final accessToken = await storage.read(key: ACCESS_TOKEN);

    final response = await dio.get(
      '$SERVER_IP/api/v1/voca/theme',
      options: Options(
        headers: {
          "authorization": "Bearer $accessToken",
        },
      ),
      queryParameters: {
        "type": type.name,
      },
    );

    final Map<String, dynamic> wordsGroupByTheme = response.data;
    final Map<String, List<Word>> result = {};

    for (var theme in wordsGroupByTheme.keys) {
      // print("theme : ${wordsGroupByTheme[theme]}");
      List<dynamic> themeWords = wordsGroupByTheme[theme];
      List<Word> words = [];

      for (var wordData in themeWords) {
        String languageType = wordData["languageType"];
        Word word;
        if (languageType == "JP") {
          word = JapaneseWord(
              id: wordData["id"],
              theme: theme,
              spelling: wordData["spelling"],
              pronunciation: wordData["pronunciation"],
              isFavorite: false,
              meanings: (wordData["meanings"] as List<dynamic>).map((meaning) {
                return WordMeaning(
                  id: meaning["id"],
                  meaning: meaning["meaning"],
                );
              }).toList());
          // JapaneseWord 객체 활용
        } else {
          word = EnglishWord(
              id: wordData["id"],
              theme: theme,
              spelling: wordData["spelling"],
              pronunciation: wordData["pronunciation"],
              isFavorite: false,
              meanings: (wordData["meanings"] as List<dynamic>).map((meaning) {
                return WordMeaning(
                  id: meaning["id"],
                  meaning: meaning["meaning"],
                );
              }).toList());
        }

        words.add(word);
      }

      result[theme] = words;
    }

    return result;
  }
}
