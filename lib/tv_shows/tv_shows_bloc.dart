import 'dart:async';
import 'dart:convert';

import 'package:moviezz/base/constants.dart';
import 'package:moviezz/base/secret.dart';
import 'package:moviezz/model/tv_response.dart';
import 'package:moviezz/model/tv_show.dart';
import 'package:moviezz/tv_shows/tv_show_events.dart';
import 'package:http/http.dart';

class TvShowsBloc {
  final _arrivingTodayResponseController = StreamController<TvResponse>();
  final _onTheAirResponseController = StreamController<TvResponse>();
  final _popularResponseController = StreamController<TvResponse>();
  final _topRatedResponseController = StreamController<TvResponse>();

  final _tvShowsEventController = StreamController<TvShowEvent>();

  Stream<TvResponse> get arrivingTodayResponse =>
      _arrivingTodayResponseController.stream;

  Stream<TvResponse> get onTheAirResponse =>
      _onTheAirResponseController.stream;

  Stream<TvResponse> get popularResponse =>
      _popularResponseController.stream;

  Stream<TvResponse> get topRatedResponse =>
      _topRatedResponseController.stream;

  StreamSink<TvShowEvent> get currentEvent => _tvShowsEventController.sink;

  TvShowsBloc() {
    _tvShowsEventController.stream.listen(_handleIncommingEvents);
  }

  void _handleIncommingEvents(TvShowEvent tvShowEvent) {
    if (tvShowEvent is FetchArrivingTodayEvent) {
      _fetchMovies(
          TvShowArrivingTodayEndpoint, _arrivingTodayResponseController);
    } else if (tvShowEvent is FetchOnTheAirEvent) {
      _fetchMovies(TvShowOnTheAirEndpoint, _onTheAirResponseController);
    } else if (tvShowEvent is FetchPopularEvent) {
      _fetchMovies(TvShowPopularEndpoint, _popularResponseController);
    } else if (tvShowEvent is FetchTopRatedEvent) {
      _fetchMovies(TvShowTopRatedEndpoint, _topRatedResponseController);
    }
  }

  void _fetchMovies(String endpoint,
      StreamController<TvResponse> currentController) async {
    var result = await get(ApiBaseUrl + endpoint + ApiKeyKey + ApiKeyValue);

    if (result.statusCode == 200) {
      TvResponse response = TvResponse.fromJson(json.decode(result.body));
      currentController.add(response);
    }
  }

  void dispose() {
    _arrivingTodayResponseController.close();
    _onTheAirResponseController.close();
    _popularResponseController.close();
    _topRatedResponseController.close();
  }
}