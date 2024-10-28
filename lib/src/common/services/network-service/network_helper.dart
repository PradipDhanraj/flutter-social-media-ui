import 'dart:convert';
import 'dart:io';
import 'package:flutter_social_media_ui/src/common/services/network-service/network_enum.dart';
import 'package:flutter_social_media_ui/src/common/services/network-service/network_typedef.dart';
import 'package:http/http.dart' as http;

abstract class NetworkHelper {
  String concatUrlQP(String url, Map<String, String>? queryParameters) {
    if (url.isEmpty) return url;
    if (queryParameters == null || queryParameters.isEmpty) {
      return url;
    }
    final StringBuffer stringBuffer = StringBuffer("$url?");
    queryParameters.forEach((key, value) {
      if (value.trim() == '') return;
      if (value.contains(' ')) throw Exception('Invalid Input Exception');
      stringBuffer.write('$key=$value&');
    });
    final result = stringBuffer.toString();
    return result.substring(0, result.length - 1);
  }

  R filterResponse<R>(
      {required NetworkCallBack<R> callBack,
      required http.Response? response,
      required NetworkOnFailureCallBackWithMessage onFailureCallBackWithMessage,
      CallBackParameterName parameterName = CallBackParameterName.all}) {
    try {
      if (response == null || response.body.isEmpty) {
        return onFailureCallBackWithMessage(NetworkResponseErrorType.responseEmpty, 'empty response');
      }
      if (response.statusCode == HttpStatus.ok) {
        var json = jsonDecode(response.body);
        if (_isValidResponse(json)) {
          return callBack(json);
        }
      } else if (response.statusCode == 1708) {
        return onFailureCallBackWithMessage(NetworkResponseErrorType.socket, 'socket');
      }
      return onFailureCallBackWithMessage(NetworkResponseErrorType.didNotSucceed, 'unknown');
    } catch (e) {
      return onFailureCallBackWithMessage(NetworkResponseErrorType.exception, 'Exception $e');
    }
  }

  bool _isValidResponse(json) {
    return json['statusCode'] != null && json['statusCode'] == HttpStatus.ok;
  }
}
