import 'package:flutter/material.dart';

import '../models/geo_location.dart';
import '../models/geo_layout.dart';

import 'geo_map_image_widget.dart';

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
          HeroHeader(
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

class HeroHeader extends StatelessWidget {
  final String title;
  final String imageName;

  const HeroHeader({Key key, @required this.title, @required this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: imageName,
          child: Image(
            image: AssetImage(imageName),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
            child: SafeArea(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )),
        Positioned(
          left: standardPadding,
          bottom: standardPadding,
          child: Text('$title',
              style: TextStyle(
                fontSize: 21.0,
              )),
        ),
      ],
    );
  }
}
