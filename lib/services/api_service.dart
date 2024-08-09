import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:alice/alice.dart';
import 'package:alice/core/alice_http_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:pilem/core/network/api_response.dart';
import 'package:pilem/core/network/json_list_response.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/homepage/movies.dart';
import 'package:pilem/data/homepage/series.dart';
import 'package:pilem/data/movie/response/credits_response.dart';
import 'package:pilem/data/movie/detail_movie.dart';
import 'package:pilem/data/movie/reviews_movie.dart';
import 'package:pilem/data/person/person_detail.dart';
import 'package:pilem/data/person/person_movie_credits.dart';
import 'package:pilem/data/search/search_result.dart';
import 'package:pilem/data/series/detail_series.dart';

class ApiService {
  static const _baseUrl = 'https://api.themoviedb.org/3/';

  /// Movie API
  static const _moviesBaseUrl = '${_baseUrl}movie/';
  static const _popularMovies = '${_moviesBaseUrl}popular';
  static const _nowPlayingMovies = '${_moviesBaseUrl}now_playing';
  static const _topRatedMovies = '${_moviesBaseUrl}top_rated';
  static const _upcomingMovies = '${_moviesBaseUrl}upcoming';

  /// Series API
  static const _seriesBaseUrl = '${_baseUrl}tv/';
  static const _airingSeries = '${_seriesBaseUrl}airing_today';
  static const _popularSeries = '${_seriesBaseUrl}popular';
  static const _topRatedSeries = '${_seriesBaseUrl}top_rated';

  /// Person API
  static const _personBaseUrl = '${_baseUrl}person/';

  /// Search API
  static const _searchBaseUrl = '${_baseUrl}search/';

  final Map<String, String> _requestHeaders = {
    HttpHeaders.authorizationHeader: 'Bearer ',
    HttpHeaders.acceptHeader: 'application/json',
  };

  Alice alice = Alice(
    navigatorKey: serviceLocator.get(),
    showNotification: true,
    showInspectorOnShake: true,
  );

  ///Movies
  Future<JsonListResponse<Movies>?> getNowPlayingMovies() async {
    try {
      var url = Uri.parse(_nowPlayingMovies);
      var response = await http
          .get(url, headers: _requestHeaders)
          .interceptWithAlice(alice);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, Movies.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<JsonListResponse<Movies>?> getPopularMovies() async {
    try {
      var url = Uri.parse(_popularMovies);
      var response = await http
          .get(url, headers: _requestHeaders)
          .interceptWithAlice(alice);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, Movies.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<JsonListResponse<Movies>?> getTopRatedMovies() async {
    try {
      var url = Uri.parse(_topRatedMovies);
      var response = await http
          .get(url, headers: _requestHeaders)
          .interceptWithAlice(alice);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, Movies.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<JsonListResponse<Movies>?> getUpcomingMovies() async {
    try {
      var url = Uri.parse(_upcomingMovies);
      var response = await http
          .get(url, headers: _requestHeaders)
          .interceptWithAlice(alice);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, Movies.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<DetailMovie?> getDetailsMovie(String movieId) async {
    try {
      var url = Uri.parse(_moviesBaseUrl + movieId);
      var response = await http.get(url, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return DetailMovie.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<CreditsResponse?> getCreditsMovie(String movieId) async {
    try {
      var url = Uri.parse('${_moviesBaseUrl + movieId}/credits');
      var response = await http.get(url, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return CreditsResponse.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<JsonListResponse<Movies>?> getRecommendationsMovie(
      String movieId) async {
    try {
      var url = Uri.parse('${_moviesBaseUrl + movieId}/recommendations');
      var response = await http.get(url, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, Movies.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<JsonListResponse<Movies>?> getSimilarMovie(String movieId) async {
    try {
      var url = Uri.parse('${_moviesBaseUrl + movieId}/similar');
      var response = await http.get(url, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, Movies.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<JsonListResponse<ReviewsMovie>?> getReviewsMovie(
      String movieId) async {
    try {
      var url = Uri.parse('${_moviesBaseUrl + movieId}/reviews');
      var response = await http.get(url, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, ReviewsMovie.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  ///Series
  Future<JsonListResponse<Series>?> getAiringTodaySeries() async {
    try {
      var url = Uri.parse(_airingSeries);
      var response = await http.get(url, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, Series.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<JsonListResponse<Series>?> getPopularSeries() async {
    try {
      var url = Uri.parse(_popularSeries);
      var response = await http.get(url, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, Series.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<JsonListResponse<Series>?> getTopRatedSeries() async {
    try {
      var url = Uri.parse(_topRatedSeries);
      var response = await http.get(url, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, Series.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<DetailSeries?> getDetailSeries(String seriesId) async {
    try {
      var url = Uri.parse(_seriesBaseUrl + seriesId);
      var response = await http
          .get(url, headers: _requestHeaders)
          .interceptWithAlice(alice);

      if (response.statusCode == 200) {
        return DetailSeries.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  ///Person
  Future<PersonDetail?> getPersonDetail(String personId) async {
    try {
      var url = Uri.parse(_personBaseUrl + personId);
      var response = await http.get(url, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return PersonDetail.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<PersonMovieCredits?> getPersonMovieCredits(String personId) async {
    try {
      var url = Uri.parse('$_personBaseUrl$personId/movie_credits');
      var response = await http.get(url, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return PersonMovieCredits.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  ///Search

  Future<JsonListResponse<SearchResult>?> searchMovie(
      String querySearch) async {
    try {
      var url = Uri.parse('$_searchBaseUrl/movie');
      var queryParams = {'query': querySearch};
      var queriedUrl = url.replace(queryParameters: queryParams);

      var response = await http.get(queriedUrl, headers: _requestHeaders);

      if (response.statusCode == 200) {
        return ApiResponse.jsonList(response, SearchResult.fromJson);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
