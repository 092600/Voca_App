enum LanguageType { JP, ENG }

LanguageType getLanguageTypeFromString(String value) {
  switch (value) {
    case 'JP':
      return LanguageType.JP;
    case 'ENG':
      return LanguageType.ENG;
    default:
      throw ArgumentError('Invalid value: $value');
  }
}
