import 'package:dio/dio.dart';
import 'package:retrofit/http.dart' as retrofit;

import '../../../const/api_uris.dart';
import '../../../const/default.dart';
import '../../model/word/word.dart';

part 'voca_service.g.dart';

@retrofit.RestApi(baseUrl: "$SERVER_IP/api/v1/voca")
abstract class WordService {
  factory WordService(Dio dio, {String baseUrl}) = _WordService;

  @retrofit.Headers({
    ACCESS_TOKEN: 'need',
  })
  @retrofit.GET('/theme')
  Future<Map<String, List<Word>>> getWordsByLanguageTypeGroupByTheme(
    @retrofit.Query("type") String type,
  );
}
