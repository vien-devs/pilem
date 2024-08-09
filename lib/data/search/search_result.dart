class SearchResult {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  List<String>? originCountry;
  String originalLanguage;
  String? originalTitle;
  String? originalName;
  String overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  String? firstAirDate;
  String? title;
  String? name;
  bool? video;
  double voteAverage;
  int voteCount;

  SearchResult({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.firstAirDate,
    required this.title,
    required this.name,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
        id: json['id'],
        originCountry: json['origin_country'] == null
            ? []
            : List<String>.from(json['origin_country']!.map((x) => x)),
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        originalName: json['original_name'],
        overview: json['overview'],
        popularity: json['popularity']?.toDouble(),
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        firstAirDate: json['first_air_date'],
        title: json['title'],
        name: json['name'],
        video: json['video'],
        voteAverage: json['vote_average']?.toDouble(),
        voteCount: json['vote_count'],
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
        'id': id,
        'origin_country': originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'original_name': originalName,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'first_air_date': firstAirDate,
        'title': title,
        'name': name,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
