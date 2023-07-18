import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:voca/common/const/default.dart';

class AppInitializer {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> appSetUp({
    required String accessToken,
  }) async {
    setDefaultVocaGoal();
    setUser(accessToken: accessToken);
  }

  Future<void> setDefaultVocaGoal() async {
    await storage.write(key: USER_GOAL, value: "40");
  }

  setUser({
    required String accessToken,
  }) async {
    Map<String, dynamic> Jwt = JwtDecoder.decode(accessToken);

    await storage.write(key: STORAGE_USER_NAME, value: Jwt["username"]);
    await storage.write(key: STORAGE_USER_EMAIL, value: Jwt["sub"]);
  }
}
