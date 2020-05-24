import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviezz/base/constants.dart';
import 'package:moviezz/model/people_response.dart';
import 'package:moviezz/ui/people/actor_bloc.dart';
import 'package:moviezz/ui/people/actors_events.dart';

class Actors extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ActorsState();
  }
}

class ActorsState extends State<Actors> {
  final actorsBloc = ActorsBloc();

  @override
  void initState() {
    actorsBloc.actorsEvent.add(FetchPopularActorsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todo add ViewPager
      body: StreamBuilder(
        stream: actorsBloc.popularActorsResponse,
        initialData: actorsInitialData,
        builder: (BuildContext buildContext,
            AsyncSnapshot<PeopleResponse> snapshot) {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: snapshot.data.results.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(ApiImageBaseUrl +
                                      snapshot
                                          .data.results[index].profilePath))),
//                      child: Hero(
//                          tag: snapshot.data.results[index].profilePath,
//                          child: CachedNetworkImage(
//                              imageUrl: ApiImageBaseUrl +
//                                  snapshot.data.results[index].profilePath,
//                              placeholder: (context, url) => Center(
//                                    child: SizedBox(
//                                        height: 50,
//                                        width: 50,
//                                        child: CircularProgressIndicator()),
//                                  ),
//                              errorWidget: (context, url, error) =>
//                                  Icon(Icons.error))),
                        ),
                      ),
                      Center(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(snapshot.data.results[index].name)),
                      )
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
