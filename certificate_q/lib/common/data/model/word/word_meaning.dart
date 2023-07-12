class WordMeaning {
  final int id;
  final String meaning;

  WordMeaning({
    required this.id,
    required this.meaning,
  });

  factory WordMeaning.fromJson(Map<String, dynamic> json) {
    return WordMeaning(
      id: json['id'] as int,
      meaning: json['meaning'] as String,
    );
  }
}
