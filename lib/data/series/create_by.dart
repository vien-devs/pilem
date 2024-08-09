class CreatedBy {
  int id;
  String creditId;
  String name;
  int gender;
  String? profilePath;

  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    required this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json['id'],
        creditId: json['credit_id'],
        name: json['name'],
        gender: json['gender'],
        profilePath: json['profile_path'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'credit_id': creditId,
        'name': name,
        'gender': gender,
        'profile_path': profilePath,
      };
}
