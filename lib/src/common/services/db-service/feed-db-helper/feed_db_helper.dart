import 'package:drift/drift.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/base_db_service.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/database.dart';

class FeedTableDBHelper extends BaseDBService {
  FeedTableDBHelper(super._database);

  Future<int> inserData<T extends Table>(FeedTableCompanion data) {
    return db.into(db.feedTable).insert(
          data,
          mode: InsertMode.insert,
        );
  }

  Future<List<FeedTableData>> getAllTableData() {
    return db.select(db.feedTable).get();
  }

  Future<FeedTableData?> getSingleOrNull(Expression<bool> Function($FeedTableTable) filter) {
    return (db.select(db.feedTable)
          ..where(filter)
          ..limit(1))
        .getSingleOrNull();
  }

  Stream<List<FeedTableData>> watchEntriesInFeed<T extends Table>(condition) {
    return db.select(db.feedTable).watch();
  }

  Future<int> deleteEntry(int id) {
    return (db.delete(db.feedTable)..where((t) => t.id.isValue(id))).go();
  }

  Future<int> updateDataWithWhereCondition(
    Expression<bool> Function($FeedTableTable) filter,
    FeedTableCompanion data,
  ) {
    try {
      return (db.update(db.feedTable)..where(filter)).write(data);
    } catch (e) {
      throw Exception(e);
    }
    // return db.update(db.feedTable)
    //   ..where((t) => t.name.equals("John Doe"))
    //   ..write(EmployeeCompanion(
    //     post: Value("Assistant Manager"),
    //   ));
  }
}
