import 'package:flutter/material.dart';

import 'package:geo/models/geo_colors.dart';

import 'package:geo/widgets/geo_drawer_widget.dart';
import 'package:geo/widgets/geo_list_loader_widget.dart';
import 'package:geo/widgets/geo_search_widget.dart';

///
/// Renders the main app navigation structure (tabs).
///

class GeoHome extends StatefulWidget {
  @override
  _GeoHomeState createState() => _GeoHomeState();
}

class _GeoHomeState extends State<GeoHome> {
  int _currentIndex = 0;

  final List<String> _titles = ['Discover', 'Favorites', 'Profile'];

  final List<Widget> _children = [
    Center(
      child: GeoListLoader(),
    ),
    Center(
      child: Text('favorites tab'),
    ),
    Center(
      child: Text('profile tab'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: GeoColors.black,
        ),
        title: Text(
          _titles[_currentIndex],
          style: TextStyle(color: GeoColors.black),
        ),
        elevation: 0.5,
        actions: _currentIndex == 0
            ? <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: GeoColors.black,
                  ),
                  onPressed: () {
                    Navigator
                        .of(context)
                        .push(
                          MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                                return GeoSearch();
                              },
                              fullscreenDialog: true),
                        )
                        .then((value) {
                      print('handle modal dismiss');
                    });
                  },
                ),
              ]
            : [],
      ),
      drawer: GeoDrawer(),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Container(child: Text(''), height: 0.0),
            icon: Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.map,
                color: GeoColors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(child: Text(''), height: 0.0),
            icon: Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.photo,
                color: GeoColors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(child: Text(''), height: 0.0),
            icon: Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.person,
                color: GeoColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
