// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $WordTableTable extends WordTable
    with TableInfo<$WordTableTable, WordTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _languageTypeMeta =
      const VerificationMeta('languageType');
  @override
  late final GeneratedColumn<String> languageType = GeneratedColumn<String>(
      'language_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
      'theme', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _spellingMeta =
      const VerificationMeta('spelling');
  @override
  late final GeneratedColumn<String> spelling = GeneratedColumn<String>(
      'spelling', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pronunciationMeta =
      const VerificationMeta('pronunciation');
  @override
  late final GeneratedColumn<String> pronunciation = GeneratedColumn<String>(
      'pronunciation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _meaningsMeta =
      const VerificationMeta('meanings');
  @override
  late final GeneratedColumn<String> meanings = GeneratedColumn<String>(
      'meanings', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns =>
      [id, languageType, theme, spelling, pronunciation, meanings, createdAt];
  @override
  String get aliasedName => _alias ?? 'word_table';
  @override
  String get actualTableName => 'word_table';
  @override
  VerificationContext validateIntegrity(Insertable<WordTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language_type')) {
      context.handle(
          _languageTypeMeta,
          languageType.isAcceptableOrUnknown(
              data['language_type']!, _languageTypeMeta));
    } else if (isInserting) {
      context.missing(_languageTypeMeta);
    }
    if (data.containsKey('theme')) {
      context.handle(
          _themeMeta, theme.isAcceptableOrUnknown(data['theme']!, _themeMeta));
    } else if (isInserting) {
      context.missing(_themeMeta);
    }
    if (data.containsKey('spelling')) {
      context.handle(_spellingMeta,
          spelling.isAcceptableOrUnknown(data['spelling']!, _spellingMeta));
    } else if (isInserting) {
      context.missing(_spellingMeta);
    }
    if (data.containsKey('pronunciation')) {
      context.handle(
          _pronunciationMeta,
          pronunciation.isAcceptableOrUnknown(
              data['pronunciation']!, _pronunciationMeta));
    } else if (isInserting) {
      context.missing(_pronunciationMeta);
    }
    if (data.containsKey('meanings')) {
      context.handle(_meaningsMeta,
          meanings.isAcceptableOrUnknown(data['meanings']!, _meaningsMeta));
    } else if (isInserting) {
      context.missing(_meaningsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      languageType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language_type'])!,
      theme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme'])!,
      spelling: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}spelling'])!,
      pronunciation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pronunciation'])!,
      meanings: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meanings'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $WordTableTable createAlias(String alias) {
    return $WordTableTable(attachedDatabase, alias);
  }
}

class WordTableData extends DataClass implements Insertable<WordTableData> {
  final int id;
  final String languageType;
  final String theme;
  final String spelling;
  final String pronunciation;
  final String meanings;
  final DateTime createdAt;
  const WordTableData(
      {required this.id,
      required this.languageType,
      required this.theme,
      required this.spelling,
      required this.pronunciation,
      required this.meanings,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['language_type'] = Variable<String>(languageType);
    map['theme'] = Variable<String>(theme);
    map['spelling'] = Variable<String>(spelling);
    map['pronunciation'] = Variable<String>(pronunciation);
    map['meanings'] = Variable<String>(meanings);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WordTableCompanion toCompanion(bool nullToAbsent) {
    return WordTableCompanion(
      id: Value(id),
      languageType: Value(languageType),
      theme: Value(theme),
      spelling: Value(spelling),
      pronunciation: Value(pronunciation),
      meanings: Value(meanings),
      createdAt: Value(createdAt),
    );
  }

  factory WordTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordTableData(
      id: serializer.fromJson<int>(json['id']),
      languageType: serializer.fromJson<String>(json['languageType']),
      theme: serializer.fromJson<String>(json['theme']),
      spelling: serializer.fromJson<String>(json['spelling']),
      pronunciation: serializer.fromJson<String>(json['pronunciation']),
      meanings: serializer.fromJson<String>(json['meanings']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'languageType': serializer.toJson<String>(languageType),
      'theme': serializer.toJson<String>(theme),
      'spelling': serializer.toJson<String>(spelling),
      'pronunciation': serializer.toJson<String>(pronunciation),
      'meanings': serializer.toJson<String>(meanings),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  WordTableData copyWith(
          {int? id,
          String? languageType,
          String? theme,
          String? spelling,
          String? pronunciation,
          String? meanings,
          DateTime? createdAt}) =>
      WordTableData(
        id: id ?? this.id,
        languageType: languageType ?? this.languageType,
        theme: theme ?? this.theme,
        spelling: spelling ?? this.spelling,
        pronunciation: pronunciation ?? this.pronunciation,
        meanings: meanings ?? this.meanings,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('WordTableData(')
          ..write('id: $id, ')
          ..write('languageType: $languageType, ')
          ..write('theme: $theme, ')
          ..write('spelling: $spelling, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('meanings: $meanings, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, languageType, theme, spelling, pronunciation, meanings, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordTableData &&
          other.id == this.id &&
          other.languageType == this.languageType &&
          other.theme == this.theme &&
          other.spelling == this.spelling &&
          other.pronunciation == this.pronunciation &&
          other.meanings == this.meanings &&
          other.createdAt == this.createdAt);
}

class WordTableCompanion extends UpdateCompanion<WordTableData> {
  final Value<int> id;
  final Value<String> languageType;
  final Value<String> theme;
  final Value<String> spelling;
  final Value<String> pronunciation;
  final Value<String> meanings;
  final Value<DateTime> createdAt;
  const WordTableCompanion({
    this.id = const Value.absent(),
    this.languageType = const Value.absent(),
    this.theme = const Value.absent(),
    this.spelling = const Value.absent(),
    this.pronunciation = const Value.absent(),
    this.meanings = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  WordTableCompanion.insert({
    this.id = const Value.absent(),
    required String languageType,
    required String theme,
    required String spelling,
    required String pronunciation,
    required String meanings,
    this.createdAt = const Value.absent(),
  })  : languageType = Value(languageType),
        theme = Value(theme),
        spelling = Value(spelling),
        pronunciation = Value(pronunciation),
        meanings = Value(meanings);
  static Insertable<WordTableData> custom({
    Expression<int>? id,
    Expression<String>? languageType,
    Expression<String>? theme,
    Expression<String>? spelling,
    Expression<String>? pronunciation,
    Expression<String>? meanings,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageType != null) 'language_type': languageType,
      if (theme != null) 'theme': theme,
      if (spelling != null) 'spelling': spelling,
      if (pronunciation != null) 'pronunciation': pronunciation,
      if (meanings != null) 'meanings': meanings,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  WordTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? languageType,
      Value<String>? theme,
      Value<String>? spelling,
      Value<String>? pronunciation,
      Value<String>? meanings,
      Value<DateTime>? createdAt}) {
    return WordTableCompanion(
      id: id ?? this.id,
      languageType: languageType ?? this.languageType,
      theme: theme ?? this.theme,
      spelling: spelling ?? this.spelling,
      pronunciation: pronunciation ?? this.pronunciation,
      meanings: meanings ?? this.meanings,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (languageType.present) {
      map['language_type'] = Variable<String>(languageType.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (spelling.present) {
      map['spelling'] = Variable<String>(spelling.value);
    }
    if (pronunciation.present) {
      map['pronunciation'] = Variable<String>(pronunciation.value);
    }
    if (meanings.present) {
      map['meanings'] = Variable<String>(meanings.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordTableCompanion(')
          ..write('id: $id, ')
          ..write('languageType: $languageType, ')
          ..write('theme: $theme, ')
          ..write('spelling: $spelling, ')
          ..write('pronunciation: $pronunciation, ')
          ..write('meanings: $meanings, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $WordMeaningTableTable extends WordMeaningTable
    with TableInfo<$WordMeaningTableTable, WordMeaningTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordMeaningTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _meaningMeta =
      const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
      'meaning', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wordTableIdMeta =
      const VerificationMeta('wordTableId');
  @override
  late final GeneratedColumn<int> wordTableId = GeneratedColumn<int>(
      'word_table_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES word_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, meaning, wordTableId];
  @override
  String get aliasedName => _alias ?? 'word_meaning_table';
  @override
  String get actualTableName => 'word_meaning_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<WordMeaningTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    } else if (isInserting) {
      context.missing(_meaningMeta);
    }
    if (data.containsKey('word_table_id')) {
      context.handle(
          _wordTableIdMeta,
          wordTableId.isAcceptableOrUnknown(
              data['word_table_id']!, _wordTableIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordMeaningTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordMeaningTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      meaning: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meaning'])!,
      wordTableId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}word_table_id']),
    );
  }

  @override
  $WordMeaningTableTable createAlias(String alias) {
    return $WordMeaningTableTable(attachedDatabase, alias);
  }
}

class WordMeaningTableData extends DataClass
    implements Insertable<WordMeaningTableData> {
  final int id;
  final String meaning;
  final int? wordTableId;
  const WordMeaningTableData(
      {required this.id, required this.meaning, this.wordTableId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['meaning'] = Variable<String>(meaning);
    if (!nullToAbsent || wordTableId != null) {
      map['word_table_id'] = Variable<int>(wordTableId);
    }
    return map;
  }

  WordMeaningTableCompanion toCompanion(bool nullToAbsent) {
    return WordMeaningTableCompanion(
      id: Value(id),
      meaning: Value(meaning),
      wordTableId: wordTableId == null && nullToAbsent
          ? const Value.absent()
          : Value(wordTableId),
    );
  }

  factory WordMeaningTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordMeaningTableData(
      id: serializer.fromJson<int>(json['id']),
      meaning: serializer.fromJson<String>(json['meaning']),
      wordTableId: serializer.fromJson<int?>(json['wordTableId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'meaning': serializer.toJson<String>(meaning),
      'wordTableId': serializer.toJson<int?>(wordTableId),
    };
  }

  WordMeaningTableData copyWith(
          {int? id,
          String? meaning,
          Value<int?> wordTableId = const Value.absent()}) =>
      WordMeaningTableData(
        id: id ?? this.id,
        meaning: meaning ?? this.meaning,
        wordTableId: wordTableId.present ? wordTableId.value : this.wordTableId,
      );
  @override
  String toString() {
    return (StringBuffer('WordMeaningTableData(')
          ..write('id: $id, ')
          ..write('meaning: $meaning, ')
          ..write('wordTableId: $wordTableId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, meaning, wordTableId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordMeaningTableData &&
          other.id == this.id &&
          other.meaning == this.meaning &&
          other.wordTableId == this.wordTableId);
}

class WordMeaningTableCompanion extends UpdateCompanion<WordMeaningTableData> {
  final Value<int> id;
  final Value<String> meaning;
  final Value<int?> wordTableId;
  const WordMeaningTableCompanion({
    this.id = const Value.absent(),
    this.meaning = const Value.absent(),
    this.wordTableId = const Value.absent(),
  });
  WordMeaningTableCompanion.insert({
    this.id = const Value.absent(),
    required String meaning,
    this.wordTableId = const Value.absent(),
  }) : meaning = Value(meaning);
  static Insertable<WordMeaningTableData> custom({
    Expression<int>? id,
    Expression<String>? meaning,
    Expression<int>? wordTableId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (meaning != null) 'meaning': meaning,
      if (wordTableId != null) 'word_table_id': wordTableId,
    });
  }

  WordMeaningTableCompanion copyWith(
      {Value<int>? id, Value<String>? meaning, Value<int?>? wordTableId}) {
    return WordMeaningTableCompanion(
      id: id ?? this.id,
      meaning: meaning ?? this.meaning,
      wordTableId: wordTableId ?? this.wordTableId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (wordTableId.present) {
      map['word_table_id'] = Variable<int>(wordTableId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordMeaningTableCompanion(')
          ..write('id: $id, ')
          ..write('meaning: $meaning, ')
          ..write('wordTableId: $wordTableId')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $WordTableTable wordTable = $WordTableTable(this);
  late final $WordMeaningTableTable wordMeaningTable =
      $WordMeaningTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [wordTable, wordMeaningTable];
}
