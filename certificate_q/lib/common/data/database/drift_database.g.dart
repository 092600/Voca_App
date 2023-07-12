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

class $LanguageTableTable extends LanguageTable
    with TableInfo<$LanguageTableTable, LanguageTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LanguageTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _languageTitleMeta =
      const VerificationMeta('languageTitle');
  @override
  late final GeneratedColumn<String> languageTitle = GeneratedColumn<String>(
      'language_title', aliasedName, false,
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
      [id, languageType, languageTitle, createdAt];
  @override
  String get aliasedName => _alias ?? 'language_table';
  @override
  String get actualTableName => 'language_table';
  @override
  VerificationContext validateIntegrity(Insertable<LanguageTableData> instance,
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
    if (data.containsKey('language_title')) {
      context.handle(
          _languageTitleMeta,
          languageTitle.isAcceptableOrUnknown(
              data['language_title']!, _languageTitleMeta));
    } else if (isInserting) {
      context.missing(_languageTitleMeta);
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
  LanguageTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LanguageTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      languageType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language_type'])!,
      languageTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language_title'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LanguageTableTable createAlias(String alias) {
    return $LanguageTableTable(attachedDatabase, alias);
  }
}

class LanguageTableData extends DataClass
    implements Insertable<LanguageTableData> {
  final int id;
  final String languageType;
  final String languageTitle;
  final DateTime createdAt;
  const LanguageTableData(
      {required this.id,
      required this.languageType,
      required this.languageTitle,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['language_type'] = Variable<String>(languageType);
    map['language_title'] = Variable<String>(languageTitle);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LanguageTableCompanion toCompanion(bool nullToAbsent) {
    return LanguageTableCompanion(
      id: Value(id),
      languageType: Value(languageType),
      languageTitle: Value(languageTitle),
      createdAt: Value(createdAt),
    );
  }

  factory LanguageTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LanguageTableData(
      id: serializer.fromJson<int>(json['id']),
      languageType: serializer.fromJson<String>(json['languageType']),
      languageTitle: serializer.fromJson<String>(json['languageTitle']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'languageType': serializer.toJson<String>(languageType),
      'languageTitle': serializer.toJson<String>(languageTitle),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LanguageTableData copyWith(
          {int? id,
          String? languageType,
          String? languageTitle,
          DateTime? createdAt}) =>
      LanguageTableData(
        id: id ?? this.id,
        languageType: languageType ?? this.languageType,
        languageTitle: languageTitle ?? this.languageTitle,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('LanguageTableData(')
          ..write('id: $id, ')
          ..write('languageType: $languageType, ')
          ..write('languageTitle: $languageTitle, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, languageType, languageTitle, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LanguageTableData &&
          other.id == this.id &&
          other.languageType == this.languageType &&
          other.languageTitle == this.languageTitle &&
          other.createdAt == this.createdAt);
}

class LanguageTableCompanion extends UpdateCompanion<LanguageTableData> {
  final Value<int> id;
  final Value<String> languageType;
  final Value<String> languageTitle;
  final Value<DateTime> createdAt;
  const LanguageTableCompanion({
    this.id = const Value.absent(),
    this.languageType = const Value.absent(),
    this.languageTitle = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LanguageTableCompanion.insert({
    this.id = const Value.absent(),
    required String languageType,
    required String languageTitle,
    this.createdAt = const Value.absent(),
  })  : languageType = Value(languageType),
        languageTitle = Value(languageTitle);
  static Insertable<LanguageTableData> custom({
    Expression<int>? id,
    Expression<String>? languageType,
    Expression<String>? languageTitle,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (languageType != null) 'language_type': languageType,
      if (languageTitle != null) 'language_title': languageTitle,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LanguageTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? languageType,
      Value<String>? languageTitle,
      Value<DateTime>? createdAt}) {
    return LanguageTableCompanion(
      id: id ?? this.id,
      languageType: languageType ?? this.languageType,
      languageTitle: languageTitle ?? this.languageTitle,
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
    if (languageTitle.present) {
      map['language_title'] = Variable<String>(languageTitle.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LanguageTableCompanion(')
          ..write('id: $id, ')
          ..write('languageType: $languageType, ')
          ..write('languageTitle: $languageTitle, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $WordTableTable wordTable = $WordTableTable(this);
  late final $LanguageTableTable languageTable = $LanguageTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [wordTable, languageTable];
}
