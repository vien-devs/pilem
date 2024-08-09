import 'dart:async';
import 'dart:convert';

import 'package:alice/alice.dart';
import 'package:flutter/cupertino.dart';
import 'package:pilem/core/network/exception/no_connectivity_exception.dart';
import 'package:alice/core/alice_http_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:pilem/core/network/repository/core_http_repository.dart';

// This is created via [CoreHttpBuilder] object.
// The actual HTTP method call reside in this object.
class CoreHttpClient {
  final Future<Uri> _uri;
  final Map<String, String> _additionalHeaders;
  final http.Client Function() _httpClient;
  final Alice _httpInspector;
  final CoreHttpRepository _coreHttpRepository;

  CoreHttpClient(
    this._uri,
    this._additionalHeaders,
    this._httpClient,
    this._httpInspector,
    this._coreHttpRepository,
  );

  Future<http.Response> post<T extends Object>([T? body]) async {
    var client = _httpClient();
    try {
      var uri = await _uri;
      var headers = await _httpHeaders();

      var response = client
          .post(uri, headers: headers, body: jsonEncode(body))
          .interceptWithAlice(_httpInspector)
          .onError((error, stackTrace) {
        throw NoConnectivityException();
      });
      return response;
    } finally {
      client.close();
    }
  }

  Future<http.Response> get<T extends Object>() async {
    var client = _httpClient();
    try {
      var uri = await _uri;
      var headers = await _httpHeaders();
      debugPrint('ini urinya $uri');
      var response = await client
          .get(uri, headers: headers)
          .interceptWithAlice(_httpInspector)
          .onError((error, stackTrace) {
        throw 'error nih $error';
      }).whenComplete(() => client.close());

      return response;
    } finally {
      client.close();
    }
  }

  // Future<http.Response> put<T>([T? body]) async {
  //   var client = _httpClient();
  //   try {
  //     var uri = await _uri;
  //     var headers = await _httpHeaders();
  //
  //     var response = await client
  //         .put(uri, headers: headers, body: jsonEncode(body))
  //         .interceptWithAlice(_httpInspector)
  //         .onError((error, stackTrace) {
  //       throw NoConnectivityException();
  //     });
  //
  //     return response;
  //   } finally {
  //     client.close();
  //   }
  // }
  //
  // Future<http.Response> patch<T extends Object>([T? body]) async {
  //   var client = _httpClient();
  //   try {
  //     var uri = await _uri;
  //     var headers = await _httpHeaders();
  //
  //     var response = await client
  //         .patch(uri, headers: headers, body: jsonEncode(body))
  //         .interceptWithAlice(_httpInspector)
  //         .onError((error, stackTrace) {
  //       throw NoConnectivityException();
  //     });
  //
  //     return response;
  //   } finally {
  //     client.close();
  //   }
  // }
  //
  // Future<http.Response> delete<T extends Object>([T? body]) async {
  //   var client = _httpClient();
  //   try {
  //     var uri = await _uri;
  //     var headers = await _httpHeaders();
  //
  //     var response = await client
  //         .delete(uri, headers: headers, body: jsonEncode(body))
  //         .interceptWithAlice(_httpInspector)
  //         .onError((error, stackTrace) {
  //       throw NoConnectivityException();
  //     });
  //
  //     return response;
  //   } finally {
  //     client.close();
  //   }
  // }
  //
  // Future<http.StreamedResponse> postMultipart({
  //   Map<String, String> fields = const {},
  //   List<http.MultipartFile> files = const [],
  // }) async {
  //   var uri = await _uri;
  //   var headers = await _httpHeaders();
  //
  //   final multipartRequest = http.MultipartRequest('POST', uri)
  //     ..headers.addAll(headers)
  //     ..headers[HttpHeaders.contentTypeHeader] = 'multipart/form-data'
  //     ..fields.addAll(fields)
  //     ..files.addAll(files);
  //
  //   return await multipartRequest.send();
  // }

  Future<Map<String, String>> _httpHeaders() async {
    final Map<String, String> headers = Map.from(_additionalHeaders);

    final accessToken = _coreHttpRepository
        .getToken()
        .then((token) => headers['Authorization'] = 'Bearer $token');

    // final sessionTokenFuture = _coreHttpRepository
    //     .getSessionToken()
    //     .then((sessionToken) => headers['SessionToken'] = sessionToken);

    await Future.wait([accessToken]);
    return headers;
  }
}
