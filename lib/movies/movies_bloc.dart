import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:moviezz/base/constants.dart';
import 'package:moviezz/base/secret.dart';
import 'package:moviezz/model/now_playing_response.dart';
import 'package:moviezz/movies/movies_events.dart';

class MoviesBloc {
  final _nowPlayingResponseController = StreamController<MovieResponse>();
  final _upcommingResponseController = StreamController<MovieResponse>();

  final _moviesEventController = StreamController<MoviesEvent>();

  Stream<MovieResponse> get nowPlayingResponse =>
      _nowPlayingResponseController.stream;

  Stream<MovieResponse> get upcomingResponse =>
      _upcommingResponseController.stream;

  StreamSink<MoviesEvent> get currentEvent => _moviesEventController.sink;

  MoviesBloc() {
    _moviesEventController.stream.listen(_handleIncommingEvents);
  }

  void _handleIncommingEvents(MoviesEvent moviesEvent) {
    if (moviesEvent is FetchNowPlayingMoviesEvent) {
      _fetchMovies(NowPlayingEndpoint, _nowPlayingResponseController);
    } else if (moviesEvent is FetchUpcomingMoviesEvent) {
      _fetchMovies(UpcommingEndpoint, _upcommingResponseController);
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
    _nowPlayingResponseController.close();
    _upcommingResponseController.close();
    _moviesEventController.close();
  }
}
