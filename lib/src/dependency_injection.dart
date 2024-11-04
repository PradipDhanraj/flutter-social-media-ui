import 'package:drift/drift.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/database.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/base_db_service.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/feed-db-helper/feed_db_helper.dart';
import 'package:flutter_social_media_ui/src/features/feeds/repository/feeds_repo.dart';
import 'package:get_it/get_it.dart';

class DIContainer {
  DIContainer._();

  // ignore: non_constant_identifier_names
  static GetIt get DI => GetIt.instance;

  static loadDependencies() {
    // instances
    var db = AppDb();

    // repositories
    DI.registerSingleton<ReelsRepository>(ReelsRepoImpl());

    // services
    DI.registerSingleton<FeedTableDBHelper>(FeedTableDBHelper(db));
  }
}
