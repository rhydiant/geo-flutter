import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:geo/models/geo_keys.dart';

///
/// Renders an image of a map, centered at the given coordinates.
///

class GeoMapImage extends StatelessWidget {
  final double lat;
  final double long;
  final double height;

  const GeoMapImage(
      {Key key, @required this.lat, @required this.long, @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var staticMapProvider = new StaticMapProvider(googleMapsApiKey);
    return Hero(
      tag: 'mapHeroTag_${long}_$lat',
      child: Container(
        height: height,
        child: CachedNetworkImage(
          placeholder: LinearProgressIndicator(),
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
    );
  }
}
