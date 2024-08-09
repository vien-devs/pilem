class SearchMulti {
  bool adult;
  String? backdropPath;
  int id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  String mediaType;
  List<int>? genreIds;
  double popularity;
  String? firstAirDate;
  double? voteAverage;
  int? voteCount;
  List<String>? originCountry;
  String? title;
  String? originalTitle;
  String? releaseDate;
  bool? video;
  int? gender;
  String? knownForDepartment;
  String? profilePath;

  SearchMulti({
    required this.adult,
    this.backdropPath,
    required this.id,
    this.name,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    required this.mediaType,
    this.genreIds,
    required this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.video,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
  });

  factory SearchMulti.fromJson(Map<String, dynamic> json) => SearchMulti(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        id: json['id'],
        name: json['name'],
        originalLanguage: json['original_language'],
        originalName: json['original_name'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        mediaType: json['media_type'],
        genreIds: json['genre_ids'] == null
            ? []
            : List<int>.from(json['genre_ids']!.map((x) => x)),
        popularity: json['popularity']?.toDouble(),
        firstAirDate: json['first_air_date'],
        voteAverage: json['vote_average']?.toDouble(),
        voteCount: json['vote_count'],
        originCountry: json['origin_country'] == null
            ? []
            : List<String>.from(json['origin_country']!.map((x) => x)),
        title: json['title'],
        originalTitle: json['original_title'],
        releaseDate: json['release_date'],
        video: json['video'],
        gender: json['gender'],
        knownForDepartment: json['known_for_department'],
        profilePath: json['profile_path'],
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'id': id,
        'name': name,
        'original_language': originalLanguage,
        'original_name': originalName,
        'overview': overview,
        'poster_path': posterPath,
        'media_type': mediaType,
        'genre_ids':
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        'popularity': popularity,
        'first_air_date': firstAirDate,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'origin_country': originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        'title': title,
        'original_title': originalTitle,
        'release_date': releaseDate,
        'video': video,
        'gender': gender,
        'known_for_department': knownForDepartment,
        'profile_path': profilePath,
      };
}
