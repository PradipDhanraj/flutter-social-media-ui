// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FeedTableTable extends FeedTable
    with TableInfo<$FeedTableTable, FeedTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentIdMeta =
      const VerificationMeta('contentId');
  @override
  late final GeneratedColumn<int> contentId = GeneratedColumn<int>(
      'content_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isLikedMeta =
      const VerificationMeta('isLiked');
  @override
  late final GeneratedColumn<bool> isLiked = GeneratedColumn<bool>(
      'is_liked', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_liked" IN (0, 1))'));
  static const VerificationMeta _isSavedMeta =
      const VerificationMeta('isSaved');
  @override
  late final GeneratedColumn<bool> isSaved = GeneratedColumn<bool>(
      'is_saved', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_saved" IN (0, 1))'));
  static const VerificationMeta _isFollowMeta =
      const VerificationMeta('isFollow');
  @override
  late final GeneratedColumn<bool> isFollow = GeneratedColumn<bool>(
      'is_follow', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_follow" IN (0, 1))'));
  static const VerificationMeta _isWishedMeta =
      const VerificationMeta('isWished');
  @override
  late final GeneratedColumn<bool> isWished = GeneratedColumn<bool>(
      'is_wished', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_wished" IN (0, 1))'));
  static const VerificationMeta _hideCommentMeta =
      const VerificationMeta('hideComment');
  @override
  late final GeneratedColumn<int> hideComment = GeneratedColumn<int>(
      'hide_comment', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        contentId,
        userId,
        isLiked,
        isSaved,
        isFollow,
        isWished,
        hideComment
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feed_table';
  @override
  VerificationContext validateIntegrity(Insertable<FeedTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content_id')) {
      context.handle(_contentIdMeta,
          contentId.isAcceptableOrUnknown(data['content_id']!, _contentIdMeta));
    } else if (isInserting) {
      context.missing(_contentIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('is_liked')) {
      context.handle(_isLikedMeta,
          isLiked.isAcceptableOrUnknown(data['is_liked']!, _isLikedMeta));
    }
    if (data.containsKey('is_saved')) {
      context.handle(_isSavedMeta,
          isSaved.isAcceptableOrUnknown(data['is_saved']!, _isSavedMeta));
    }
    if (data.containsKey('is_follow')) {
      context.handle(_isFollowMeta,
          isFollow.isAcceptableOrUnknown(data['is_follow']!, _isFollowMeta));
    }
    if (data.containsKey('is_wished')) {
      context.handle(_isWishedMeta,
          isWished.isAcceptableOrUnknown(data['is_wished']!, _isWishedMeta));
    }
    if (data.containsKey('hide_comment')) {
      context.handle(
          _hideCommentMeta,
          hideComment.isAcceptableOrUnknown(
              data['hide_comment']!, _hideCommentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeedTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      contentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}content_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      isLiked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_liked']),
      isSaved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_saved']),
      isFollow: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_follow']),
      isWished: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_wished']),
      hideComment: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hide_comment']),
    );
  }

  @override
  $FeedTableTable createAlias(String alias) {
    return $FeedTableTable(attachedDatabase, alias);
  }
}

class FeedTableData extends DataClass implements Insertable<FeedTableData> {
  final int id;
  final int contentId;
  final int userId;
  final bool? isLiked;
  final bool? isSaved;
  final bool? isFollow;
  final bool? isWished;
  final int? hideComment;
  const FeedTableData(
      {required this.id,
      required this.contentId,
      required this.userId,
      this.isLiked,
      this.isSaved,
      this.isFollow,
      this.isWished,
      this.hideComment});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content_id'] = Variable<int>(contentId);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || isLiked != null) {
      map['is_liked'] = Variable<bool>(isLiked);
    }
    if (!nullToAbsent || isSaved != null) {
      map['is_saved'] = Variable<bool>(isSaved);
    }
    if (!nullToAbsent || isFollow != null) {
      map['is_follow'] = Variable<bool>(isFollow);
    }
    if (!nullToAbsent || isWished != null) {
      map['is_wished'] = Variable<bool>(isWished);
    }
    if (!nullToAbsent || hideComment != null) {
      map['hide_comment'] = Variable<int>(hideComment);
    }
    return map;
  }

  FeedTableCompanion toCompanion(bool nullToAbsent) {
    return FeedTableCompanion(
      id: Value(id),
      contentId: Value(contentId),
      userId: Value(userId),
      isLiked: isLiked == null && nullToAbsent
          ? const Value.absent()
          : Value(isLiked),
      isSaved: isSaved == null && nullToAbsent
          ? const Value.absent()
          : Value(isSaved),
      isFollow: isFollow == null && nullToAbsent
          ? const Value.absent()
          : Value(isFollow),
      isWished: isWished == null && nullToAbsent
          ? const Value.absent()
          : Value(isWished),
      hideComment: hideComment == null && nullToAbsent
          ? const Value.absent()
          : Value(hideComment),
    );
  }

  factory FeedTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeedTableData(
      id: serializer.fromJson<int>(json['id']),
      contentId: serializer.fromJson<int>(json['contentId']),
      userId: serializer.fromJson<int>(json['userId']),
      isLiked: serializer.fromJson<bool?>(json['isLiked']),
      isSaved: serializer.fromJson<bool?>(json['isSaved']),
      isFollow: serializer.fromJson<bool?>(json['isFollow']),
      isWished: serializer.fromJson<bool?>(json['isWished']),
      hideComment: serializer.fromJson<int?>(json['hideComment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'contentId': serializer.toJson<int>(contentId),
      'userId': serializer.toJson<int>(userId),
      'isLiked': serializer.toJson<bool?>(isLiked),
      'isSaved': serializer.toJson<bool?>(isSaved),
      'isFollow': serializer.toJson<bool?>(isFollow),
      'isWished': serializer.toJson<bool?>(isWished),
      'hideComment': serializer.toJson<int?>(hideComment),
    };
  }

  FeedTableData copyWith(
          {int? id,
          int? contentId,
          int? userId,
          Value<bool?> isLiked = const Value.absent(),
          Value<bool?> isSaved = const Value.absent(),
          Value<bool?> isFollow = const Value.absent(),
          Value<bool?> isWished = const Value.absent(),
          Value<int?> hideComment = const Value.absent()}) =>
      FeedTableData(
        id: id ?? this.id,
        contentId: contentId ?? this.contentId,
        userId: userId ?? this.userId,
        isLiked: isLiked.present ? isLiked.value : this.isLiked,
        isSaved: isSaved.present ? isSaved.value : this.isSaved,
        isFollow: isFollow.present ? isFollow.value : this.isFollow,
        isWished: isWished.present ? isWished.value : this.isWished,
        hideComment: hideComment.present ? hideComment.value : this.hideComment,
      );
  FeedTableData copyWithCompanion(FeedTableCompanion data) {
    return FeedTableData(
      id: data.id.present ? data.id.value : this.id,
      contentId: data.contentId.present ? data.contentId.value : this.contentId,
      userId: data.userId.present ? data.userId.value : this.userId,
      isLiked: data.isLiked.present ? data.isLiked.value : this.isLiked,
      isSaved: data.isSaved.present ? data.isSaved.value : this.isSaved,
      isFollow: data.isFollow.present ? data.isFollow.value : this.isFollow,
      isWished: data.isWished.present ? data.isWished.value : this.isWished,
      hideComment:
          data.hideComment.present ? data.hideComment.value : this.hideComment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeedTableData(')
          ..write('id: $id, ')
          ..write('contentId: $contentId, ')
          ..write('userId: $userId, ')
          ..write('isLiked: $isLiked, ')
          ..write('isSaved: $isSaved, ')
          ..write('isFollow: $isFollow, ')
          ..write('isWished: $isWished, ')
          ..write('hideComment: $hideComment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, contentId, userId, isLiked, isSaved, isFollow, isWished, hideComment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedTableData &&
          other.id == this.id &&
          other.contentId == this.contentId &&
          other.userId == this.userId &&
          other.isLiked == this.isLiked &&
          other.isSaved == this.isSaved &&
          other.isFollow == this.isFollow &&
          other.isWished == this.isWished &&
          other.hideComment == this.hideComment);
}

class FeedTableCompanion extends UpdateCompanion<FeedTableData> {
  final Value<int> id;
  final Value<int> contentId;
  final Value<int> userId;
  final Value<bool?> isLiked;
  final Value<bool?> isSaved;
  final Value<bool?> isFollow;
  final Value<bool?> isWished;
  final Value<int?> hideComment;
  const FeedTableCompanion({
    this.id = const Value.absent(),
    this.contentId = const Value.absent(),
    this.userId = const Value.absent(),
    this.isLiked = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.isFollow = const Value.absent(),
    this.isWished = const Value.absent(),
    this.hideComment = const Value.absent(),
  });
  FeedTableCompanion.insert({
    this.id = const Value.absent(),
    required int contentId,
    required int userId,
    this.isLiked = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.isFollow = const Value.absent(),
    this.isWished = const Value.absent(),
    this.hideComment = const Value.absent(),
  })  : contentId = Value(contentId),
        userId = Value(userId);
  static Insertable<FeedTableData> custom({
    Expression<int>? id,
    Expression<int>? contentId,
    Expression<int>? userId,
    Expression<bool>? isLiked,
    Expression<bool>? isSaved,
    Expression<bool>? isFollow,
    Expression<bool>? isWished,
    Expression<int>? hideComment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (contentId != null) 'content_id': contentId,
      if (userId != null) 'user_id': userId,
      if (isLiked != null) 'is_liked': isLiked,
      if (isSaved != null) 'is_saved': isSaved,
      if (isFollow != null) 'is_follow': isFollow,
      if (isWished != null) 'is_wished': isWished,
      if (hideComment != null) 'hide_comment': hideComment,
    });
  }

  FeedTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? contentId,
      Value<int>? userId,
      Value<bool?>? isLiked,
      Value<bool?>? isSaved,
      Value<bool?>? isFollow,
      Value<bool?>? isWished,
      Value<int?>? hideComment}) {
    return FeedTableCompanion(
      id: id ?? this.id,
      contentId: contentId ?? this.contentId,
      userId: userId ?? this.userId,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
      isFollow: isFollow ?? this.isFollow,
      isWished: isWished ?? this.isWished,
      hideComment: hideComment ?? this.hideComment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (contentId.present) {
      map['content_id'] = Variable<int>(contentId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (isLiked.present) {
      map['is_liked'] = Variable<bool>(isLiked.value);
    }
    if (isSaved.present) {
      map['is_saved'] = Variable<bool>(isSaved.value);
    }
    if (isFollow.present) {
      map['is_follow'] = Variable<bool>(isFollow.value);
    }
    if (isWished.present) {
      map['is_wished'] = Variable<bool>(isWished.value);
    }
    if (hideComment.present) {
      map['hide_comment'] = Variable<int>(hideComment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedTableCompanion(')
          ..write('id: $id, ')
          ..write('contentId: $contentId, ')
          ..write('userId: $userId, ')
          ..write('isLiked: $isLiked, ')
          ..write('isSaved: $isSaved, ')
          ..write('isFollow: $isFollow, ')
          ..write('isWished: $isWished, ')
          ..write('hideComment: $hideComment')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $FeedTableTable feedTable = $FeedTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [feedTable];
}

typedef $$FeedTableTableCreateCompanionBuilder = FeedTableCompanion Function({
  Value<int> id,
  required int contentId,
  required int userId,
  Value<bool?> isLiked,
  Value<bool?> isSaved,
  Value<bool?> isFollow,
  Value<bool?> isWished,
  Value<int?> hideComment,
});
typedef $$FeedTableTableUpdateCompanionBuilder = FeedTableCompanion Function({
  Value<int> id,
  Value<int> contentId,
  Value<int> userId,
  Value<bool?> isLiked,
  Value<bool?> isSaved,
  Value<bool?> isFollow,
  Value<bool?> isWished,
  Value<int?> hideComment,
});

class $$FeedTableTableTableManager extends RootTableManager<
    _$AppDb,
    $FeedTableTable,
    FeedTableData,
    $$FeedTableTableFilterComposer,
    $$FeedTableTableOrderingComposer,
    $$FeedTableTableCreateCompanionBuilder,
    $$FeedTableTableUpdateCompanionBuilder> {
  $$FeedTableTableTableManager(_$AppDb db, $FeedTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FeedTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FeedTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> contentId = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<bool?> isLiked = const Value.absent(),
            Value<bool?> isSaved = const Value.absent(),
            Value<bool?> isFollow = const Value.absent(),
            Value<bool?> isWished = const Value.absent(),
            Value<int?> hideComment = const Value.absent(),
          }) =>
              FeedTableCompanion(
            id: id,
            contentId: contentId,
            userId: userId,
            isLiked: isLiked,
            isSaved: isSaved,
            isFollow: isFollow,
            isWished: isWished,
            hideComment: hideComment,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int contentId,
            required int userId,
            Value<bool?> isLiked = const Value.absent(),
            Value<bool?> isSaved = const Value.absent(),
            Value<bool?> isFollow = const Value.absent(),
            Value<bool?> isWished = const Value.absent(),
            Value<int?> hideComment = const Value.absent(),
          }) =>
              FeedTableCompanion.insert(
            id: id,
            contentId: contentId,
            userId: userId,
            isLiked: isLiked,
            isSaved: isSaved,
            isFollow: isFollow,
            isWished: isWished,
            hideComment: hideComment,
          ),
        ));
}

class $$FeedTableTableFilterComposer
    extends FilterComposer<_$AppDb, $FeedTableTable> {
  $$FeedTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get contentId => $state.composableBuilder(
      column: $state.table.contentId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isLiked => $state.composableBuilder(
      column: $state.table.isLiked,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isSaved => $state.composableBuilder(
      column: $state.table.isSaved,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isFollow => $state.composableBuilder(
      column: $state.table.isFollow,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isWished => $state.composableBuilder(
      column: $state.table.isWished,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get hideComment => $state.composableBuilder(
      column: $state.table.hideComment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FeedTableTableOrderingComposer
    extends OrderingComposer<_$AppDb, $FeedTableTable> {
  $$FeedTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get contentId => $state.composableBuilder(
      column: $state.table.contentId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isLiked => $state.composableBuilder(
      column: $state.table.isLiked,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isSaved => $state.composableBuilder(
      column: $state.table.isSaved,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isFollow => $state.composableBuilder(
      column: $state.table.isFollow,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isWished => $state.composableBuilder(
      column: $state.table.isWished,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get hideComment => $state.composableBuilder(
      column: $state.table.hideComment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$FeedTableTableTableManager get feedTable =>
      $$FeedTableTableTableManager(_db, _db.feedTable);
}
