import 'package:certificate_q/common/data/model/word/language_type.dart';
import 'package:certificate_q/common/data/model/word/word.dart';

class EnglishWord extends Word {
  @override
  final String theme;

  @override
  final String spelling;

  @override
  final String pronunciation;

  @override
  final List<String> meanings;

  EnglishWord({
    required this.spelling,
    required this.pronunciation,
    required this.meanings,
    required this.theme,
  });

  @override
  final LanguageType type = LanguageType.ENG;
}
