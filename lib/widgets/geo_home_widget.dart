import 'package:flutter/material.dart';

import 'package:geo/models/geo_colors.dart';

import 'package:geo/widgets/geo_list_loader_widget.dart';

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
            title: Container(child: Text(''), height: 0.0),
            icon: Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ImageIcon(
                AssetImage('assets/icons/map-normal.png'),
                color: GeoColors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(child: Text(''), height: 0.0),
            icon: Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ImageIcon(
                AssetImage('assets/icons/discover-normal.png'),
                color: GeoColors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            title: Container(child: Text(''), height: 0.0),
            icon: Container(
              padding: EdgeInsets.only(top: 10.0),
              child: ImageIcon(
                AssetImage('assets/icons/profile-normal.png'),
                color: GeoColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
