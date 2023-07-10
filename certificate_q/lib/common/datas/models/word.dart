import 'language_type.dart';

abstract class Word {
  late String _spelling;
  late String _pronunciation;
  late List<String> _meanings;

  late LanguageType _type;

  String get spelling => _spelling;
  String get pronunciation => _pronunciation;
  List<String> get meanings => _meanings;
  LanguageType get type => _type;
}
