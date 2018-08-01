import 'package:flutter/material.dart';

import 'package:geo/models/geo_location.dart';
import 'package:geo/models/geo_layout.dart';

import 'package:geo/widgets/geo_hero_header_widget.dart';
import 'package:geo/widgets/geo_map_image_widget.dart';
import 'package:geo/widgets/geo_rating_widget.dart';

///
/// Renders location details.
///

class GeoDetail extends StatelessWidget {
  final GeoLocation location;
  final String imageName;

  const GeoDetail({
    Key key,
    @required this.location,
    @required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GeoHeroHeader(
            title: location.name,
            imageName: imageName,
          ),
          Container(
            padding: EdgeInsets.only(
              top: standardPadding,
              left: standardPadding,
            ),
            child: Text(
              '${location.name}',
              style: TextStyle(fontSize: 21.0),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: standardPadding,
              top: standardHalfPadding,
            ),
            child: GeoRating(score: 2),
          ),
          Container(
            padding: EdgeInsets.all(standardPadding),
            child: GeoMapImage(
              title: location.name,
              long: location.long,
              lat: location.lat,
              height: 150.0,
            ),
          )
        ],
      ),
    );
  }
}
