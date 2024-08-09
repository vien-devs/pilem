import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/homepage/movies.dart';
import 'package:pilem/data/movie/cast_movie.dart';
import 'package:pilem/data/movie/response/credits_response.dart';
import 'package:pilem/data/movie/detail_movie.dart';
import 'package:pilem/data/movie/services/movie_repository.dart';
import 'package:pilem/data/movie/video.dart';

class MovieProvider extends ChangeNotifier {
  MovieProvider(String movieId) {
    fetchingMovie(movieId);
  }

  final movieRepo = serviceLocator.get<MovieRepository>();

  DetailMovie? movieDetail;
  CreditsResponse? movieCredits;
  List<CastMovie> movieCast = [];
  List<Movies> recommendationsMovie = [];
  List<Movies> similarMovies = [];
  Video? trailerMovie;
  bool isLoading = false;

  void fetchingMovie(String movieId) {
    getDetailMovie(movieId);
    getMovieCredits(movieId);
    getSimilarMovies(movieId);
    getMovieTrailer(movieId);
  }

  Future<void> getDetailMovie(String movieId) async {
    isLoading = true;
    var response = await movieRepo.getDetailsMovie(movieId);
    if (response != null) {
      movieDetail = response;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getMovieCredits(String movieId) async {
    isLoading = true;
    var response = await movieRepo.getCreditsMovie(movieId);
    movieCredits = response;
    movieCredits?.cast?.forEach((element) {
      if (movieCast.length < 10) {
        movieCast.add(element);
      }
    });
    isLoading = false;
    notifyListeners();
  }

  Future<void> getRecommendationsMovies(String movieId) async {
    isLoading = true;
    var response = await movieRepo.getRecommendationsMovie(movieId);
    if (response!.data!.isNotEmpty) {
      recommendationsMovie = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getSimilarMovies(String movieId) async {
    isLoading = true;
    var response = await movieRepo.getSimilarMovie(movieId);
    if (response!.data!.isNotEmpty) {
      similarMovies = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getMovieTrailer(String movieId) async {
    isLoading = true;
    var response = await movieRepo.getMovieVideos(movieId);
    if (response.results.isNotEmpty) {
      for (var element in response.results) {
        if (element.name.toLowerCase() == 'official trailer') {
          trailerMovie = element;
        }
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
