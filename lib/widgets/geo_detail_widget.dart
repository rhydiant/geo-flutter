import 'package:flutter/material.dart';

import 'package:geo/models/geo_location.dart';
import 'package:geo/models/geo_layout.dart';

import 'package:geo/widgets/geo_hero_header.dart';

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
            padding: EdgeInsets.all(standardPadding),
            child: Text(
              '${location.name}',
              style: TextStyle(
                fontSize: 21.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
