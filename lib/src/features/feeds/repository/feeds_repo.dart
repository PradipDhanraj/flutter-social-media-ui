import 'package:flutter_social_media_ui/src/common/constants.dart';
import 'package:flutter_social_media_ui/src/common/services/network-service/network_service.dart';
import 'package:flutter_social_media_ui/src/features/feeds/models/feeds_model.dart';

abstract class ReelsRepository extends NetworkService {
  Future<FeedData?> loadFeeds({int page = 1, int limit = 10});
  Map<String, String> getParams(int page, int limit) {
    return {
      "page": '$page',
      "limit": '$limit',
      "country": "United+States",
    };
  }
}

class ReelsRepoImpl extends ReelsRepository {
  @override
  Future<FeedData?> loadFeeds({int page = 1, int limit = 10}) async {
    var response = await sendRequest(
      requestType: RequestType.get,
      url: '${AppConstants.apiUrl}/${APIPath.reelsPath}',
      queryParam: getParams(page, limit),
    );
    return filterResponse<FeedData>(
      callBack: (data) {
        return FeedData.fromJson(data);
      },
      response: response,
      onFailureCallBackWithMessage: (type, message) {
        return null;
      },
    );
  }
}
