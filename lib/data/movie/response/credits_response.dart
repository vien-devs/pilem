import 'package:pilem/data/movie/cast_movie.dart';

class CreditsResponse {
  int id;
  List<CastMovie>? cast;

  // List<Cast> crew;

  CreditsResponse({
    required this.id,
    required this.cast,
    // required this.crew,
  });

  factory CreditsResponse.fromJson(Map<String, dynamic> json) =>
      CreditsResponse(
        id: json['id'],
        cast: List<CastMovie>.from(
          json['cast'].map(
            (x) => CastMovie.fromJson(x),
          ),
        ),
        // crew: List<Cast>.from(json['crew'].map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cast': List<dynamic>.from((cast ?? []).map((x) => x.toJson())),
        // 'crew': List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}
