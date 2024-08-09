import 'package:flutter/material.dart';
import 'package:pilem/core/dependency_injection/service_locator.dart';
import 'package:pilem/data/person/person_detail.dart';
import 'package:pilem/data/person/person_movie_credits.dart';
import 'package:pilem/data/person/services/person_repository.dart';

class PersonProvider extends ChangeNotifier {
  PersonProvider(String personId) {
    fetchingPerson(personId);
  }

  final _personRepo = serviceLocator.get<PersonRepository>();

  PersonDetail? personDetail;
  PersonMovieCredits? personMovieCredits;
  bool isLoading = false;

  void fetchingPerson(String personId) {
    getPersonDetail(personId);
    getPersonMovieCredits(personId);
  }

  Future<void> getPersonDetail(String personId) async {
    isLoading = true;
    var response = await _personRepo.getPersonDetail(personId);
    if (response != null) {
      personDetail = response;
      isLoading = false;
    }
    notifyListeners();
  }

  Future<void> getPersonMovieCredits(String personId) async {
    isLoading = true;
    var response = await _personRepo.getPersonMovieCredits(personId);
    if (response != null) {
      personMovieCredits = response;
      isLoading = false;
    }
    notifyListeners();
  }

  String getGender(int genderCode) {
    if (genderCode == 1) {
      return 'Female';
    } else if (genderCode == 2) {
      return 'Male';
    } else {
      return 'Not Defined';
    }
  }
}
