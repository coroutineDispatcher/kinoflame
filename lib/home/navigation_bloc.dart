import 'dart:async';

import 'package:moviezz/home/navigation_event.dart';

class NavigationBloc {
  final _positionStateController = StreamController<int>();

  StreamSink<int> get _positionCounter => _positionStateController.sink;

  Stream<int> get position => _positionStateController.stream;

  final _navigationEventController = StreamController<NavigationEvent>();

  Sink<NavigationEvent> get currentEvent => _navigationEventController.sink;

  NavigationBloc() {
    _navigationEventController.stream.listen(_changeNavigationPosition);
  }

  void _changeNavigationPosition(NavigationEvent navigationEvent) {
    _positionCounter.add(navigationEvent.position);
  }

  void dispose() {
    _positionStateController.close();
    _navigationEventController.close();
  }
}
