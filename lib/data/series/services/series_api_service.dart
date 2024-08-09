import 'dart:convert';

import 'package:pilem/core/network/api_response.dart';
import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/core/network/json_list_response.dart';
import 'package:pilem/data/homepage/series.dart';
import 'package:pilem/data/movie/response/credits_response.dart';
import 'package:pilem/data/series/detail_series.dart';
import 'package:pilem/data/series/season_response.dart';

class SeriesApiService {
  final CoreHttpBuilder _httpBuilder;

  SeriesApiService(this._httpBuilder);

  static const _seriesUrl = 'tv/';

  Future<DetailSeries?> getDetailSeries(String seriesId) async {
    var response =
        await _httpBuilder.movieDb(path: _seriesUrl + seriesId).get();
    return DetailSeries.fromJson(jsonDecode(response.body));
  }

  Future<CreditsResponse?> getCastSeries(String seriesId) async {
    var response =
        await _httpBuilder.movieDb(path: '$_seriesUrl$seriesId/credits').get();
    return CreditsResponse.fromJson(jsonDecode(response.body));
  }

  Future<JsonListResponse<Series>?> getRecommendationsSeries(
      String seriesId) async {
    var response = await _httpBuilder
        .movieDb(path: '$_seriesUrl$seriesId/recommendations')
        .get();
    return ApiResponse.jsonList(response, Series.fromJson);
  }

  Future<SeasonResponse?> getSeasonDetail(
    String seriesId,
    String seasonNumber,
  ) async {
    var response = await _httpBuilder
        .movieDb(path: '$_seriesUrl$seriesId/season/$seasonNumber')
        .get();
    return SeasonResponse.fromJson(jsonDecode(response.body));
  }
}
