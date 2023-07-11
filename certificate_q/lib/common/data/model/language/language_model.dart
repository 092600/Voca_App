import 'package:certificate_q/common/data/model/word/language_type.dart';
import 'package:certificate_q/common/database/drift_database.dart';
import 'package:drift/drift.dart';

class LanguageModel {
  // final int id;

  final String languageTitle;
  final LanguageType languageType;
  // final DateTime createAt;

  LanguageModel({
    // required this.id,
    required this.languageTitle,
    required this.languageType,
    // required this.createAt,
  });

  LanguageTableCompanion toLanguageCompanion() {
    // final themeValue = updateTheme != null ? Value(updateTheme) : Value(theme);

    return LanguageTableCompanion(
      // id: Value(id),
      languageTitle: Value(languageTitle),
      languageType: Value(languageType.name),
      // createdAt: Value(createAt),
    );
  }
}
