import 'package:flutter/material.dart';

import 'package:geo/models/geo_theme.dart';
import 'package:geo/widgets/geo_home_widget.dart';

///
/// Root app widget rendering core scaffold
///

class GeoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: GeoTheme.build(),
      home: GeoHome(),
    );
  }
}
