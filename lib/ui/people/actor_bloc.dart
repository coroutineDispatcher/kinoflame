import 'dart:async';
import 'dart:convert';

import 'package:moviezz/base/constants.dart';
import 'package:moviezz/base/secret.dart';
import 'package:moviezz/model/people_response.dart';
import 'package:moviezz/ui/people/actors_events.dart';
import 'package:http/http.dart';

class ActorsBloc {
  final _peopleResponseController = StreamController<PeopleResponse>();

  final _actorsEventController = StreamController<ActorsEvent>();

  Stream<PeopleResponse> get popularActorsResponse =>
      _peopleResponseController.stream;

  StreamSink<ActorsEvent> get actorsEvent => _actorsEventController.sink;

  ActorsBloc() {
    _actorsEventController.stream.listen(_handleIncomingActorEvents);
  }

  void _handleIncomingActorEvents(ActorsEvent actorsEvents) {
    if (actorsEvents is FetchPopularActorsEvent) {
      fetchActors();
    }
  }

  // Todo chane for all type of requests
  void fetchActors() async {
    var result = await get(
        ApiBaseUrl + "/person/popular" + ApiKeyKey + ApiKeyValue);

    if (result.statusCode == 200) {
      PeopleResponse peopleResponse = PeopleResponse.fromJson(
          json.decode(result.body));
      _peopleResponseController.add(peopleResponse);
    }
  }

  void dispose() {
    _peopleResponseController.close();
    _actorsEventController.close();
  }
}