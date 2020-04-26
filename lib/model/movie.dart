import "dart:ffi";

class Movie {
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  dynamic voteAverage;
  String overview;
  String releaseDate;

  Movie(
      {this.video,
      this.posterPath,
      this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.title,
      this.voteAverage,
      this.overview,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: json['genre_ids'].cast<int>(),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: json["release_date"]);
  }
}
