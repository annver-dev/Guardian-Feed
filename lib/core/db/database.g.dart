// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $NewsTable extends News with TableInfo<$NewsTable, New> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _newsIdMeta = const VerificationMeta('newsId');
  @override
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
    'news_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sectionIdMeta = const VerificationMeta(
    'sectionId',
  );
  @override
  late final GeneratedColumn<String> sectionId = GeneratedColumn<String>(
    'section_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sectionNameMeta = const VerificationMeta(
    'sectionName',
  );
  @override
  late final GeneratedColumn<String> sectionName = GeneratedColumn<String>(
    'section_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _publicationDateMeta = const VerificationMeta(
    'publicationDate',
  );
  @override
  late final GeneratedColumn<DateTime> publicationDate =
      GeneratedColumn<DateTime>(
        'publication_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _webUrlMeta = const VerificationMeta('webUrl');
  @override
  late final GeneratedColumn<String> webUrl = GeneratedColumn<String>(
    'web_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _apiUrlMeta = const VerificationMeta('apiUrl');
  @override
  late final GeneratedColumn<String> apiUrl = GeneratedColumn<String>(
    'api_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isHostedMeta = const VerificationMeta(
    'isHosted',
  );
  @override
  late final GeneratedColumn<bool> isHosted = GeneratedColumn<bool>(
    'is_hosted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_hosted" IN (0, 1))',
    ),
  );
  static const VerificationMeta _pillarIdMeta = const VerificationMeta(
    'pillarId',
  );
  @override
  late final GeneratedColumn<String> pillarId = GeneratedColumn<String>(
    'pillar_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pillarNameMeta = const VerificationMeta(
    'pillarName',
  );
  @override
  late final GeneratedColumn<String> pillarName = GeneratedColumn<String>(
    'pillar_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _thumbnailMeta = const VerificationMeta(
    'thumbnail',
  );
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
    'thumbnail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dateAddedMeta = const VerificationMeta(
    'dateAdded',
  );
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
    'date_added',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: Constant(DateTime.now()),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    newsId,
    type,
    sectionId,
    sectionName,
    publicationDate,
    title,
    webUrl,
    apiUrl,
    isHosted,
    pillarId,
    pillarName,
    body,
    thumbnail,
    author,
    isFavorite,
    dateAdded,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news';
  @override
  VerificationContext validateIntegrity(
    Insertable<New> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('news_id')) {
      context.handle(
        _newsIdMeta,
        newsId.isAcceptableOrUnknown(data['news_id']!, _newsIdMeta),
      );
    } else if (isInserting) {
      context.missing(_newsIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('section_id')) {
      context.handle(
        _sectionIdMeta,
        sectionId.isAcceptableOrUnknown(data['section_id']!, _sectionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sectionIdMeta);
    }
    if (data.containsKey('section_name')) {
      context.handle(
        _sectionNameMeta,
        sectionName.isAcceptableOrUnknown(
          data['section_name']!,
          _sectionNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sectionNameMeta);
    }
    if (data.containsKey('publication_date')) {
      context.handle(
        _publicationDateMeta,
        publicationDate.isAcceptableOrUnknown(
          data['publication_date']!,
          _publicationDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publicationDateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('web_url')) {
      context.handle(
        _webUrlMeta,
        webUrl.isAcceptableOrUnknown(data['web_url']!, _webUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_webUrlMeta);
    }
    if (data.containsKey('api_url')) {
      context.handle(
        _apiUrlMeta,
        apiUrl.isAcceptableOrUnknown(data['api_url']!, _apiUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_apiUrlMeta);
    }
    if (data.containsKey('is_hosted')) {
      context.handle(
        _isHostedMeta,
        isHosted.isAcceptableOrUnknown(data['is_hosted']!, _isHostedMeta),
      );
    } else if (isInserting) {
      context.missing(_isHostedMeta);
    }
    if (data.containsKey('pillar_id')) {
      context.handle(
        _pillarIdMeta,
        pillarId.isAcceptableOrUnknown(data['pillar_id']!, _pillarIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pillarIdMeta);
    }
    if (data.containsKey('pillar_name')) {
      context.handle(
        _pillarNameMeta,
        pillarName.isAcceptableOrUnknown(data['pillar_name']!, _pillarNameMeta),
      );
    } else if (isInserting) {
      context.missing(_pillarNameMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    }
    if (data.containsKey('thumbnail')) {
      context.handle(
        _thumbnailMeta,
        thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta),
      );
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('date_added')) {
      context.handle(
        _dateAddedMeta,
        dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  New map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return New(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      newsId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}news_id'],
          )!,
      type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
      sectionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}section_id'],
          )!,
      sectionName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}section_name'],
          )!,
      publicationDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}publication_date'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      webUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}web_url'],
          )!,
      apiUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}api_url'],
          )!,
      isHosted:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_hosted'],
          )!,
      pillarId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pillar_id'],
          )!,
      pillarName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pillar_name'],
          )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      ),
      thumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail'],
      ),
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      isFavorite:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_favorite'],
          )!,
      dateAdded:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date_added'],
          )!,
    );
  }

  @override
  $NewsTable createAlias(String alias) {
    return $NewsTable(attachedDatabase, alias);
  }
}

class New extends DataClass implements Insertable<New> {
  final int id;
  final String newsId;
  final String type;
  final String sectionId;
  final String sectionName;
  final DateTime publicationDate;
  final String title;
  final String webUrl;
  final String apiUrl;
  final bool isHosted;
  final String pillarId;
  final String pillarName;
  final String? body;
  final String? thumbnail;
  final String? author;
  final bool isFavorite;
  final DateTime dateAdded;
  const New({
    required this.id,
    required this.newsId,
    required this.type,
    required this.sectionId,
    required this.sectionName,
    required this.publicationDate,
    required this.title,
    required this.webUrl,
    required this.apiUrl,
    required this.isHosted,
    required this.pillarId,
    required this.pillarName,
    this.body,
    this.thumbnail,
    this.author,
    required this.isFavorite,
    required this.dateAdded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['news_id'] = Variable<String>(newsId);
    map['type'] = Variable<String>(type);
    map['section_id'] = Variable<String>(sectionId);
    map['section_name'] = Variable<String>(sectionName);
    map['publication_date'] = Variable<DateTime>(publicationDate);
    map['title'] = Variable<String>(title);
    map['web_url'] = Variable<String>(webUrl);
    map['api_url'] = Variable<String>(apiUrl);
    map['is_hosted'] = Variable<bool>(isHosted);
    map['pillar_id'] = Variable<String>(pillarId);
    map['pillar_name'] = Variable<String>(pillarName);
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['date_added'] = Variable<DateTime>(dateAdded);
    return map;
  }

  NewsCompanion toCompanion(bool nullToAbsent) {
    return NewsCompanion(
      id: Value(id),
      newsId: Value(newsId),
      type: Value(type),
      sectionId: Value(sectionId),
      sectionName: Value(sectionName),
      publicationDate: Value(publicationDate),
      title: Value(title),
      webUrl: Value(webUrl),
      apiUrl: Value(apiUrl),
      isHosted: Value(isHosted),
      pillarId: Value(pillarId),
      pillarName: Value(pillarName),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      thumbnail:
          thumbnail == null && nullToAbsent
              ? const Value.absent()
              : Value(thumbnail),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      isFavorite: Value(isFavorite),
      dateAdded: Value(dateAdded),
    );
  }

  factory New.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return New(
      id: serializer.fromJson<int>(json['id']),
      newsId: serializer.fromJson<String>(json['newsId']),
      type: serializer.fromJson<String>(json['type']),
      sectionId: serializer.fromJson<String>(json['sectionId']),
      sectionName: serializer.fromJson<String>(json['sectionName']),
      publicationDate: serializer.fromJson<DateTime>(json['publicationDate']),
      title: serializer.fromJson<String>(json['title']),
      webUrl: serializer.fromJson<String>(json['webUrl']),
      apiUrl: serializer.fromJson<String>(json['apiUrl']),
      isHosted: serializer.fromJson<bool>(json['isHosted']),
      pillarId: serializer.fromJson<String>(json['pillarId']),
      pillarName: serializer.fromJson<String>(json['pillarName']),
      body: serializer.fromJson<String?>(json['body']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      author: serializer.fromJson<String?>(json['author']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'newsId': serializer.toJson<String>(newsId),
      'type': serializer.toJson<String>(type),
      'sectionId': serializer.toJson<String>(sectionId),
      'sectionName': serializer.toJson<String>(sectionName),
      'publicationDate': serializer.toJson<DateTime>(publicationDate),
      'title': serializer.toJson<String>(title),
      'webUrl': serializer.toJson<String>(webUrl),
      'apiUrl': serializer.toJson<String>(apiUrl),
      'isHosted': serializer.toJson<bool>(isHosted),
      'pillarId': serializer.toJson<String>(pillarId),
      'pillarName': serializer.toJson<String>(pillarName),
      'body': serializer.toJson<String?>(body),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'author': serializer.toJson<String?>(author),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
    };
  }

  New copyWith({
    int? id,
    String? newsId,
    String? type,
    String? sectionId,
    String? sectionName,
    DateTime? publicationDate,
    String? title,
    String? webUrl,
    String? apiUrl,
    bool? isHosted,
    String? pillarId,
    String? pillarName,
    Value<String?> body = const Value.absent(),
    Value<String?> thumbnail = const Value.absent(),
    Value<String?> author = const Value.absent(),
    bool? isFavorite,
    DateTime? dateAdded,
  }) => New(
    id: id ?? this.id,
    newsId: newsId ?? this.newsId,
    type: type ?? this.type,
    sectionId: sectionId ?? this.sectionId,
    sectionName: sectionName ?? this.sectionName,
    publicationDate: publicationDate ?? this.publicationDate,
    title: title ?? this.title,
    webUrl: webUrl ?? this.webUrl,
    apiUrl: apiUrl ?? this.apiUrl,
    isHosted: isHosted ?? this.isHosted,
    pillarId: pillarId ?? this.pillarId,
    pillarName: pillarName ?? this.pillarName,
    body: body.present ? body.value : this.body,
    thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
    author: author.present ? author.value : this.author,
    isFavorite: isFavorite ?? this.isFavorite,
    dateAdded: dateAdded ?? this.dateAdded,
  );
  New copyWithCompanion(NewsCompanion data) {
    return New(
      id: data.id.present ? data.id.value : this.id,
      newsId: data.newsId.present ? data.newsId.value : this.newsId,
      type: data.type.present ? data.type.value : this.type,
      sectionId: data.sectionId.present ? data.sectionId.value : this.sectionId,
      sectionName:
          data.sectionName.present ? data.sectionName.value : this.sectionName,
      publicationDate:
          data.publicationDate.present
              ? data.publicationDate.value
              : this.publicationDate,
      title: data.title.present ? data.title.value : this.title,
      webUrl: data.webUrl.present ? data.webUrl.value : this.webUrl,
      apiUrl: data.apiUrl.present ? data.apiUrl.value : this.apiUrl,
      isHosted: data.isHosted.present ? data.isHosted.value : this.isHosted,
      pillarId: data.pillarId.present ? data.pillarId.value : this.pillarId,
      pillarName:
          data.pillarName.present ? data.pillarName.value : this.pillarName,
      body: data.body.present ? data.body.value : this.body,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      author: data.author.present ? data.author.value : this.author,
      isFavorite:
          data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('New(')
          ..write('id: $id, ')
          ..write('newsId: $newsId, ')
          ..write('type: $type, ')
          ..write('sectionId: $sectionId, ')
          ..write('sectionName: $sectionName, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('title: $title, ')
          ..write('webUrl: $webUrl, ')
          ..write('apiUrl: $apiUrl, ')
          ..write('isHosted: $isHosted, ')
          ..write('pillarId: $pillarId, ')
          ..write('pillarName: $pillarName, ')
          ..write('body: $body, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('author: $author, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('dateAdded: $dateAdded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    newsId,
    type,
    sectionId,
    sectionName,
    publicationDate,
    title,
    webUrl,
    apiUrl,
    isHosted,
    pillarId,
    pillarName,
    body,
    thumbnail,
    author,
    isFavorite,
    dateAdded,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is New &&
          other.id == this.id &&
          other.newsId == this.newsId &&
          other.type == this.type &&
          other.sectionId == this.sectionId &&
          other.sectionName == this.sectionName &&
          other.publicationDate == this.publicationDate &&
          other.title == this.title &&
          other.webUrl == this.webUrl &&
          other.apiUrl == this.apiUrl &&
          other.isHosted == this.isHosted &&
          other.pillarId == this.pillarId &&
          other.pillarName == this.pillarName &&
          other.body == this.body &&
          other.thumbnail == this.thumbnail &&
          other.author == this.author &&
          other.isFavorite == this.isFavorite &&
          other.dateAdded == this.dateAdded);
}

class NewsCompanion extends UpdateCompanion<New> {
  final Value<int> id;
  final Value<String> newsId;
  final Value<String> type;
  final Value<String> sectionId;
  final Value<String> sectionName;
  final Value<DateTime> publicationDate;
  final Value<String> title;
  final Value<String> webUrl;
  final Value<String> apiUrl;
  final Value<bool> isHosted;
  final Value<String> pillarId;
  final Value<String> pillarName;
  final Value<String?> body;
  final Value<String?> thumbnail;
  final Value<String?> author;
  final Value<bool> isFavorite;
  final Value<DateTime> dateAdded;
  const NewsCompanion({
    this.id = const Value.absent(),
    this.newsId = const Value.absent(),
    this.type = const Value.absent(),
    this.sectionId = const Value.absent(),
    this.sectionName = const Value.absent(),
    this.publicationDate = const Value.absent(),
    this.title = const Value.absent(),
    this.webUrl = const Value.absent(),
    this.apiUrl = const Value.absent(),
    this.isHosted = const Value.absent(),
    this.pillarId = const Value.absent(),
    this.pillarName = const Value.absent(),
    this.body = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.author = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.dateAdded = const Value.absent(),
  });
  NewsCompanion.insert({
    this.id = const Value.absent(),
    required String newsId,
    required String type,
    required String sectionId,
    required String sectionName,
    required DateTime publicationDate,
    required String title,
    required String webUrl,
    required String apiUrl,
    required bool isHosted,
    required String pillarId,
    required String pillarName,
    this.body = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.author = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.dateAdded = const Value.absent(),
  }) : newsId = Value(newsId),
       type = Value(type),
       sectionId = Value(sectionId),
       sectionName = Value(sectionName),
       publicationDate = Value(publicationDate),
       title = Value(title),
       webUrl = Value(webUrl),
       apiUrl = Value(apiUrl),
       isHosted = Value(isHosted),
       pillarId = Value(pillarId),
       pillarName = Value(pillarName);
  static Insertable<New> custom({
    Expression<int>? id,
    Expression<String>? newsId,
    Expression<String>? type,
    Expression<String>? sectionId,
    Expression<String>? sectionName,
    Expression<DateTime>? publicationDate,
    Expression<String>? title,
    Expression<String>? webUrl,
    Expression<String>? apiUrl,
    Expression<bool>? isHosted,
    Expression<String>? pillarId,
    Expression<String>? pillarName,
    Expression<String>? body,
    Expression<String>? thumbnail,
    Expression<String>? author,
    Expression<bool>? isFavorite,
    Expression<DateTime>? dateAdded,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (newsId != null) 'news_id': newsId,
      if (type != null) 'type': type,
      if (sectionId != null) 'section_id': sectionId,
      if (sectionName != null) 'section_name': sectionName,
      if (publicationDate != null) 'publication_date': publicationDate,
      if (title != null) 'title': title,
      if (webUrl != null) 'web_url': webUrl,
      if (apiUrl != null) 'api_url': apiUrl,
      if (isHosted != null) 'is_hosted': isHosted,
      if (pillarId != null) 'pillar_id': pillarId,
      if (pillarName != null) 'pillar_name': pillarName,
      if (body != null) 'body': body,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (author != null) 'author': author,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (dateAdded != null) 'date_added': dateAdded,
    });
  }

  NewsCompanion copyWith({
    Value<int>? id,
    Value<String>? newsId,
    Value<String>? type,
    Value<String>? sectionId,
    Value<String>? sectionName,
    Value<DateTime>? publicationDate,
    Value<String>? title,
    Value<String>? webUrl,
    Value<String>? apiUrl,
    Value<bool>? isHosted,
    Value<String>? pillarId,
    Value<String>? pillarName,
    Value<String?>? body,
    Value<String?>? thumbnail,
    Value<String?>? author,
    Value<bool>? isFavorite,
    Value<DateTime>? dateAdded,
  }) {
    return NewsCompanion(
      id: id ?? this.id,
      newsId: newsId ?? this.newsId,
      type: type ?? this.type,
      sectionId: sectionId ?? this.sectionId,
      sectionName: sectionName ?? this.sectionName,
      publicationDate: publicationDate ?? this.publicationDate,
      title: title ?? this.title,
      webUrl: webUrl ?? this.webUrl,
      apiUrl: apiUrl ?? this.apiUrl,
      isHosted: isHosted ?? this.isHosted,
      pillarId: pillarId ?? this.pillarId,
      pillarName: pillarName ?? this.pillarName,
      body: body ?? this.body,
      thumbnail: thumbnail ?? this.thumbnail,
      author: author ?? this.author,
      isFavorite: isFavorite ?? this.isFavorite,
      dateAdded: dateAdded ?? this.dateAdded,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (newsId.present) {
      map['news_id'] = Variable<String>(newsId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (sectionId.present) {
      map['section_id'] = Variable<String>(sectionId.value);
    }
    if (sectionName.present) {
      map['section_name'] = Variable<String>(sectionName.value);
    }
    if (publicationDate.present) {
      map['publication_date'] = Variable<DateTime>(publicationDate.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (webUrl.present) {
      map['web_url'] = Variable<String>(webUrl.value);
    }
    if (apiUrl.present) {
      map['api_url'] = Variable<String>(apiUrl.value);
    }
    if (isHosted.present) {
      map['is_hosted'] = Variable<bool>(isHosted.value);
    }
    if (pillarId.present) {
      map['pillar_id'] = Variable<String>(pillarId.value);
    }
    if (pillarName.present) {
      map['pillar_name'] = Variable<String>(pillarName.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsCompanion(')
          ..write('id: $id, ')
          ..write('newsId: $newsId, ')
          ..write('type: $type, ')
          ..write('sectionId: $sectionId, ')
          ..write('sectionName: $sectionName, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('title: $title, ')
          ..write('webUrl: $webUrl, ')
          ..write('apiUrl: $apiUrl, ')
          ..write('isHosted: $isHosted, ')
          ..write('pillarId: $pillarId, ')
          ..write('pillarName: $pillarName, ')
          ..write('body: $body, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('author: $author, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('dateAdded: $dateAdded')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NewsTable news = $NewsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [news];
}

typedef $$NewsTableCreateCompanionBuilder =
    NewsCompanion Function({
      Value<int> id,
      required String newsId,
      required String type,
      required String sectionId,
      required String sectionName,
      required DateTime publicationDate,
      required String title,
      required String webUrl,
      required String apiUrl,
      required bool isHosted,
      required String pillarId,
      required String pillarName,
      Value<String?> body,
      Value<String?> thumbnail,
      Value<String?> author,
      Value<bool> isFavorite,
      Value<DateTime> dateAdded,
    });
typedef $$NewsTableUpdateCompanionBuilder =
    NewsCompanion Function({
      Value<int> id,
      Value<String> newsId,
      Value<String> type,
      Value<String> sectionId,
      Value<String> sectionName,
      Value<DateTime> publicationDate,
      Value<String> title,
      Value<String> webUrl,
      Value<String> apiUrl,
      Value<bool> isHosted,
      Value<String> pillarId,
      Value<String> pillarName,
      Value<String?> body,
      Value<String?> thumbnail,
      Value<String?> author,
      Value<bool> isFavorite,
      Value<DateTime> dateAdded,
    });

class $$NewsTableFilterComposer extends Composer<_$AppDatabase, $NewsTable> {
  $$NewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get newsId => $composableBuilder(
    column: $table.newsId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sectionId => $composableBuilder(
    column: $table.sectionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sectionName => $composableBuilder(
    column: $table.sectionName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publicationDate => $composableBuilder(
    column: $table.publicationDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get webUrl => $composableBuilder(
    column: $table.webUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apiUrl => $composableBuilder(
    column: $table.apiUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isHosted => $composableBuilder(
    column: $table.isHosted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pillarId => $composableBuilder(
    column: $table.pillarId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pillarName => $composableBuilder(
    column: $table.pillarName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NewsTableOrderingComposer extends Composer<_$AppDatabase, $NewsTable> {
  $$NewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get newsId => $composableBuilder(
    column: $table.newsId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sectionId => $composableBuilder(
    column: $table.sectionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sectionName => $composableBuilder(
    column: $table.sectionName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publicationDate => $composableBuilder(
    column: $table.publicationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get webUrl => $composableBuilder(
    column: $table.webUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apiUrl => $composableBuilder(
    column: $table.apiUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isHosted => $composableBuilder(
    column: $table.isHosted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pillarId => $composableBuilder(
    column: $table.pillarId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pillarName => $composableBuilder(
    column: $table.pillarName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnail => $composableBuilder(
    column: $table.thumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NewsTable> {
  $$NewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get newsId =>
      $composableBuilder(column: $table.newsId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get sectionId =>
      $composableBuilder(column: $table.sectionId, builder: (column) => column);

  GeneratedColumn<String> get sectionName => $composableBuilder(
    column: $table.sectionName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get publicationDate => $composableBuilder(
    column: $table.publicationDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get webUrl =>
      $composableBuilder(column: $table.webUrl, builder: (column) => column);

  GeneratedColumn<String> get apiUrl =>
      $composableBuilder(column: $table.apiUrl, builder: (column) => column);

  GeneratedColumn<bool> get isHosted =>
      $composableBuilder(column: $table.isHosted, builder: (column) => column);

  GeneratedColumn<String> get pillarId =>
      $composableBuilder(column: $table.pillarId, builder: (column) => column);

  GeneratedColumn<String> get pillarName => $composableBuilder(
    column: $table.pillarName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);
}

class $$NewsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NewsTable,
          New,
          $$NewsTableFilterComposer,
          $$NewsTableOrderingComposer,
          $$NewsTableAnnotationComposer,
          $$NewsTableCreateCompanionBuilder,
          $$NewsTableUpdateCompanionBuilder,
          (New, BaseReferences<_$AppDatabase, $NewsTable, New>),
          New,
          PrefetchHooks Function()
        > {
  $$NewsTableTableManager(_$AppDatabase db, $NewsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$NewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$NewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$NewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> newsId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> sectionId = const Value.absent(),
                Value<String> sectionName = const Value.absent(),
                Value<DateTime> publicationDate = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> webUrl = const Value.absent(),
                Value<String> apiUrl = const Value.absent(),
                Value<bool> isHosted = const Value.absent(),
                Value<String> pillarId = const Value.absent(),
                Value<String> pillarName = const Value.absent(),
                Value<String?> body = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime> dateAdded = const Value.absent(),
              }) => NewsCompanion(
                id: id,
                newsId: newsId,
                type: type,
                sectionId: sectionId,
                sectionName: sectionName,
                publicationDate: publicationDate,
                title: title,
                webUrl: webUrl,
                apiUrl: apiUrl,
                isHosted: isHosted,
                pillarId: pillarId,
                pillarName: pillarName,
                body: body,
                thumbnail: thumbnail,
                author: author,
                isFavorite: isFavorite,
                dateAdded: dateAdded,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String newsId,
                required String type,
                required String sectionId,
                required String sectionName,
                required DateTime publicationDate,
                required String title,
                required String webUrl,
                required String apiUrl,
                required bool isHosted,
                required String pillarId,
                required String pillarName,
                Value<String?> body = const Value.absent(),
                Value<String?> thumbnail = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<DateTime> dateAdded = const Value.absent(),
              }) => NewsCompanion.insert(
                id: id,
                newsId: newsId,
                type: type,
                sectionId: sectionId,
                sectionName: sectionName,
                publicationDate: publicationDate,
                title: title,
                webUrl: webUrl,
                apiUrl: apiUrl,
                isHosted: isHosted,
                pillarId: pillarId,
                pillarName: pillarName,
                body: body,
                thumbnail: thumbnail,
                author: author,
                isFavorite: isFavorite,
                dateAdded: dateAdded,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NewsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NewsTable,
      New,
      $$NewsTableFilterComposer,
      $$NewsTableOrderingComposer,
      $$NewsTableAnnotationComposer,
      $$NewsTableCreateCompanionBuilder,
      $$NewsTableUpdateCompanionBuilder,
      (New, BaseReferences<_$AppDatabase, $NewsTable, New>),
      New,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NewsTableTableManager get news => $$NewsTableTableManager(_db, _db.news);
}
