import 'package:flutter/material.dart';

import 'package:geo/models/geo_colors.dart';

///
/// Represents app themes
///

class GeoTheme {
  static ThemeData build() {
    return ThemeData(
      fontFamily: 'Montserrat',
      primaryColor: Colors.white,
      primaryColorBrightness: Brightness.light,
      primaryIconTheme: IconThemeData(
        color: GeoColors.black,
      ),
    );
  }
}
