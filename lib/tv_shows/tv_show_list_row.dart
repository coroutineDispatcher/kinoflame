import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviezz/base/constants.dart';
import 'package:moviezz/model/tv_show.dart';

class TvShowListRow extends StatelessWidget {
  final List<TvShow> tvShows;

  TvShowListRow(this.tvShows);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: tvShows.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Hero(
                tag: tvShows[index].posterPath,
                child: CachedNetworkImage(
                    imageUrl: ApiImageBaseUrl + tvShows[index].posterPath,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error)
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
