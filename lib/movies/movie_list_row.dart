import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviezz/model/movie.dart';

class MovieListRow extends StatelessWidget {
  final List<Movie> movies;

  MovieListRow(this.movies);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(movies.length.toString())
      ],
    );
  }
}
