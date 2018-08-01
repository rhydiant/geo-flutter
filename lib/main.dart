import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

import 'models/geo_keys.dart';
import 'widgets/geo_app_widget.dart';

void main() {
  MapView.setApiKey(googleMapsApiKey);
  runApp(GeoApp());
}
