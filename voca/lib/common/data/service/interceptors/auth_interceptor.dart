import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voca/common/const/default.dart';

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  AuthInterceptor({
    required this.storage,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers[ACCESS_TOKEN] == 'need') {
      // ACCESS_TOKEN 삭제
      options.headers.remove(ACCESS_TOKEN);

      // 저장된 액세스 토큰을 변수에 저장
      final accessToken = await storage.read(key: ACCESS_TOKEN);

      // 요청 헤더에 Key : authorization, Value : 'Bearer $accessToken' 추가
      options.headers.addAll({
        'authorization': "Bearer $accessToken",
      });
    }
    print("AuthInterceptor AFTER");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print("onResponse : $response");

    // final Map<String, dynamic> wordsGroupByTheme = response.data;
    // final Map<String, List<Word>> result = {};

    // for (var theme in wordsGroupByTheme.keys) {
    //   // print("theme : ${wordsGroupByTheme[theme]}");
    //   List<dynamic> themeWords = wordsGroupByTheme[theme];
    //   List<Word> words = [];

    //   for (var wordData in themeWords) {
    //     String languageType = wordData["languageType"];
    //     Word word;
    //     if (languageType == "JP") {
    //       word = JapaneseWord(
    //           id: wordData["id"],
    //           theme: theme,
    //           spelling: wordData["spelling"],
    //           pronunciation: wordData["pronunciation"],
    //           meanings: (wordData["meanings"] as List<dynamic>).map((meaning) {
    //             return WordMeaning(
    //               id: meaning["id"],
    //               meaning: meaning["meaning"],
    //             );
    //           }).toList());
    //     } else {
    //       word = EnglishWord(
    //           id: wordData["id"],
    //           theme: theme,
    //           spelling: wordData["spelling"],
    //           pronunciation: wordData["pronunciation"],
    //           meanings: (wordData["meanings"] as List<dynamic>).map((meaning) {
    //             return WordMeaning(
    //               id: meaning["id"],
    //               meaning: meaning["meaning"],
    //             );
    //           }).toList());
    //     }

    //     words.add(word);
    //   }

    //   result[theme] = words;
    // }

    // // final customResponse =
    // //     Response(data: result, requestOptions: response.requestOptions);
    print("response: $response");

    super.onResponse(response, handler);
  }
}
