import 'package:pilem/core/network/api_response.dart';
import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/core/network/json_list_response.dart';
import 'package:pilem/data/homepage/movies.dart';
import 'package:pilem/data/homepage/series.dart';

class HomepageApiService {
  ///Movies
  static const _popularMovies = 'movie/popular';
  static const _nowPlayingMovies = 'movie/now_playing';
  static const _topRatedMovies = 'movie/top_rated';
  static const _upcomingMovies = 'movie/upcoming';

  ///Series
  static const _airingSeries = 'tv/airing_today';
  static const _popularSeries = 'tv/popular';
  static const _topRatedSeries = 'tv/top_rated';

  final CoreHttpBuilder _httpBuilder;

  HomepageApiService(this._httpBuilder);

  Future<JsonListResponse<Movies>> getNowPlayingMovies() async {
    final response = await _httpBuilder.movieDb(path: _nowPlayingMovies).get();
    return ApiResponse.jsonList(response, Movies.fromJson);
  }

  Future<JsonListResponse<Movies>> getPopularMovies() async {
    final response = await _httpBuilder.movieDb(path: _popularMovies).get();
    return ApiResponse.jsonList(response, Movies.fromJson);
  }

  Future<JsonListResponse<Movies>> getTopRatedMovies() async {
    final response = await _httpBuilder.movieDb(path: _topRatedMovies).get();
    return ApiResponse.jsonList(response, Movies.fromJson);
  }

  Future<JsonListResponse<Movies>> getUpcomingMovies() async {
    final response = await _httpBuilder.movieDb(path: _upcomingMovies).get();
    return ApiResponse.jsonList(response, Movies.fromJson);
  }

  ///Series
  Future<JsonListResponse<Series>> getAiringNowSeries() async {
    final response = await _httpBuilder.movieDb(path: _airingSeries).get();
    return ApiResponse.jsonList(response, Series.fromJson);
  }

  Future<JsonListResponse<Series>> getPopularSeries() async {
    var response = await _httpBuilder.movieDb(path: _popularSeries).get();
    return ApiResponse.jsonList(response, Series.fromJson);
  }

  Future<JsonListResponse<Series>> getTopRatedSeries() async {
    var response = await _httpBuilder.movieDb(path: _topRatedSeries).get();
    return ApiResponse.jsonList(response, Series.fromJson);
  }
}
