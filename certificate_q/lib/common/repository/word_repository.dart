import 'package:certificate_q/common/data/model/word/type/language_type.dart';
import 'package:dio/dio.dart';

import '../const/default.dart';
import '../data/model/word/word2.dart';

class WordRepository {
  static Future<List<Word2>> getWordsByLanguageTypeGroupByTheme(
      LanguageType type) async {
    Dio dio = Dio();

    final response = await dio.get(
      '$SERVER_IP/api/v1/theme',
      // options: Options(
      //   headers: {
      //     "Authorization": accessToken,
      //   },
      // ),
      queryParameters: {
        "type": type.name,
      },
    );

    final Map<String, dynamic> wordsGroupByTheme = response.data;

    // print(wordsGroupByTheme);

    wordsGroupByTheme.keys.map(
      (theme) {
        return wordsGroupByTheme[theme].map((word) {
          print(word);
          if (word["languageType"] == "JP") {
            // JapaneseWord2(
            //   theme: word["theme"],
            //   spelling: word["spelling"],
            //   pronunciation: word["pronunciation"],
            //   meanings: (word["meanings"] as List).map((meaning) {
            //     return WordMeaning(
            //       id: meaning["id"],
            //       meaning: meaning["meaning"],
            //     );
            //   }).toList(),
            // );
            print("JP : $word");
          } else {
            // EnglishWord2(
            //   theme: word["theme"],
            //   spelling: word["spelling"],
            //   pronunciation: word["pronunciation"],
            //   meanings: (word["meanings"] as List).map<WordMeaning>((meaning) {
            //     return WordMeaning(
            //       id: meaning["id"],
            //       meaning: meaning["meaning"],
            //     );
            //   }).toList(),
            // );
            print("ENG : $word");
          }
        }).toList();
      },
    ).toList();

    // response.data.keys.map((theme) {
    //   List<Word2> words = response.data[theme].map((word) {
    //     if (word["languageType"] == "JP") {
    //       return JapaneseWord2(
    //         theme: word["theme"],
    //         spelling: word["spelling"],
    //         pronunciation: word["pronunciation"],
    //         meanings: (word["meanings"] as Map)
    //             .values
    //             .toList()
    //             .map<WordMeaning>((meaning) {
    //           return WordMeaning(
    //             id: meaning["id"],
    //             meaning: meaning["meaning"],
    //           );
    //         }).toList(),
    //       );
    //     } else {
    //       return EnglishWord2(
    //         theme: word["theme"],
    //         spelling: word["spelling"],
    //         pronunciation: word["pronunciation"],
    //         meanings:
    //             (word["meanings"] as Iterable).map<WordMeaning>((meaning) {
    //           return WordMeaning(
    //             id: meaning["id"],
    //             meaning: meaning["meaning"],
    //           );
    //         }).toList(),
    //       );
    //     }
    //   }).toList();

    //   return MapEntry(theme, words);
    // });

    // print(result);

    // result.keys.map((theme) {
    // print(words);
    // return result[theme].map((word) {
    //   print(word);

    //   if (word["languageType"] == "JP") {
    //     return JapaneseWord2(
    //       theme: word["theme"],
    //       spelling: word["spelling"],
    //       pronunciation: word["pronunciation"],
    //       meanings: (word["meanings"] as List).map<WordMeaning>((meaning) {
    //         return WordMeaning(
    //           id: meaning["id"],
    //           meaning: meaning["meaning"],
    //         );
    //       }).toList(),
    //     );
    //   } else {
    //     return EnglishWord2(
    //       theme: word["theme"],
    //       spelling: word["spelling"],
    //       pronunciation: word["pronunciation"],
    //       meanings: (word["meanings"] as List).map<WordMeaning>((meaning) {
    //         return WordMeaning(
    //           id: meaning["id"],
    //           meaning: meaning["meaning"],
    //         );
    //       }).toList(),
    //     );
    //   }
    // }).toList();
    // });

    // print("AFTER");

    // final List<Word2> result = List<Word2>.from((response.data).map((word) {
    //   if (word["languageType"] == "JP") {
    //     return JapaneseWord2(
    //       theme: word["theme"],
    //       spelling: word["spelling"],
    //       pronunciation: word["pronunciation"],
    //       meanings: word["meanings"].map<WordMeaning>((meaning) {
    //         return WordMeaning(
    //           id: meaning["id"],
    //           meaning: meaning["meaning"],
    //         );
    //       }).toList(),
    //     );
    //   } else {
    //     return EnglishWord2(
    //       theme: word["theme"],
    //       spelling: word["spelling"],
    //       pronunciation: word["pronunciation"],
    //       meanings: word["meanings"].map<WordMeaning>((meaning) {
    //         return WordMeaning(
    //           id: meaning["id"],
    //           meaning: meaning["meaning"],
    //         );
    //       }).toList(),
    //     );
    //   }
    // }));

    // print(result);

    return [];
  }
}
