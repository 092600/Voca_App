import 'package:json_annotation/json_annotation.dart';
import 'package:voca/common/data/model/word/type/language_type.dart';

import 'account_status.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String email;
  final String firstName;
  final String lastName;
  final AccountStatus status;
  final String password;
  List<LanguageType> languagies;
  String profilePath;

  Account({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.status,
    required this.password,
    List<LanguageType>? languagies,
    String? profilePath,
  })  : languagies = languagies ?? [],
        profilePath = profilePath ?? "";

  static Account getStatusNoneAccount() {
    return Account(
      email: "",
      firstName: "",
      lastName: "",
      status: AccountStatus.NONE,
      password: "",
    );
  }

  String getFullName() {
    return "$firstName $lastName";
  }

  static bool isEmailValid(String value) {
    // 이메일 형식을 검증하는 정규식
    final RegExp pattern =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z\d-]+\.)+[a-zA-Z\d]{2,}$');

    return pattern.hasMatch(value);
  }

  static bool isPasswordValid(String password) {
    // 영문 대소문자, 숫자, 특수문자(.!@#$%)를 포함하는 정규식
    final RegExp pattern = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[.!@#\$%])[a-zA-Z\d.!@#\$%]{8,20}$');

    return pattern.hasMatch(password);
  }

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
