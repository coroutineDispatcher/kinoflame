import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviezz/base/constants.dart';
import 'package:moviezz/model/tv_response.dart';
import 'package:moviezz/ui/tv_shows/tv_show_events.dart';
import 'package:moviezz/ui/tv_shows/tv_show_list_row.dart';
import 'package:moviezz/ui/tv_shows/tv_shows_bloc.dart';

class TvShows extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TvShowsSate();
  }
}

class TvShowsSate extends State<TvShows> {
  final tvShowsBloc = TvShowsBloc();

  @override
  void initState() {
    tvShowsBloc.currentEvent.add(FetchArrivingTodayEvent());
    tvShowsBloc.currentEvent.add(FetchOnTheAirEvent());
    tvShowsBloc.currentEvent.add(FetchPopularEvent());
    tvShowsBloc.currentEvent.add(FetchTopRatedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Arriving today",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontSize: 24),
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: tvShowsBloc.arrivingTodayResponse,
              initialData: tvShowsInitialData,
              builder: (BuildContext buildContext,
                  AsyncSnapshot<TvResponse> snapshot) {
                return TvShowListRow(snapshot.data.results);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "On the air",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontSize: 24),
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: tvShowsBloc.onTheAirResponse,
              initialData: tvShowsInitialData,
              builder: (BuildContext buildContext,
                  AsyncSnapshot<TvResponse> snapshot) {
                return TvShowListRow(snapshot.data.results);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Popular",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontSize: 24),
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: tvShowsBloc.popularResponse,
              initialData: tvShowsInitialData,
              builder: (BuildContext buildContext,
                  AsyncSnapshot<TvResponse> snapshot) {
                return TvShowListRow(snapshot.data.results);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Top rated",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontSize: 24),
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: tvShowsBloc.topRatedResponse,
              initialData: tvShowsInitialData,
              builder: (BuildContext buildContext,
                  AsyncSnapshot<TvResponse> snapshot) {
                return TvShowListRow(snapshot.data.results);
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tvShowsBloc.dispose();
    super.dispose();
  }
}
