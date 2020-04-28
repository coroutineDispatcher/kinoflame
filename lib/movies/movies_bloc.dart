import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:moviezz/base/constants.dart';
import 'package:moviezz/base/secret.dart';
import 'package:moviezz/model/movie_response.dart';
import 'package:moviezz/movies/movies_events.dart';

class MoviesBloc {
  final _nowPlayingMoviesResponseController = StreamController<MovieResponse>();
  final _upcommingMoviesResponseController = StreamController<MovieResponse>();
  final _popularMoviesResponseController = StreamController<MovieResponse>();
  final _topRatedMoviesResponseController = StreamController<MovieResponse>();

  final _moviesEventController = StreamController<MoviesEvent>();

  Stream<MovieResponse> get nowPlayingMoviesResponse =>
      _nowPlayingMoviesResponseController.stream;

  Stream<MovieResponse> get topRatedMovieResponse =>
      _topRatedMoviesResponseController.stream;

  Stream<MovieResponse> get upcomingMoviesResponse =>
      _upcommingMoviesResponseController.stream;

  Stream<MovieResponse> get popularMoviesResponse =>
      _popularMoviesResponseController.stream;

  StreamSink<MoviesEvent> get currentEvent => _moviesEventController.sink;

  MoviesBloc() {
    _moviesEventController.stream.listen(_handleIncommingEvents);
  }

  void _handleIncommingEvents(MoviesEvent moviesEvent) {
    if (moviesEvent is FetchNowPlayingMoviesEvent) {
      _fetchMovies(NowPlayingEndpoint, _nowPlayingMoviesResponseController);
    } else if (moviesEvent is FetchUpcomingMoviesEvent) {
      _fetchMovies(UpcommingEndpoint, _upcommingMoviesResponseController);
    } else if (moviesEvent is FetchPopularMoviesEvent) {
      _fetchMovies(PopularEndpoint, _popularMoviesResponseController);
    } else if (moviesEvent is FetchTopRatedMoviesEvent) {
      _fetchMovies(TopRatedEndpoint, _topRatedMoviesResponseController);
    }
  }

  void _fetchMovies(String endpoint,
      StreamController<MovieResponse> currentController) async {
    var result = await get(ApiBaseUrl + endpoint + ApiKeyKey + ApiKeyValue);

    if (result.statusCode == 200) {
      MovieResponse response = MovieResponse.fromJson(json.decode(result.body));
      currentController.add(response);
    }
  }

  void dispose() {
    _nowPlayingMoviesResponseController.close();
    _upcommingMoviesResponseController.close();
    _popularMoviesResponseController.close();
    _topRatedMoviesResponseController.close();
    _moviesEventController.close();
  }
}
