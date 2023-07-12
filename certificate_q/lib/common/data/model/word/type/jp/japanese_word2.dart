import 'package:certificate_q/common/data/model/word/word_meaning.dart';

import '../../word2.dart';
import '../language_type.dart';

class JapaneseWord2 extends Word2 {
  @override
  final String theme;

  @override
  final String spelling;

  @override
  final String pronunciation;

  @override
  final List<WordMeaning> meanings;

  JapaneseWord2({
    required this.spelling,
    required this.pronunciation,
    required this.meanings,
    required this.theme,
  });

  @override
  final LanguageType type = LanguageType.JP;
}
