class PersonDetail {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  String? birthday;
  String? deathDay;
  int gender;
  String? homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String? placeOfBirth;
  double popularity;
  String? profilePath;

  PersonDetail({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathDay,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  factory PersonDetail.fromJson(Map<String, dynamic> json) => PersonDetail(
        adult: json['adult'],
        alsoKnownAs: List<String>.from(json['also_known_as'].map((x) => x)),
        biography: json['biography'],
        birthday: json['birthday'],
        deathDay: json['deathday'],
        gender: json['gender'],
        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdb_id'],
        knownForDepartment: json['known_for_department'],
        name: json['name'],
        placeOfBirth: json['place_of_birth'],
        popularity: json['popularity']?.toDouble(),
        profilePath: json['profile_path'],
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'also_known_as': List<dynamic>.from(alsoKnownAs.map((x) => x)),
        'biography': biography,
        'birthday': birthday,
        'deathday': deathDay,
        'gender': gender,
        'homepage': homepage,
        'id': id,
        'imdb_id': imdbId,
        'known_for_department': knownForDepartment,
        'name': name,
        'place_of_birth': placeOfBirth,
        'popularity': popularity,
        'profile_path': profilePath,
      };
}
