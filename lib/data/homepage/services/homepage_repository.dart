import 'package:pilem/core/network/json_list_response.dart';
import 'package:pilem/data/homepage/movies.dart';
import 'package:pilem/data/homepage/series.dart';
import 'package:pilem/data/homepage/services/homepage_api_service.dart';
import 'package:pilem/core/network/response_extensions.dart';

class HomepageRepository {
  final HomepageApiService _apiService;

  HomepageRepository(this._apiService);

  Future<JsonListResponse<Movies>?> getNowPlayingMovies() async {
    final response = await _apiService.getNowPlayingMovies();
    if (response.isSuccess) {
      return response;
    }
    return null;
  }

  Future<JsonListResponse<Movies>?> getPopularMovies() async {
    final response = await _apiService.getPopularMovies();
    if (response.isSuccess) {
      return response;
    }
    return null;
  }

  Future<JsonListResponse<Movies>?> getTopRatedMovies() async {
    final response = await _apiService.getTopRatedMovies();
    if (response.isSuccess) {
      return response;
    }
    return null;
  }

  Future<JsonListResponse<Movies>?> getUpcomingMovies() async {
    final response = await _apiService.getUpcomingMovies();
    if (response.isSuccess) {
      return response;
    }
    return null;
  }

  ///Series
  Future<JsonListResponse<Series>?> getAiringNowSeries() async {
    final response = await _apiService.getAiringNowSeries();
    if (response.isSuccess) {
      return response;
    }
    return null;
  }

  Future<JsonListResponse<Series>?> getPopularSeries() async {
    final response = await _apiService.getPopularSeries();
    if (response.isSuccess) {
      return response;
    }
    return null;
  }

  Future<JsonListResponse<Series>?> getTopRatedSeries() async {
    final response = await _apiService.getTopRatedSeries();
    if (response.isSuccess) {
      return response;
    }
    return null;
  }
}
