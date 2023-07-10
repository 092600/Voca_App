import 'package:certificate_q/common/datas/models/word.dart';

import 'language_type.dart';

class JapaneseWord extends Word {
  @override
  final String spelling;
  @override
  final String pronunciation;
  @override
  final List<String> meanings;

  late LanguageType _type;

  JapaneseWord({
    required this.spelling,
    required this.pronunciation,
    required this.meanings,
  });

  @override
  LanguageType type = LanguageType.JP;
}
