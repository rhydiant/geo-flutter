import 'package:flutter/material.dart';

import 'package:geo/models/geo_location.dart';
import 'package:geo/models/geo_client.dart';

import 'package:geo/widgets/geo_list_widget.dart';
import 'package:geo/widgets/geo_error_widget.dart';

///
/// Renders a progress indicator while loading locations.
///
/// On success, will render the [GeoList] widget, on error
/// an [GeoError] widget for the user to retry.
///

class GeoListLoader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeoListLoaderState();
}

class GeoListLoaderState extends State<GeoListLoader>
    with TickerProviderStateMixin {
  final GeoClient geoClient = GeoClient();
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      duration: new Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<GeoLocation>>(
      future: geoClient.fetchLocations(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: GeoError(action: () {
              setState(() {});
            }),
          );
        }

        if (snapshot.hasData) {
          return GeoList(
            locations: snapshot.data,
            animationController: animationController,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
