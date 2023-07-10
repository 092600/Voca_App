import 'package:certificate_q/common/data/model/word/word.dart';

import 'language_type.dart';

class JapaneseWord extends Word {
  @override
  final String theme;

  @override
  final String spelling;

  @override
  final String pronunciation;

  @override
  final List<String> meanings;

  JapaneseWord({
    required this.spelling,
    required this.pronunciation,
    required this.meanings,
    required this.theme,
  });

  @override
  final LanguageType type = LanguageType.JP;
}
