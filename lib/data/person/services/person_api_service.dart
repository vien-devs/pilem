import 'dart:convert';

import 'package:pilem/core/network/http/core_http_builder.dart';
import 'package:pilem/data/person/person_detail.dart';
import 'package:pilem/data/person/person_movie_credits.dart';

class PersonApiService {
  PersonApiService(this._httpBuilder);

  final CoreHttpBuilder _httpBuilder;

  static const _personUrl = 'person/';

  Future<PersonDetail?> getPersonDetail(String personId) async {
    final response =
        await _httpBuilder.movieDb(path: _personUrl + personId).get();
    return PersonDetail.fromJson(jsonDecode(response.body));
  }

  Future<PersonMovieCredits?> getPersonMovieCredits(String personId) async {
    final response = await _httpBuilder
        .movieDb(path: '${_personUrl + personId}/movie_credits')
        .get();
    return PersonMovieCredits.fromJson(jsonDecode(response.body));
  }
}
