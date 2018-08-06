import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

import 'package:geo/models/geo_keys.dart';
import 'package:geo/widgets/geo_app_widget.dart';

///
/// App entry point, see [GeoApp]
///

void main() {
  GeoKeys.load().then((value) {
    MapView.setApiKey(value.googleMapsApiKey);
  });

  runApp(GeoApp());
}
