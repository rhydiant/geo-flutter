import 'package:flutter/material.dart';
import 'package:geo/widgets/geo_rating.dart';

import 'geo_detail_widget.dart';

import '../models/geo_location.dart';
import '../models/geo_layout.dart';
import '../models/geo_colors.dart';

///
/// Renders an individual location list item
///

class GeoListItem extends StatelessWidget {
  final GeoLocation location;
  final String imageName;

  const GeoListItem(
      {Key key, @required this.location, @required this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return GeoDetail(location: location, imageName: imageName);
        }));
      },
      child: Card(
        elevation: 3.0,
        margin: EdgeInsets.only(
            top: standardPadding,
            bottom: standardHalfPadding,
            left: standardPadding,
            right: standardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                child: Hero(
              tag: imageName,
              child: Image(
                image: AssetImage(imageName),
              ),
            )),
            Padding(
              padding: EdgeInsets.only(
                left: standardPadding,
                top: standardPadding,
                bottom: standardHalfPadding,
              ),
              child: Text(
                '${location.name}',
                style: TextStyle(
                  fontSize: 17.0,
                  color: GeoColors.black,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: standardPadding,
                      bottom: standardPadding,
                      right: 4.0),
                  child: Rating(score: 2),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.0, bottom: standardPadding),
                  child: Text(
                    '• ${location.distance} KM NEARBY',
                    style: TextStyle(
                      fontSize: 11.0,
                      color: GeoColors.darkGrey,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
