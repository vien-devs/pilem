import 'dart:convert';

import 'package:pilem/core/network/api_response.dart';
import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/core/network/json_list_response.dart';
import 'package:pilem/data/homepage/movies.dart';
import 'package:pilem/data/movie/response/credits_response.dart';
import 'package:pilem/data/movie/detail_movie.dart';
import 'package:pilem/data/movie/response/video_response.dart';
import 'package:pilem/data/movie/reviews_movie.dart';

class MovieApiService {
  static const _movieUrl = 'movie/';

  final CoreHttpBuilder _httpBuilder;

  MovieApiService(this._httpBuilder);

  Future<DetailMovie> getDetailsMovie(String movieId) async {
    final response =
        await _httpBuilder.movieDb(path: _movieUrl + movieId).get();
    return DetailMovie.fromJson(jsonDecode(response.body));
  }

  Future<CreditsResponse> getCreditsMovie(String movieId) async {
    final response = await _httpBuilder
        .movieDb(path: '${_movieUrl + movieId}/credits')
        .get();
    return CreditsResponse.fromJson(jsonDecode(response.body));
  }

  Future<JsonListResponse<Movies>> getRecommendationsMovie(
    String movieId,
  ) async {
    final response = await _httpBuilder
        .movieDb(path: '${_movieUrl + movieId}/recommendations')
        .get();
    return ApiResponse.jsonList(response, Movies.fromJson);
  }

  Future<JsonListResponse<Movies>> getSimilarMovie(String movieId) async {
    final response = await _httpBuilder
        .movieDb(path: '${_movieUrl + movieId}/similar')
        .get();
    return ApiResponse.jsonList(response, Movies.fromJson);
  }

  Future<JsonListResponse<ReviewsMovie>> getReviewsMovie(
    String movieId,
  ) async {
    final response = await _httpBuilder
        .movieDb(path: '${_movieUrl + movieId}/reviews')
        .get();
    return ApiResponse.jsonList(response, ReviewsMovie.fromJson);
  }

  Future<VideosReponse> getMovieVideos(
    String movieId,
  ) async {
    final response =
        await _httpBuilder.movieDb(path: '${_movieUrl + movieId}/videos').get();
    return VideosReponse.fromJson(jsonDecode(response.body));
  }
}
