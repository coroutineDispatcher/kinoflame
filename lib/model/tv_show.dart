class TvShow {
  String originalName;
  List<int> genreIds;
  String name;
  List<String> originOfCountry;
  String firstAirDate;
  String backdropPath;
  String originalLanguage;
  int id;
  double voteAverage;
  String overview;
  String posterPath;

  TvShow({this.originalName,
    this.genreIds,
    this.name,
    this.originOfCountry,
    this.firstAirDate,
    this.backdropPath,
    this.originalLanguage,
    this.id,
    this.voteAverage,
    this.overview,
    this.posterPath});

  factory TvShow.fromJson(Map<String, dynamic> json){
    return TvShow(
        originalName: json["original_name"],
        genreIds: json["genre_ids"].cast<int>(),
        name: json["name"],
        originOfCountry: json["origin_country"].cast<String>(),
        firstAirDate: json["first_air_date"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        id: json["id"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        posterPath: json["poster_path"]
    );
  }
}
