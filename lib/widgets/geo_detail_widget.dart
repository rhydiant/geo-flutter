import 'package:flutter/material.dart';

import '../models/geo_location.dart';
import '../models/geo_layout.dart';

import 'geo_map_image_widget.dart';

///
/// Renders location details.
///

class GeoDetail extends StatelessWidget {
  final GeoLocation location;

  const GeoDetail({
    Key key,
    @required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: GeoMapImage(
                lat: location.lat,
                long: location.long,
                height: 300.0,
              ),
            ),
            pinned: true,
            expandedHeight: 300.0,
            elevation: 0.5,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(standardPadding),
                  child: Text(
                    '${location.name}',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: standardPadding),
                  child: Text(
                    '${location.distance}Km',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(standardPadding),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
