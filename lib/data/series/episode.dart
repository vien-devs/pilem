class Episode {
  String airDate;
  int episodeNumber;
  String episodeType;
  int id;
  String name;
  String overview;
  String productionCode;
  int? runtime;
  int seasonNumber;
  int showId;
  String? stillPath;
  double voteAverage;
  int voteCount;
  // List<Crew> crew;
  // List<Crew> guestStars;

  Episode({
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
    // required this.crew,
    // required this.guestStars,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        airDate: json['air_date'],
        episodeNumber: json['episode_number'],
        episodeType: json['episode_type'],
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        productionCode: json['production_code'],
        runtime: json['runtime'],
        seasonNumber: json['season_number'],
        showId: json['show_id'],
        stillPath: json['still_path'],
        voteAverage: json['vote_average']?.toDouble(),
        voteCount: json['vote_count'],
        // crew: List<Crew>.from(json['crew'].map((x) => Crew.fromJson(x))),
        // guestStars:
        //    List<Crew>.from(json['guest_stars'].map((x) => Crew.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'air_date': airDate,
        'episode_number': episodeNumber,
        'episode_type': episodeType,
        'id': id,
        'name': name,
        'overview': overview,
        'production_code': productionCode,
        'runtime': runtime,
        'season_number': seasonNumber,
        'show_id': showId,
        'still_path': stillPath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        // 'crew': List<dynamic>.from(crew.map((x) => x.toJson())),
        // 'guest_stars': List<dynamic>.from(guestStars.map((x) => x.toJson())),
      };
}
