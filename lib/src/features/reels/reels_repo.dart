import 'package:flutter_social_media_ui/src/common/services/network-service/network_helper.dart';
import 'package:flutter_social_media_ui/src/common/services/network-service/network_service.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'package:flutter_social_media_ui/src/features/reels/models/reels_model.dart';

abstract class ReelsRepository {
  Future<FeedData?> loadFeeds();
  Map queryParams({int page = 1, int limit = 10}) => {
        "page": 1,
        "limit": 10,
        "country": "United+States",
      };
}

class ReelsRepoImpl extends ReelsRepository {
  @override
  Future<FeedData?> loadFeeds() async {
    var response = await DIContainer.DI.get<NetworkService>().sendRequest(
          requestType: RequestType.get,
          url: "https://api.ulearna.com/bytes/all?.page=1&limit=10&country=United+States",
          queryParam: queryParams,
        );
    return NetworkHelper.filterResponse<FeedData>(
      callBack: (p0) {
        return [];
      },
      response: response,
      onFailureCallBackWithMessage: (p0, p1) {},
    );
  }
}
