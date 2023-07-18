import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voca/common/const/default.dart';

import '../../const/api_uris.dart';
import '../utils/app_initializer.dart';

class AuthRepository {
  static const _storage = FlutterSecureStorage();
  static AppInitializer appInitializer = AppInitializer();

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    Dio dio = Dio();

    try {
      final response = await dio.post(
        LOGIN_API_URI,
        data: {
          "email": email,
          "password": password,
        },
      );

      final statusCode = response.statusCode;

      if (statusCode == 200) {
        final accessToken = response.data[ACCESS_TOKEN];
        // final refreshToken = response.data[REFRESH_TOKEN];

        appInitializer.appSetUp(
          accessToken: accessToken,
        );

        await _storage.write(key: ACCESS_TOKEN, value: accessToken); // 변경

        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
