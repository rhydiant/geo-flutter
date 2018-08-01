import 'package:flutter/material.dart';

import 'package:geo/models/geo_colors.dart';

import 'package:geo/widgets/geo_home_widget.dart';

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
/// Themes
///

ThemeData _buildGeoTheme() {
  final ThemeData base = ThemeData(
    fontFamily: 'Montserrat',
  );
  return base.copyWith(
      accentColor: GeoColors.black,
      backgroundColor: GeoColors.black,
      disabledColor: GeoColors.black,
      primaryColor: GeoColors.white,
      primaryColorLight: GeoColors.black,
      primaryColorDark: GeoColors.black,
      buttonColor: GeoColors.black,
      textTheme: _buildGeoTextTheme(base.textTheme));
}

TextTheme _buildGeoTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          color: GeoColors.black,
        ),
        title: base.title.copyWith(
          fontSize: 14.0,
          color: GeoColors.black,
        ),
      )
      .apply(
        fontFamily: 'Montserrat',
      );
}
