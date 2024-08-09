import 'package:flutter/material.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/movie/reviews_movie.dart';
import 'package:pilem/data/movie/services/movie_repository.dart';

class ReviewProvider extends ChangeNotifier {
  ReviewProvider(String movieId) {
    getReviewsMovies(movieId);
  }

  final movieRepo = serviceLocator.get<MovieRepository>();

  List<ReviewsMovie> reviewsMovie = [];

  bool isLoading = false;

  Future<void> getReviewsMovies(String movieId) async {
    isLoading = true;
    var response = await movieRepo.getReviewsMovie(movieId);
    if (response!.data!.isNotEmpty) {
      reviewsMovie = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }
}
