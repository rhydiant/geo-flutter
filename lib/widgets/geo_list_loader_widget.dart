import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:geo/models/geo_location.dart';
import 'package:geo/models/geo_client.dart';
import 'package:geo/widgets/geo_activity_indicator_widget.dart';

import 'package:geo/widgets/geo_list_widget.dart';
import 'package:geo/widgets/geo_error_widget.dart';

///
/// Renders a progress indicator while loading locations.
///
/// On success, will render the [GeoList] widget, on error
/// an [GeoError] widget for the user to retry.
///

class GeoListLoader extends StatelessWidget {
  final GeoClient geoClient = GeoClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<GeoLocation>>(
        future: geoClient.fetchLocations(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return GeoError(
              action: () {
                print("todo: rety");
              },
            );
          }
          if (snapshot.hasData) {
            return GeoList(locations: snapshot.data);
          } else {
            return GeoActivityIndicator();
          }
        },
      ),
    );
  }
}
