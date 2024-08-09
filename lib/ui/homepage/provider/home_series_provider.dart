import 'package:flutter/material.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/homepage/series.dart';
import 'package:pilem/data/homepage/services/homepage_repository.dart';

class HomeSeriesProvider extends ChangeNotifier {
  HomeSeriesProvider() {
    fetchSeriesData();
  }

  final _homeRepo = serviceLocator.get<HomepageRepository>();

  List<Series> nowAiringList = [];
  List<Series> popularList = [];
  List<Series> topRatedList = [];
  bool isLoading = false;

  void fetchSeriesData() {
    getAiringNowSeries();
    getPopularSeries();
    getTopRatedSeries();
  }

  Future<void> getAiringNowSeries() async {
    isLoading = true;
    var response = await _homeRepo.getAiringNowSeries();
    if (response!.data!.isNotEmpty) {
      nowAiringList = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getPopularSeries() async {
    isLoading = true;
    var response = await _homeRepo.getPopularSeries();
    if (response!.data!.isNotEmpty) {
      popularList = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getTopRatedSeries() async {
    isLoading = true;
    var response = await _homeRepo.getTopRatedSeries();
    if (response!.data!.isNotEmpty) {
      topRatedList = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }
}
