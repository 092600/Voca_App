import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voca/common/const/default.dart';
import 'package:voca/common/data/model/account/account.dart';

import '../data/model/goal/goal.dart';

class SecurityStorageProvider extends ChangeNotifier {
  late final FlutterSecureStorage _storage;

  SecurityStorageProvider(FlutterSecureStorage storage) {
    _storage = storage;
  }

  FlutterSecureStorage get storage => _storage;

  static final now = DateTime.now();
  static final String today = "${now.year}/${now.month}/${now.day}";

  Future<void> addTestCorrectWordCnt() async {
    String correctCnt = await storage.read(key: today) ?? "0";
    String? goal = await storage.read(key: USER_GOAL);

    await storage.write(key: today, value: "${int.parse(correctCnt) + 1}");
  }

  Future<Goal> getTodaysGoal() async {
    final currentCnt = await storage.read(key: today);
    final userSetGoal = await storage.read(key: USER_GOAL);

    if (currentCnt == null) {
      await storage.write(key: today, value: "0");
    }

    String? todayGoal = await storage.read(key: "$today/$USER_GOAL");

    if (todayGoal != userSetGoal) {
      await storage.write(key: "$today/$USER_GOAL", value: userSetGoal);
    }

    return Goal(
      day: today,
      dayName: getWeekDayName(now.weekday),
      correctCnt: currentCnt!,
      todaysGoal: userSetGoal!,
    );
  }

  Future<String> getGoalOfDay(String date) async {
    String? goal = await storage.read(key: "$date/$USER_GOAL");

    return goal ?? "40";
  }

  Future<List<Goal>> get1WeekGoals() async {
    return await getPastDates();
  }

  Future<List<Goal>> getPastDates() async {
    List<Goal> goals = [];

    // 현재 날짜를 가져옵니다.

    // 현재 날짜부터 -6일까지의 날짜를 리스트에 추가합니다.
    for (int i = 1; i <= 5; i++) {
      DateTime pastDate = now.subtract(Duration(days: i));
      String pastDay = "${pastDate.year}/${pastDate.month}/${pastDate.day}";

      final pastCnt = await storage.read(key: pastDay) ?? "0";
      final pastGoal = await getGoalOfDay(pastDay);
      final dayName = getWeekDayName(pastDate.weekday);

      goals.add(
        Goal(
          day: pastDay,
          dayName: dayName,
          correctCnt: pastCnt,
          todaysGoal: pastGoal,
        ),
      );
    }

    return goals.reversed.toList();
  }

  getWeekDayName(int day) {
    String weekdayName;
    switch (day) {
      case 1:
        weekdayName = "월";
        return weekdayName;
      case 2:
        weekdayName = "화";
        return weekdayName;
      case 3:
        weekdayName = "수";
        return weekdayName;
      case 4:
        weekdayName = "목";
        return weekdayName;
      case 5:
        weekdayName = "금";
        return weekdayName;
      case 6:
        weekdayName = "토";
        return weekdayName;
      case 7:
        weekdayName = "일";
        return weekdayName;
    }
  }

  Future<String?> getCurrentSetVocaGoal() async {
    return await storage.read(key: USER_GOAL);
  }

  Future<void> setVocaGoal({
    required String goal,
  }) async {
    await storage.write(key: USER_GOAL, value: goal);
  }

  Future<String?> getUsername() async {
    return await storage.read(key: STORAGE_USER_NAME);
  }

  Future<String?> getUserEmail() async {
    return await storage.read(key: STORAGE_USER_EMAIL);
  }

  Future<Account> getAccount() async {
    String? email = await getUserEmail();
    String? username = await getUsername();

    return Account(email: email!, username: username!, password: "");
  }
}