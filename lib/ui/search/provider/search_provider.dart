import 'package:flutter/material.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/search/search_result.dart';
import 'package:pilem/data/search/search_util.dart';
import 'package:pilem/data/search/services/search_repository.dart';

class SearchProvider extends ChangeNotifier {
  SearchProvider();

  final searchRepo = serviceLocator.get<SearchRepository>();

  List<SearchResult> resultsSearch = [];
  bool isLoading = false;
  String searchType = SearchType.movie.name;
  List<FilterSearch> filterSearch = [
    FilterSearch(name: 'Movie', value: SearchType.movie.name),
    FilterSearch(name: 'Series', value: SearchType.tv.name),
  ];

  Future<void> searchMovie(String query) async {
    isLoading = true;
    notifyListeners();
    var response = await searchRepo.searchMovie(searchType, query);
    if (response != null) {
      resultsSearch = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> setSearchType(String type) async {
    searchType = type;
    notifyListeners();
  }

  void clearListResult() {
    resultsSearch = [];
    notifyListeners();
  }
}

enum SearchType {
  movie,
  tv,
  // person,
}
