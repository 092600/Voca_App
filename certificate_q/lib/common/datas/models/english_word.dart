import 'package:certificate_q/common/datas/models/language_type.dart';
import 'package:certificate_q/common/datas/models/word.dart';

class EnglishWord extends Word {
  @override
  final String spelling;
  @override
  final String pronunciation;
  @override
  final List<String> meanings;

  late LanguageType _type;

  EnglishWord({
    required this.spelling,
    required this.pronunciation,
    required this.meanings,
  });

  @override
  LanguageType type = LanguageType.ENG;
}
