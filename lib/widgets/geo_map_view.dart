import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:map_view/map_view.dart';
import 'package:location/location.dart' as ExtLocation;

/// Renders a static map view
class GeoMapView extends StatefulWidget {
  @override
  _GeoMapViewState createState() => _GeoMapViewState();
}

class _GeoMapViewState extends State<GeoMapView> {
  MapView mapView = new MapView();

  CameraPosition cameraPosition;

  var staticMapProvider =
      new StaticMapProvider('AIzaSyAPwd3T20GAEy2L-Rjg_AL0pEJjzflUr4c');

  Uri staticMapUri;

  @override
  initState() {
    super.initState();
    cameraPosition = new CameraPosition(Locations.portland, 2.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        child: FloatingActionButton(
          onPressed: showMap,
          child: Icon(Icons.fullscreen),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: FutureBuilder(
          future: lookupCurrentLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GestureDetector(
                onTap: showMap,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: staticMapProvider
                      .getStaticUri(
                          Location(snapshot.data['latitude'],
                              snapshot.data['longitude']),
                          12,
                          width: 400,
                          height: 1200,
                          mapType: StaticMapViewType.roadmap)
                      .toString(),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<Map<String, double>> lookupCurrentLocation() async {
    return await ExtLocation.Location().getLocation;
  }

  void showMap() {
    mapView.onToolbarAction.listen((id) {
      mapView.dismiss();
    });
    mapView.show(
        new MapOptions(
            showUserLocation: true,
            showCompassButton: true,
            showMyLocationButton: true,
            title: 'Some title'),
        toolbarActions: [new ToolbarAction("Close", 1)]);
  }
}
