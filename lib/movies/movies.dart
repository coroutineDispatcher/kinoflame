import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviezz/base/constants.dart';
import 'package:moviezz/model/now_playing_response.dart';
import 'package:moviezz/movies/movie_list_row.dart';
import 'package:moviezz/movies/movies_bloc.dart';
import 'package:moviezz/movies/movies_events.dart';

class Movies extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoviesState();
  }
}

class MoviesState extends State<Movies> {
  MoviesBloc moviesBloc = MoviesBloc();

  @override
  void initState() {
    moviesBloc.currentEvent.add(FetchNowPlayingMoviesEvent());
    moviesBloc.currentEvent.add(FetchUpcomingMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  "Now Playing",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 24),
                ),
              ),
            ),
          ),
          StreamBuilder(
            stream: moviesBloc.nowPlayingResponse,
            initialData: moviesInitialData,
            builder: (BuildContext buildContext,
                AsyncSnapshot<MovieResponse> snapshot) {
              return MovieListRow(snapshot.data.results);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  "Upcoming movies",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 24),
                ),
              ),
            ),
          ),
          StreamBuilder(
            stream: moviesBloc.upcomingResponse,
            initialData: moviesInitialData,
            builder: (BuildContext buildContext,
                AsyncSnapshot<MovieResponse> snapshot) {
              return MovieListRow(snapshot.data.results);
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    moviesBloc.dispose();
    super.dispose();
  }
}
