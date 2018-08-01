import 'package:flutter/material.dart';

import 'package:geo/models/geo_colors.dart';

///
/// Represents app themes
///

class GeoTheme {
  static ThemeData build() {
    final ThemeData base = ThemeData(
      fontFamily: 'Montserrat',
    );
    return base.copyWith(
        accentIconTheme: IconThemeData(
          color: GeoColors.black,
        ),
        brightness: Brightness.dark,
        accentColor: GeoColors.black,
        backgroundColor: GeoColors.black,
        disabledColor: GeoColors.black,
        primaryColor: GeoColors.white,
        primaryColorLight: GeoColors.black,
        primaryColorDark: GeoColors.black,
        buttonColor: GeoColors.white,
        textTheme: buildGeoTextTheme(base.textTheme));
  }

  static TextTheme buildGeoTextTheme(TextTheme base) {
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
}
