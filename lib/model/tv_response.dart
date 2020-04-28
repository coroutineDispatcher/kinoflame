import 'package:moviezz/model/tv_show.dart';

class TvResponse{
  List<TvShow> results;

  TvResponse({this.results});

  factory TvResponse.fromJson(Map<String, dynamic> json) {
    return TvResponse(
        results: json["results"] != null
            ? List<TvShow>.from(json["results"].map((x) => TvShow.fromJson(x)))
            : List<TvShow>());
  }
}