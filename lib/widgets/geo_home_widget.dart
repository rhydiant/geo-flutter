import 'package:flutter/material.dart';

import 'geo_list_loader_widget.dart';

///
/// Renders the main app navigation structure (tabs).
///

class GeoHome extends StatefulWidget {
  @override
  _GeoHomeState createState() => _GeoHomeState();
}

class _GeoHomeState extends State<GeoHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Center(
      child: GeoListLoader(),
    ),
    Center(
      child: Text('discover tab'),
    ),
    Center(
      child: Text('profile tab'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: Text(
              'nearby',
            ),
            icon: Icon(
              Icons.list,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              'discover',
            ),
            icon: Icon(
              Icons.map,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              'profile',
            ),
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
