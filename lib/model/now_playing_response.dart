import 'movie.dart';

class NowPlayingResponse {
  List<Movie> results;

  NowPlayingResponse({this.results});

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) {
    return NowPlayingResponse(
        results: json["results"] != null
            ? List<Movie>.from(json["results"].map((x) => Movie.fromJson(x)))
            : List<Movie>());
  }
}
