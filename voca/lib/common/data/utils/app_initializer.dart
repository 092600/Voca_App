import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voca/common/const/default.dart';

import '../model/account/account.dart';

class AppInitializer {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> appSetUp({
    required Account account,
    required languagiesToJson,
  }) async {
    setDefaultVocaGoal();
    setUser(
      account: account,
      languagiesToJson: languagiesToJson,
    );
  }

  Future<void> setDefaultVocaGoal() async {
    await storage.write(key: USER_GOAL, value: "40");
  }

  setUser({
    required Account account,
    required String languagiesToJson,
  }) async {
    await storage.write(key: STORAGE_USER_FIRST_NAME, value: account.firstName);
    await storage.write(key: STORAGE_USER_LAST_NAME, value: account.lastName);
    await storage.write(key: STORAGE_USER_EMAIL, value: account.email);
    await storage.write(key: STORAGE_USER_LANGUAGIES, value: languagiesToJson);
    await storage.write(
      key: STORAGE_USER_PROFILE_PATH,
      value: account.profilePath,
    );
  }
}
