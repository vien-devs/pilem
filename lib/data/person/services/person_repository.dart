import 'package:pilem/data/person/person_detail.dart';
import 'package:pilem/data/person/person_movie_credits.dart';
import 'package:pilem/data/person/services/person_api_service.dart';

class PersonRepository {
  PersonRepository(this._apiService);

  final PersonApiService _apiService;

  Future<PersonDetail?> getPersonDetail(String personId) async {
    final response = await _apiService.getPersonDetail(personId);
    return response;
  }

  Future<PersonMovieCredits?> getPersonMovieCredits(String personId) async {
    final response = await _apiService.getPersonMovieCredits(personId);
    return response;
  }
}
