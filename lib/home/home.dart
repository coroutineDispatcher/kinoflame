import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviezz/home/navigation_bloc.dart';
import 'package:moviezz/home/navigation_event.dart';
import 'package:moviezz/ui/movies/movies.dart';
import 'package:moviezz/ui/people/actors.dart';
import 'package:moviezz/ui/tv_shows/tv_shows.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final navigationBloc = NavigationBloc();

  final List<Widget> _children = [
    Movies(),
    TvShows(),
    Center(
      child: Text("Search comming soon"),
    ),
    Center(
      child: Actors(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: navigationBloc.position,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return Scaffold(
          body: _children[snapshot.data],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepPurple,
            currentIndex: snapshot.data,
            onTap: (position) =>
                navigationBloc.currentEvent.add(NavigationEvent(position)),
            items: [
              BottomNavigationBarItem(
                  icon: new Icon(Icons.movie), title: new Text("Movies")),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.satellite), title: new Text("TV Shows")),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.search), title: new Text("Search")),
              BottomNavigationBarItem(
                  icon: new Icon(Icons.person), title: new Text("People")),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    navigationBloc.dispose();
    super.dispose();
  }
}
