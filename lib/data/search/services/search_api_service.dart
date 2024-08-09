import 'package:pilem/core/network/api_response.dart';
import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/core/network/json_list_response.dart';
import 'package:pilem/data/search/search_result.dart';

class SearchApiService {
  SearchApiService(this._httpBuilder);

  final CoreHttpBuilder _httpBuilder;
  static const _searchUrl = 'search/';
  // static const _searchMovieUrl = '${_searchUrl}movie';
  // static const _searchSeriesUrl = '${_searchUrl}tv';

  Future<JsonListResponse<SearchResult>?> searchMovie(
    String searchType,
    String querySearch,
  ) async {
    final queryParams = {
      'query': querySearch,
    };

    final response = await _httpBuilder
        .movieDb(
          path: _searchUrl + searchType,
          query: queryParams,
        )
        .get();
    return ApiResponse.jsonList(response, SearchResult.fromJson);
  }
}
