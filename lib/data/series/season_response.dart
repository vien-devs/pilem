import 'package:pilem/data/series/episode.dart';

class SeasonResponse {
  String id;
  String? airDate;
  List<Episode> episodes;
  String name;
  String overview;
  int seasonResponseId;
  String? posterPath;
  int seasonNumber;
  double voteAverage;

  SeasonResponse({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.seasonResponseId,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory SeasonResponse.fromJson(Map<String, dynamic> json) => SeasonResponse(
        id: json['_id'],
        airDate: json['air_date'],
        episodes: List<Episode>.from(
          json['episodes'].map(
            (x) => Episode.fromJson(x),
          ),
        ),
        name: json['name'],
        overview: json['overview'],
        seasonResponseId: json['id'],
        posterPath: json['poster_path'],
        seasonNumber: json['season_number'],
        voteAverage: json['vote_average']?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'air_date': airDate,
        'episodes': List<dynamic>.from(
          episodes.map(
            (x) => x.toJson(),
          ),
        ),
        'name': name,
        'overview': overview,
        'id': seasonResponseId,
        'poster_path': posterPath,
        'season_number': seasonNumber,
        'vote_average': voteAverage,
      };
}
