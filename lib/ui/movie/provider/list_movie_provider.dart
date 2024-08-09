import 'package:flutter/widgets.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/homepage/movies.dart';
import 'package:pilem/data/homepage/services/homepage_repository.dart';

class ListMovieProvider extends ChangeNotifier {
  ListMovieProvider(this.listType) {
    fetchData();
  }

  List<Movies> popularList = [];
  List<Movies> topRatedList = [];
  List<Movies> upcomingList = [];
  bool isLoading = false;
  String listType = '';

  final homeMovieRepo = serviceLocator.get<HomepageRepository>();

  void fetchData() {
    switch (listType) {
      case 'popular':
        getPopularMovies();
      case 'toprated':
        getTopRatedMovies();
      case 'upcoming':
        getUpcomingMovies();
    }
  }

  List<Movies> loadData() {
    switch (listType) {
      case 'popular':
        return popularList;
      case 'toprated':
        return topRatedList;
      case 'upcoming':
        return upcomingList;
      default:
        return [];
    }
  }

  String getAppbarTitle() {
    switch (listType) {
      case 'popular':
        return 'Popular Movies';
      case 'toprated':
        return 'Top Rated Movies';
      case 'upcoming':
        return 'Upcoming Movies';
      default:
        return '';
    }
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
