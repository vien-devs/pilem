import 'package:pilem/data/movie/author_details.dart';

class ReviewsMovie {
  String author;
  AuthorDetails authorDetails;
  String content;
  String createdAt;
  String id;
  String updatedAt;
  String url;

  ReviewsMovie({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory ReviewsMovie.fromJson(Map<String, dynamic> json) => ReviewsMovie(
        author: json['author'],
        authorDetails: AuthorDetails.fromJson(json['author_details']),
        content: json['content'],
        createdAt: json['created_at'],
        id: json['id'],
        updatedAt: json['updated_at'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'author': author,
        'author_details': authorDetails.toJson(),
        'content': content,
        'created_at': createdAt,
        'id': id,
        'updated_at': updatedAt,
        'url': url,
      };
}
