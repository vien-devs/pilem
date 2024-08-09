import 'package:pilem/data/movie/video.dart';

class VideosReponse {
  int id;
  List<Video> results;

  VideosReponse({
    required this.id,
    required this.results,
  });

  factory VideosReponse.fromJson(Map<String, dynamic> json) => VideosReponse(
        id: json['id'],
        results: List<Video>.from(
          json['results'].map(
            (x) => Video.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'results': List<dynamic>.from(
          results.map(
            (x) => x.toJson(),
          ),
        ),
      };
}
