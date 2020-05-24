class People {
  dynamic popularity;
  String name;
  int id;
  String profilePath;

  People({this.popularity, this.name, this.id, this.profilePath});

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
        popularity: json["popularity"].toDouble(),
        name: json["name"],
        id: json["id"],
        profilePath: json["profile_path"]);
  }
}
