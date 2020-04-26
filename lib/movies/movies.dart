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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          // now playing movies
          StreamBuilder(
            stream: moviesBloc.nowPlayingResponse,
            initialData: moviesInitialData,
            builder: (BuildContext buildContext,
                AsyncSnapshot<NowPlayingResponse> snapshot) {
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
