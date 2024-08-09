import 'package:flutter/material.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/homepage/movies.dart';
import 'package:pilem/data/homepage/services/homepage_repository.dart';

class HomeMoviesProvider extends ChangeNotifier {
  HomeMoviesProvider() {
    fetchMoviesData();
  }

  final homeMovieRepo = serviceLocator.get<HomepageRepository>();

  List<Movies> nowPlayingList = [];
  List<Movies> popularList = [];
  List<Movies> topRatedList = [];
  List<Movies> upcomingList = [];
  bool isLoading = false;

  void fetchMoviesData() {
    getNowPlayingMovies();
    getPopularMovies();
    getTopRatedMovies();
    getUpcomingMovies();
  }

  Future<void> getNowPlayingMovies() async {
    isLoading = true;
    var response = await homeMovieRepo.getNowPlayingMovies();
    if (response!.data!.isNotEmpty) {
      nowPlayingList = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getPopularMovies() async {
    isLoading = true;
    var response = await homeMovieRepo.getPopularMovies();
    if (response!.data!.isNotEmpty) {
      popularList = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getTopRatedMovies() async {
    isLoading = true;
    var response = await homeMovieRepo.getTopRatedMovies();
    if (response!.data!.isNotEmpty) {
      topRatedList = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getUpcomingMovies() async {
    isLoading = true;
    var response = await homeMovieRepo.getUpcomingMovies();
    if (response!.data!.isNotEmpty) {
      upcomingList = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }
}
