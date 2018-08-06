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
    const Center(
      child: const Text('favorites tab'),
    ),
    const Center(
      child: const Text('profile tab'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
        ),
        elevation: 0.5,
        actions: _currentIndex == 0
            ? <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.search,
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
            title: Container(child: const Text(''), height: 0.0),
            icon: Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: const Icon(Icons.photo, color: GeoColors.black),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(child: const Text(''), height: 0.0),
            icon: Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: const Icon(
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
