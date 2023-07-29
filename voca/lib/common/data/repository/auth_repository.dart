import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:voca/common/const/default.dart';
import 'package:voca/common/data/model/account/account_status.dart';

import '../../const/api_uris.dart';
import '../model/account/account.dart';
import '../model/word/type/language_type.dart';
import '../utils/app_initializer.dart';

class AuthRepository {
  static const _storage = FlutterSecureStorage();
  static AppInitializer appInitializer = AppInitializer();

  static Future<Account> login({
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
        final refreshToken = response.data[REFRESH_TOKEN];

        Map<String, dynamic> claims = JwtDecoder.decode(accessToken);

        String status = claims["status"];

        String firstName = claims["firstName"];
        String lastName = claims["lastName"];
        String profilePath = claims["profilePath"];

        print("profilePath : $profilePath");

        Account account = Account(
          email: email,
          firstName: firstName,
          lastName: lastName,
          status: AccountStatus.getAccountStatusFromString(
            statusStr: status,
          ),
          password: "",
          profilePath: profilePath,
        );

        print("account.profilePath : ${account.profilePath}");

        if (account.status == AccountStatus.ACTIVE) {
          await appInitializer.appSetUp(
            account: account,
            languagiesToJson: claims["languagies"],
          );

          await _storage.write(key: ACCESS_TOKEN, value: accessToken); // 변경
        }

        return account;
      }
    } catch (e) {
      print(e);
    }

    return Account.getStatusNoneAccount();
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

  static Future<bool> registerAccount(Account account) async {
    Dio dio = Dio();

    try {
      final response = await dio.post(
        REGISTER_API_URI,
        data: {
          "email": account.email,
          "firstName": account.firstName,
          "lastName": account.lastName,
          "password": account.password,
        },
      );

      if (response.statusCode == 200) {
        return response.data["created"];
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  static Future<bool> prepareAccount({
    required Account account,
    required File? image,
    required List<LanguageType> selectedLanguagies,
  }) async {
    FormData formData;
    Dio dio = Dio();

    List<String> langs = selectedLanguagies.map((lang) => lang.name).toList();

    try {
      if (image != null) {
        formData = FormData.fromMap(
          {
            'email': account.email,
            'languagies': langs,
            'image': await MultipartFile.fromFile(image.path),
          },
        );
      } else {
        formData = FormData.fromMap(
          {
            'email': account.email,
            'languagies': langs,
          },
        );
      }

      // POST 요청 전송
      Response response = await dio.post(
        PREPARE_ACCOUNT_API,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      if (response.statusCode == 200) {
        return response.data["prepared"];
      }
    } catch (e) {
      print('Error: $e');
    }

    return false;
  }
}
