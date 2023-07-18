import 'package:json_annotation/json_annotation.dart';
import 'package:voca/common/data/model/word/type/language_type.dart';
import 'package:voca/common/data/model/word/word_meaning.dart';

import '../../word.dart';

part 'english_word.g.dart';

@JsonSerializable()
class EnglishWord extends Word {
  @override
  final int id;

  @override
  final String theme;

  @override
  final String spelling;

  @override
  final String pronunciation;

  @override
  bool isFavorite;

  @override
  final List<WordMeaning> meanings;

  EnglishWord({
    required this.id,
    required this.spelling,
    required this.pronunciation,
    required this.meanings,
    required this.theme,
    required this.isFavorite,
  });

  @override
  final LanguageType type = LanguageType.ENG;

  factory EnglishWord.fromJson(Map<String, dynamic> json) =>
      _$EnglishWordFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EnglishWordToJson(this);
}
