import 'package:flutter/material.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/homepage/series.dart';
import 'package:pilem/data/movie/cast_movie.dart';
import 'package:pilem/data/movie/response/credits_response.dart';
import 'package:pilem/data/series/detail_series.dart';
import 'package:pilem/data/series/season_response.dart';
import 'package:pilem/data/series/services/series_repository.dart';

class SeriesProvider extends ChangeNotifier {
  SeriesProvider(String seriesId) {
    fetchSeries(seriesId);
  }

  final _seriesRepo = serviceLocator.get<SeriesRepository>();

  DetailSeries? detailSeries;
  CreditsResponse? seriesCredit;
  List<CastMovie> seriesCast = [];
  List<Series> recommendationSeries = [];
  SeasonResponse? seasonDetail;
  bool isLoading = false;
  String idSeries = '';

  void fetchSeries(String seriesId) {
    getDetailSeries(seriesId);
    getCastSeries(seriesId);
    getRecommendationsSeries(seriesId);
    getSeasonDetail(seriesId, '1');
  }

  Future<void> getDetailSeries(String seriesId) async {
    isLoading = true;
    var response = await _seriesRepo.getDetailSeries(seriesId);
    detailSeries = response;
    idSeries = seriesId;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getCastSeries(String seriesId) async {
    isLoading = true;
    var response = await _seriesRepo.getCastSeries(seriesId);
    seriesCredit = response;
    seriesCredit?.cast?.forEach((element) {
      if (seriesCast.length < 10) {
        seriesCast.add(element);
      }
    });
    isLoading = false;
    notifyListeners();
  }

  Future<void> getRecommendationsSeries(String seriesId) async {
    isLoading = true;
    var response = await _seriesRepo.getRecommendationsSeries(seriesId);
    if (response!.data!.isNotEmpty) {
      recommendationSeries = response.data!;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getSeasonDetail(String seriesId, String seasonNumber) async {
    isLoading = true;
    var response = await _seriesRepo.getSeasonDetail(seriesId, seasonNumber);
    seasonDetail = response;
    isLoading = false;
    notifyListeners();
  }
}
