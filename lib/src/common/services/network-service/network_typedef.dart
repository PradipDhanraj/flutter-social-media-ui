import 'package:flutter_social_media_ui/src/common/services/network-service/network_enum.dart';

typedef NetworkCallBack<R> = List<R> Function(dynamic);
typedef NetworkOnFailureCallBackWithMessage<R> = R Function(NetworkResponseErrorType, String?);
