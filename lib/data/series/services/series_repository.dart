import 'package:pilem/core/network/json_list_response.dart';
import 'package:pilem/data/homepage/series.dart';
import 'package:pilem/data/movie/response/credits_response.dart';
import 'package:pilem/data/series/detail_series.dart';
import 'package:pilem/data/series/season_response.dart';
import 'package:pilem/data/series/services/series_api_service.dart';

class SeriesRepository {
  final SeriesApiService _apiService;

  SeriesRepository(this._apiService);

  Future<DetailSeries?> getDetailSeries(String seriesId) async {
    var response = await _apiService.getDetailSeries(seriesId);
    if (response != null) {
      return response;
    }
    return null;
  }

  Future<CreditsResponse?> getCastSeries(String seriesId) async {
    var response = await _apiService.getCastSeries(seriesId);
    if (response != null) {
      return response;
    }
    return null;
  }

  Future<JsonListResponse<Series>?> getRecommendationsSeries(
      String seriesId) async {
    var response = await _apiService.getRecommendationsSeries(seriesId);
    if (response != null) {
      return response;
    }
    return null;
  }

  Future<SeasonResponse?> getSeasonDetail(
    String seriesId,
    String seasonNumber,
  ) async {
    var response = await _apiService.getSeasonDetail(seriesId, seasonNumber);
    if (response != null) {
      return response;
    }
    return null;
  }
}
