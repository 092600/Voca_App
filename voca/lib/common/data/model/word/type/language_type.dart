enum LanguageType {
  JP,
  ENG,
  ESP,
  FRA,
  KOR,
}

LanguageType getLanguageTypeFromString(String value) {
  switch (value) {
    case 'JP':
      return LanguageType.JP;
    case 'ENG':
      return LanguageType.ENG;
    case 'KOR':
      return LanguageType.KOR;
    case 'ESP':
      return LanguageType.ESP;
    case 'FRA':
      return LanguageType.FRA;

    default:
      throw ArgumentError('Invalid value: $value');
  }
}

String getFullName(String value) {
  switch (value) {
    case 'JP':
      return "Japanese";
    case 'ENG':
      return "English";
    case 'KOR':
      return "Korean";
    case 'ESP':
      return "Español";
    case 'FRA':
      return "Français";
    default:
      throw ArgumentError('Invalid value: $value');
  }
}

List<LanguageType> mapStringToLanguageType(List<String> languagesToJson) {
  List<LanguageType> result = [];

  for (String language in languagesToJson) {
    // 문자열을 LanguageType 값으로 변환하여 리스트에 추가합니다.
    result.add(getLanguageTypeFromString(language));
  }

  return result;
}
