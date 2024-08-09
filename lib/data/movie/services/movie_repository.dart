import 'package:pilem/core/network/json_list_response.dart';
import 'package:pilem/core/network/response_extensions.dart';
import 'package:pilem/data/homepage/movies.dart';
import 'package:pilem/data/movie/response/credits_response.dart';
import 'package:pilem/data/movie/detail_movie.dart';
import 'package:pilem/data/movie/response/video_response.dart';
import 'package:pilem/data/movie/reviews_movie.dart';
import 'package:pilem/data/movie/services/movie_api_service.dart';

class MovieRepository {
  final MovieApiService _movieApiService;

  MovieRepository(this._movieApiService);

  Future<DetailMovie?> getDetailsMovie(String movieId) async {
    final response = await _movieApiService.getDetailsMovie(movieId);
    return response;
  }

  Future<CreditsResponse> getCreditsMovie(String movieId) async {
    final response = await _movieApiService.getCreditsMovie(movieId);
    return response;
  }

  Future<JsonListResponse<Movies>?> getRecommendationsMovie(
    String movieId,
  ) async {
    final response = await _movieApiService.getRecommendationsMovie(movieId);
    if (response.isSuccess) {
      return response;
    }
    return null;
  }

  Future<JsonListResponse<Movies>?> getSimilarMovie(String movieId) async {
    final response = await _movieApiService.getSimilarMovie(movieId);
    if (response.isSuccess) {
      return response;
    }
    return null;
  }

  Future<JsonListResponse<ReviewsMovie>?> getReviewsMovie(
    String movieId,
  ) async {
    final response = await _movieApiService.getReviewsMovie(movieId);
    if (response.isSuccess) {
      return response;
    }
    return null;
  }

  Future<VideosReponse> getMovieVideos(
    String movieId,
  ) async {
    final response = await _movieApiService.getMovieVideos(movieId);
    return response;
  }
}
