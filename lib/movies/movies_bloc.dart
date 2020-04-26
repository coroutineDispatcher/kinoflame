import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:moviezz/base/constants.dart';
import 'package:moviezz/base/secret.dart';
import 'package:moviezz/model/now_playing_response.dart';
import 'package:moviezz/movies/movies_events.dart';

class MoviesBloc {
  final _nowPlayingResponseController = StreamController<NowPlayingResponse>();
  final _moviesEventController = StreamController<MoviesEvent>();

  Stream<NowPlayingResponse> get nowPlayingResponse =>
      _nowPlayingResponseController.stream;

  StreamSink<MoviesEvent> get currentEvent => _moviesEventController.sink;

  MoviesBloc() {
    _moviesEventController.stream.listen(_handleIncommingEvents);
  }

  void _handleIncommingEvents(MoviesEvent moviesEvent) {
    if (moviesEvent is FetchNowPlayingMoviesEvent) {
      fetchNowPlayingMovies();
    }
  }

  void fetchNowPlayingMovies() async {
    var result = await get(ApiBaseUrl +
        NowPlayingEndpoint +
        ApiKeyKey +
        ApiKeyValue);

    if (result.statusCode == 200) {
      NowPlayingResponse response =
          NowPlayingResponse.fromJson(json.decode(result.body));
      _nowPlayingResponseController.add(response);
    }
  }

  void dispose() {
    _nowPlayingResponseController.close();
    _moviesEventController.close();
  }
}
