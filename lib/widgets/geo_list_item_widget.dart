import 'package:flutter/material.dart';

import 'geo_detail_widget.dart';
import 'geo_map_image_widget.dart';

import '../models/geo_location.dart';
import '../models/geo_layout.dart';

///
/// Renders an individual location list item
///

class GeoListItem extends StatelessWidget {
  final GeoLocation location;

  const GeoListItem({
    Key key,
    @required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return GeoDetail(location: location);
        }));
      },
      child: Card(
        margin: EdgeInsets.only(
            top: standardHalfPadding,
            bottom: standardHalfPadding,
            left: standardHalfPadding,
            right: standardHalfPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.map),
                ),
                Expanded(
                  child: Text(
                    '${location.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: standardHalfPadding),
                  child: Text(
                    '${location.distance}km',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                  left: standardHalfPadding,
                  right: standardHalfPadding,
                  bottom: standardHalfPadding),
              child: Text(
                '${location.region}, ${location.state}',
              ),
            ),
            Container(
              child: GeoMapImage(
                lat: location.lat,
                long: location.long,
                height: 180.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
