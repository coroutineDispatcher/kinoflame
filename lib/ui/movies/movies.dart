import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviezz/base/constants.dart';
import 'package:moviezz/model/movie_response.dart';

import 'movie_list_row.dart';
import 'movies_bloc.dart';
import 'movies_events.dart';

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
    moviesBloc.currentEvent.add(FetchPopularMoviesEvent());
    moviesBloc.currentEvent.add(FetchTopRatedMoviesEvent());
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
              stream: moviesBloc.nowPlayingMoviesResponse,
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
                    "Upcoming",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontSize: 24),
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: moviesBloc.upcomingMoviesResponse,
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
              stream: moviesBloc.popularMoviesResponse,
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
              stream: moviesBloc.topRatedMovieResponse,
              initialData: moviesInitialData,
              builder: (BuildContext buildContext,
                  AsyncSnapshot<MovieResponse> snapshot) {
                return MovieListRow(snapshot.data.results);
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    moviesBloc.dispose();
    super.dispose();
  }
}
