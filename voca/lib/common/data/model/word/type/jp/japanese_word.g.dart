// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'japanese_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JapaneseWord _$JapaneseWordFromJson(Map<String, dynamic> json) => JapaneseWord(
      id: json['id'] as int,
      spelling: json['spelling'] as String,
      pronunciation: json['pronunciation'] as String,
      meanings: (json['meanings'] as List<dynamic>)
          .map((e) => WordMeaning.fromJson(e as Map<String, dynamic>))
          .toList(),
      theme: json['theme'] as String,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$JapaneseWordToJson(JapaneseWord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'theme': instance.theme,
      'spelling': instance.spelling,
      'pronunciation': instance.pronunciation,
      'isFavorite': instance.isFavorite,
      'meanings': instance.meanings,
    };
