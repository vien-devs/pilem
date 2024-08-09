import 'dart:convert';
import 'package:http/http.dart';
import 'package:pilem/core/network/json_list_response.dart';
import 'package:pilem/core/network/json_response.dart';
import 'package:pilem/core/type_defs.dart';

/// {
///  "page": 1,
///  "results": [....],
///  "total_pages": 15,
///  "total_results": 297
/// }
/// this class is the core base class to support wider scheme of response data.
/// [rawData] field is [dynamic] at this point.
/// typical implementation can
/// use [JsonResponse], [ScalarResponse] and [JsonListResponse].

class ApiResponse extends Response {
  /// response body in (assumed) JSON form
  /// null if body is not JSON

  late final Json? jsonBody = _decodeToJsonOrNull(body);

  int? get page => jsonBody?['page'];

  dynamic get rawData => jsonBody?['results'];

  int? get totalPages => jsonBody?['total_pages'];

  int? get totalResults => jsonBody?['total_results'];

  /// wrap http.Response with ApiResponse
  ApiResponse(Response response)
      : super(
          response.body,
          response.statusCode,
          request: response.request,
          headers: response.headers,
          isRedirect: response.isRedirect,
          persistentConnection: response.persistentConnection,
          reasonPhrase: response.reasonPhrase,
        );

  static JsonResponse<T> json<T>(
          Response response, T Function(Json json) cast) =>
      JsonResponse(response, cast);

  // static ScalarResponse<T> scalar<T>(Response response) =>
  //     ScalarResponse<T>(response);

  static JsonListResponse<T> jsonList<T>(
          Response response, T Function(Json json) cast) =>
      JsonListResponse(response, cast);

  // return empty Json if decode failed
  static Json? _decodeToJsonOrNull(String body) {
    try {
      return jsonDecode(body);
    } on FormatException {
      // not a JSON
      return null;
    }
  }
}
