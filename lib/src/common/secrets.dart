import 'package:flutter/services.dart';
import 'package:flutter_social_media_ui/src/features/feeds/models/feeds_model.dart';

class EnvironmentSecretsService {
  static Future<FeedData> appSecretService() async {
    final response = await rootBundle.loadString("assets/json/dummy.json");
    FeedData secrets = feedFromJson(response);
    return FeedData.fromJson(secrets.toJson());
  }
}