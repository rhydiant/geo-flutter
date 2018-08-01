import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:geo/models/geo_keys.dart';
import 'package:geo/widgets/geo_activity_indicator_widget.dart';

///
/// Renders an image of a map, centered at the given coordinates.
///
/// Static image is rendered with a button to expand into an
/// interactive map.
///

class GeoMapImage extends StatelessWidget {
  final String title;
  final double lat;
  final double long;
  final double height;

  const GeoMapImage(
      {Key key,
      @required this.title,
      @required this.lat,
      @required this.long,
      @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var staticMapProvider = new StaticMapProvider(googleMapsApiKey);
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        Container(
          height: height,
          child: CachedNetworkImage(
            placeholder: GeoActivityIndicator(),
            fit: BoxFit.cover,
            imageUrl: staticMapProvider
                .getStaticUri(
                  Location(lat, long),
                  12,
                  height: 400,
                  mapType: StaticMapViewType.roadmap,
                )
                .toString(),
          ),
        ),
        Positioned(
          bottom: 8.0,
          right: 8.0,
          child: FloatingActionButton(
            mini: true,
            onPressed: () {},
            child: IconButton(
              onPressed: () {
                _showMap(title: title, long: long, lat: lat);
              },
              icon: Icon(Icons.fullscreen),
            ),
          ),
        ),
      ],
    );
  }

  void _showMap({String title, double long, double lat}) {
    MapView mapView = new MapView();
    mapView.onToolbarAction.listen((id) {
      mapView.dismiss();
    });
    mapView.show(
        new MapOptions(
          showUserLocation: true,
          showCompassButton: true,
          showMyLocationButton: true,
          title: title,
          initialCameraPosition: CameraPosition(Location(lat, long), 14.0),
        ),
        toolbarActions: [new ToolbarAction("Close", 1)]);
  }
}
