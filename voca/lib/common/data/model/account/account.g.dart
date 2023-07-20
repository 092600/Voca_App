// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      status: $enumDecode(_$AccountStatusEnumMap, json['status']),
      password: json['password'] as String,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'status': _$AccountStatusEnumMap[instance.status]!,
      'password': instance.password,
    };

const _$AccountStatusEnumMap = {
  AccountStatus.ACTIVE: 'ACTIVE',
  AccountStatus.NEED_PREPARE: 'NEED_PREPARE',
  AccountStatus.NONE: 'NONE',
};
