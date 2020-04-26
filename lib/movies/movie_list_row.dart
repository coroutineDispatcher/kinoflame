import 'package:flutter/cupertino.dart';
import 'package:moviezz/base/constants.dart';
import 'package:moviezz/model/movie.dart';

class MovieListRow extends StatelessWidget {
  final List<Movie> movies;

  MovieListRow(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Hero(
                tag: movies[index].posterPath,
                child: FadeInImage(
                    image: NetworkImage(
                        ApiImageBaseUrl + movies[index].posterPath),
                    placeholder:
                        AssetImage("lib/assets/images/movie_placeholder.png"),
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
