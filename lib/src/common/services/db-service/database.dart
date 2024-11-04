import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/schemas/feedtable_schema.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
part 'database.g.dart';

@DriftDatabase(tables: [FeedTable])
class AppDb extends _$AppDb {
  static const String dbName = "db.sqlite";
  AppDb() : super(_openConnection(dbName));

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection(String dbName) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, dbName));
    return NativeDatabase.createInBackground(file);
  });
}
