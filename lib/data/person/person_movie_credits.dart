import 'package:pilem/data/person/cast_credits.dart';

class PersonMovieCredits {
  List<CastCredits> cast;
  int id;

  PersonMovieCredits({
    required this.cast,
    required this.id,
  });

  factory PersonMovieCredits.fromJson(Map<String, dynamic> json) =>
      PersonMovieCredits(
        cast: List<CastCredits>.from(
          json['cast'].map((x) => CastCredits.fromJson(x)),
        ),
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'cast': List<dynamic>.from(
          cast.map((x) => x.toJson()),
        ),
        'id': id,
      };
}
