import 'package:flutter_social_media_ui/src/services/network-service/network_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initDependecy() {
  // network service
  locator.registerSingleton<NetworkService>(NetworkService());

  // repository service
  locator.registerSingleton<NetworkService>(NetworkService());
}
