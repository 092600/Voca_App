import 'package:dio/dio.dart';

import '../../const/api_uris.dart';

class LoginRepository {
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    print("$email, $password");

    Dio dio = Dio();

    final response = await dio.post(
      LOGIN_API_URI,
      data: {
        "email": email,
        "password": password,
      },
    );

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      // print(response.data);
      return true;
    }

    // print(response.data);
    return false;
  }
}

getResponseText({required int statusCode}) {}
