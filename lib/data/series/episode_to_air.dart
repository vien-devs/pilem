class EpisodeToAir {
  int id;
  String name;
  String overview;
  double voteAverage;
  int voteCount;
  String airDate;
  int episodeNumber;
  String episodeType;
  String productionCode;
  int? runtime;
  int seasonNumber;
  int showId;
  String? stillPath;

  EpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  factory EpisodeToAir.fromJson(Map<String, dynamic> json) => EpisodeToAir(
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        voteAverage: json['vote_average']?.toDouble(),
        voteCount: json['vote_count'],
        airDate: json['air_date'],
        episodeNumber: json['episode_number'],
        episodeType: json['episode_type'],
        productionCode: json['production_code'],
        runtime: json['runtime'],
        seasonNumber: json['season_number'],
        showId: json['show_id'],
        stillPath: json['still_path'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'overview': overview,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'air_date': airDate,
        'episode_number': episodeNumber,
        'episode_type': episodeType,
        'production_code': productionCode,
        'runtime': runtime,
        'season_number': seasonNumber,
        'show_id': showId,
        'still_path': stillPath,
      };
}
