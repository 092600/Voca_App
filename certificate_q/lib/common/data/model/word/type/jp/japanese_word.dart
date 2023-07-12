import 'package:certificate_q/common/data/model/word/word_meaning.dart';

import '../../word.dart';
import '../language_type.dart';

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
  final List<WordMeaning> meanings;

  JapaneseWord({
    required this.id,
    required this.spelling,
    required this.pronunciation,
    required this.meanings,
    required this.theme,
  });

  @override
  final LanguageType type = LanguageType.JP;
}
