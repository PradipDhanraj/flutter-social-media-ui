import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/common/constants.dart';
import 'package:flutter_social_media_ui/src/common/services/network-service/network_helper.dart';
import 'package:http/http.dart';

enum RequestType { get, put, post }

abstract class NetworkService extends NetworkHelper {
  Client? _mockClient;
  set mockClientSetter(Client mc) {
    if (StaticValues.isMock) {
      _mockClient = mc;
    } else {
      _mockClient = null;
    }
  }

  Client get _client => _mockClient ?? Client();

  Map<String, String> get getHeaders => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  Future<Response>? _createRequest({
    required RequestType requestType,
    required Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    switch (requestType) {
      case RequestType.get:
        return _client.get(uri, headers: headers);
      case RequestType.put:
        return _client.put(uri, headers: headers);
      case RequestType.post:
        var jsonBody = jsonEncode(body);
        return _client.post(
          uri,
          body: jsonBody,
          headers: headers,
        );
      default:
    }
    return null;
  }

  Future<Response?>? sendRequest({
    required RequestType requestType,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? queryParam,
  }) async {
    try {
      final header = getHeaders;
      final url0 = concatUrlQP(url, queryParam);
      final response = await _createRequest(requestType: requestType, uri: Uri.parse(url0), headers: header, body: body);
      debugPrint('Response : ${response?.headers}');
      return response;
    } catch (e) {
      debugPrint('Error - $e');
      return null;
    }
  }
}
