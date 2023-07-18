import 'package:json_annotation/json_annotation.dart';
import 'package:voca/common/data/model/word/word_meaning.dart';

import '../../word.dart';
import '../language_type.dart';

part 'japanese_word.g.dart';

@JsonSerializable()
class JapaneseWord extends Word {
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

  JapaneseWord({
    required this.id,
    required this.spelling,
    required this.pronunciation,
    required this.meanings,
    required this.theme,
    required this.isFavorite,
  });

  @override
  final LanguageType type = LanguageType.JP;

  factory JapaneseWord.fromJson(Map<String, dynamic> json) =>
      _$JapaneseWordFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$JapaneseWordToJson(this);
}
