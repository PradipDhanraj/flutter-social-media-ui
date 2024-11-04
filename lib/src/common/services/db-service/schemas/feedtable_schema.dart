import 'package:drift/drift.dart';

class FeedTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get contentId => integer()();
  IntColumn get userId => integer()();
  BoolColumn get isLiked => boolean().nullable()();
  BoolColumn get isSaved => boolean().nullable()();
  BoolColumn get isFollow => boolean().nullable()();
  BoolColumn get isWished => boolean().nullable()();
  IntColumn get hideComment => integer().nullable()();
}
