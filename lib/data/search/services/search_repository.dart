import 'package:pilem/core/network/json_list_response.dart';
import 'package:pilem/data/search/search_result.dart';
import 'package:pilem/data/search/services/search_api_service.dart';

class SearchRepository {
  SearchRepository(this._apiService);

  final SearchApiService _apiService;

  Future<JsonListResponse<SearchResult>?> searchMovie(
    String searchType,
    String querySearch,
  ) async {
    final response = await _apiService.searchMovie(searchType, querySearch);
    return response;
  }
}
