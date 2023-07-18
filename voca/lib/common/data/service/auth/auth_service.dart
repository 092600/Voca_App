import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voca/common/data/model/account/account.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../const/api_uris.dart';
import '../../../const/default.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: "$SERVER_IP/api/v1/auth")
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("/authenticate")
  Future<dynamic> login(@Body() Account account);
}

Future<bool> isLogined({required Response response}) async {
  final statusCode = response.statusCode;
  try {
    if (statusCode == 200) {
      final accessToken = response.data[ACCESS_TOKEN];
      // final refreshToken = response.data[REFRESH_TOKEN];

      print(accessToken);

      var storage = const FlutterSecureStorage();
      await storage.write(key: ACCESS_TOKEN, value: accessToken); // 변경
      // await _storage.write(key: REFRESH_TOKEN, value: refreshToken); // 변경

      return true;
    }

    return false;
  } catch (e) {
    return false;
  }
}
