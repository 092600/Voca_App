import 'package:certificate_q/common/data/model/word/type/language_type.dart';
import 'package:certificate_q/common/data/model/word/word_meaning.dart';

import '../../word.dart';

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
  final List<WordMeaning> meanings;

  EnglishWord({
    required this.id,
    required this.spelling,
    required this.pronunciation,
    required this.meanings,
    required this.theme,
  });

  @override
  final LanguageType type = LanguageType.ENG;
}
