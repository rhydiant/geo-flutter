import 'package:flutter/material.dart';

import 'geo_home_widget.dart';

///
/// Root app widget rendering core scaffold
///

class GeoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildGeoTheme(),
      home: GeoHome(),
    );
  }
}

///
/// Theme
///

ThemeData _buildGeoTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.white,
  );
}
