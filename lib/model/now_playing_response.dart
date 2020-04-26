import 'movie.dart';

class MovieResponse {
  List<Movie> results;

  MovieResponse({this.results});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
        results: json["results"] != null
            ? List<Movie>.from(json["results"].map((x) => Movie.fromJson(x)))
            : List<Movie>());
  }
}
