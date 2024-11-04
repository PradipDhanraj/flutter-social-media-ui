import 'package:flutter_social_media_ui/src/common/services/db-service/database.dart';

abstract class BaseDBService {
  late final AppDb _datbase;
  AppDb get db => _datbase;
  BaseDBService(AppDb database) : _datbase = database;
  // Future<int> inserData(dynamic data);
  // Future<List<T>> getAllTableData<T extends DataClass>(String tableName);
  // Future<List<T>> watchEntriesInFeed<T extends Table>(dynamic condition);
  // Future<List<T>> getDataWithWhereCondition<T extends Table>(dynamic condition);
  // Future<List<T>> updateDataWithWhereCondition<T extends Table>(dynamic condition);
}
