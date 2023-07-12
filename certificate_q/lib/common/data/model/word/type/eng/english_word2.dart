import 'package:certificate_q/common/data/model/word/type/language_type.dart';
import 'package:certificate_q/common/data/model/word/word_meaning.dart';

import '../../word2.dart';

class EnglishWord2 extends Word2 {
  @override
  final String theme;

  @override
  final String spelling;

  @override
  final String pronunciation;

  @override
  final List<WordMeaning> meanings;

  EnglishWord2({
    required this.spelling,
    required this.pronunciation,
    required this.meanings,
    required this.theme,
  });

  @override
  final LanguageType type = LanguageType.ENG;
}
