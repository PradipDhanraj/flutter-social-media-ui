import 'package:flutter_social_media_ui/src/features/feeds/repository/feeds_repo.dart';
import 'package:get_it/get_it.dart';

class DIContainer {
  DIContainer._();

  // ignore: non_constant_identifier_names
  static get DI => GetIt.instance;

  static loadDependencies() {
    // repository service
    DI.registerSingleton<ReelsRepository>(ReelsRepoImpl());
  }
}
