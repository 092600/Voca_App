import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voca/common/const/default.dart';

import '../../const/api_uris.dart';
import '../model/account/account.dart';
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

  static Future<bool> dupulicateEmail({
    required String email,
  }) async {
    Dio dio = Dio();

    try {
      final response = await dio.get(
        DUPULICATE_EMAIL,
        queryParameters: {
          "email": email,
        },
      );

      if (response.statusCode == 200) {
        print("200 : ${response.data}");
        return response.data;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  static Future<void> registerAccount(Account account) async {
    Dio dio = Dio();

    print(
        "${account.email}, ${account.firstName}, ${account.lastName}, ${account.password}");
    // try {
    //   final response = dio.post(
    //     REGISTER_API_URI,
    //   );
    // } catch (e) {
    //   print(e);
    // }
  }
}
